local http = require "resty.http"
local json = require "cjson.safe"
local random = require "resty.random"
local str = require "resty.string"

-- you need to change this path to suit your needs 
local result_path = "/tmp/api_test_clinet.result"

local function deepcopy(object)
    local lookup_table = {}

    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end

        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end

        return setmetatable(new_table, getmetatable(object))
    end

    return _copy(object)
end


-- these functions must be global because of loadstring
function rand_str(length)
    local tmpstr = str.to_hex(random.bytes(length, "strong"))
	return string.sub(tmpstr, 1, length)
end

function rand_num(m, n)
	return math.random(m, n)
end

function rand_email()
	return rand_str(8).."@"..rand_str(3)..".com"
end

function rand_phone()
	local phoneno = "136"
	for i = 1, 8
	do
		phoneno = phoneno..rand_num(0, 9)
	end
	return phoneno
end

local function replace_func_arg(func_str)
	local identifier = string.sub(func_str, 1, 1)
	if identifier ~= "@" then
		return func_str
	end
	
	-- must have "return" explicitly
	local func_real_str = "return "..string.sub(func_str, 2)
	ngx.log(ngx.DEBUG, "do function: ", func_real_str)
	
	return assert(loadstring(func_real_str))()
end

local function replace_tab_func_arg(tab)
	if type(tab) ~= "table" then
		return
	end
	
	for k, v in pairs(tab)
	do
		if type(v) == "string" then
			if v == "nil" then
				tab[k] = nil
			else
				tab[k] = replace_func_arg(v)
			end
		else
			replace_tab_func_arg(v)
		end
	end
	
end

local method_name = ngx.var.request_method
if method_name ~= "POST" then
    ngx.log(ngx.ERR, "not POST request.", method_name)
    ngx.exit(ngx.HTTP_BAD_REQUEST)
end

ngx.req.read_body()
local body_data = ngx.req.get_body_data()
ngx.log(ngx.DEBUG, "body data: ", body_data)

local body_json = json.decode(body_data)
if not body_json then
    ngx.log(ngx.ERR, "not a valid json.")
    ngx.exit(ngx.HTTP_BAD_REQUEST)
end


local file = io.open(result_path, "a")
if not file then
    ngx.log(ngx.ERR, "open "..result_path.." failed")
    ngx.exit(ngx.HTTP_SERVICE_UNAVAILABLE)	
end

-- no buffering
file:setvbuf("no")

local function log2file(tmpstr)
	
	if not tmpstr or type(tmpstr) ~= "string" then
		return
	end
	tmpstr = string.gsub(tmpstr, "\\/", "/")
	file:write(tmpstr.."\n")
	ngx.say(tmpstr)
end

local function log_header(request_tab)
	log2file("\n\n\n")
	log2file(ngx.localtime())
	log2file(json.encode(request_tab))
end


local function do_http_test(request_tab)
	local tmptab = deepcopy(request_tab) -- get a copy because we will change the table
	log2file("")
	if request_tab["repeat"] then
		log2file("times to repeat: "..request_tab["repeat"])
	end	
	
	log2file("original table: ")
	log2file(json.encode(tmptab))	
	replace_tab_func_arg(tmptab)
	log2file("replaced table: ")
	log2file(json.encode(tmptab))
	
	local httpc = http.new()
	local args = {}
	args.method = tmptab["method"]
	args.ssl_verify = false
	
	args.query = tmptab["query"]
	args.headers = tmptab["headers"]
	
	if tmptab["body"] then
		args.body = json.encode(tmptab["body"])
	end
	
	local res, err = httpc:request_uri(tmptab["uri"], args)

	if not res then
		ngx.say("failed to request: ", err)
		ngx.exit(ngx.HTTP_SERVICE_UNAVAILABLE)
	end
	
	log2file("status: "..res.status)
	log2file("headers:")
	log2file(json.encode(res.headers))
	log2file("body:")
	log2file(res.body)	
	
	-- now, this request can run many times
	if not request_tab["repeat"] then
		return
	end
	request_tab["repeat"] = tonumber(request_tab["repeat"]) - 1
	if request_tab["repeat"] > 0 then
		do_http_test(request_tab)
	end
	
	
end

for i, v in ipairs(body_json)
do
	if v["skip"] ~= true then
		log_header(v)
		do_http_test(v)
	else
		log2file("skiping "..v["uri"])
	end
end
