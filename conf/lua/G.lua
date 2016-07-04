local mysql = require "resty.mysql"
local json = require "cjson.safe"
local random = require "resty.random"
local str = require "resty.string"

ngx.say(type(_G))
ngx.say(type(jit))

local tab = {name="frank", hobby="basketball"}
ngx.say(type(tab))

ngx.say(json.encode(tab))

hehe = "haha"

ngx.say(_G.hehe)
ngx.say(_G._VERSION)

for k, v in pairs(jit)
do
	if type(v) == "string" then
		ngx.say(k, " : ", v)
	end
end