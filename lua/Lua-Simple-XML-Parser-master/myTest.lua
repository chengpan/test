#!/usr/bin/lua

local xml = require("xmlSimple").newParser()

local testXml = [==[
<xml>
  <appid><![CDATA[wxffacbf16422afa28]]></appid>
  <bank_type><![CDATA[CMB_CREDIT]]></bank_type>
  <cash_fee><![CDATA[1]]></cash_fee>
  <device_info><![CDATA[WEB]]></device_info>
  <fee_type><![CDATA[CNY]]></fee_type>
  <is_subscribe><![CDATA[Y]]></is_subscribe>
  <mch_id><![CDATA[1316265601]]></mch_id>
  <nonce_str><![CDATA[311afab296cb5016]]></nonce_str>
  <openid><![CDATA[oPA0Yv-pCBfbysSlMt7kxShxmBo4]]></openid>
  <out_trade_no><![CDATA[2016030112479]]></out_trade_no>
  <result_code><![CDATA[SUCCESS]]></result_code>
  <return_code><![CDATA[SUCCESS]]></return_code>
  <sign><![CDATA[48FB0624057D50AEB73F189DB05679B8]]></sign>
  <time_end><![CDATA[20160301192054]]></time_end>
  <total_fee>1</total_fee>
  <trade_type><![CDATA[JSAPI]]></trade_type>
  <transaction_id><![CDATA[1007330700201603013652572280]]></transaction_id>
</xml>]==]
print(testXml)

local parsedXml = xml:ParseXmlText(testXml)
if parsedXml.xml == nil then error("Node not created") end
print(parsedXml.xml.appid:value())
print(parsedXml.xml.bank_type:value())
print(parsedXml.xml.cash_fee:value())
print(parsedXml.xml.device_info:value())
print(parsedXml.xml.fee_type:value())
print(parsedXml.xml.is_subscribe:value())
print(parsedXml.xml.mch_id:value())
print(parsedXml.xml.nonce_str:value())
print(parsedXml.xml.openid:value())
print(parsedXml.xml.out_trade_no:value())
print(parsedXml.xml.result_code:value())
print(parsedXml.xml.sign:value())
print(parsedXml.xml.time_end:value())
print(parsedXml.xml.total_fee:value())

local function parse_cdata(str)
	if string.find(str, "^<!%[CDATA%[") then  
		return string.match(str, "^<!%[CDATA%[(.+)%]%]>$")
	else	
		return str
	end	
end

print(parse_cdata("<![CDATA[Hello world]]>"))
print(parse_cdata("Hello world"))

str =  parsedXml.xml.appid:value()
print(str)
print(parse_cdata(str))

str =  parsedXml.xml.total_fee:value()
print(str)
print(parse_cdata(str))



