local http = require "resty.http"
local json = require "cjson"



ngx.say("test begins...\n\n\n")
local httpc = http.new()

local uri = "https://github.com/pintsized/lua-resty-http/blob/master/Makefile"

local args = {}
args.method = "GET"
args.ssl_verify = false

local res, err = httpc:request_uri(uri, args)

if not res then
	ngx.say("failed to request: ", err)
	ngx.exit(ngx.HTTP_SERVICE_UNAVAILABLE)
end

ngx.say("headers:\n\n\n")
ngx.say(json.encode(res.headers))

ngx.say("body:\n\n\n")
ngx.say(res.body)