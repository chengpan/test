ngx.say("hello world !")

if jit then 
	ngx.say(jit.version)
else
	ngx.say(_VERSION)
end


