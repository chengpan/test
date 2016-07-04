#!/usr/bin/env python
# -*- coding: UTF-8 -*-
#!/usr/bin/python

from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText

from email.utils import COMMASPACE,formatdate
from email import encoders
from email.header import Header

import os, mimetypes, sys,smtplib,socket,getopt


def send_mail(server, user, passwd, fro, to, subject, html_text):
    msg = MIMEMultipart()
    msg['From'] = fro
    msg['To'] = to #COMMASPACE.join(to) #COMMASPACE==', '
    msg['Subject'] = Header(subject,"utf-8")
    msg['Date'] = formatdate(localtime=True)
    msg["Accept-Language"]="zh-CN"
    msg["Accept-Charset"]="ISO-8859-1,utf-8"
    msg.attach(MIMEText(html_text, "html", "utf-8"))

    import smtplib
    smtp = smtplib.SMTP(server)
    smtp.login(user, passwd)
    smtp.sendmail(fro, to, msg.as_string())
    smtp.close()


if __name__ == '__main__':
    def usage():
        print """Useage:\n %s -t <to_address> -s <mail_subject> -m <mail_message> [-a <attachment>] [-n <attach file names>]
                 -t, --to=   Addressee's address. -t "test@test.com,test1@test.com".
                 -s, --subject=  Mail subject.
                 -m, --msg=   Mail message.-m "msg, .......". in html format , add by ChengPan, 2016年5月16日
                 -h, --help   Help documen.
               """ % sys.argv[0]
        sys.exit(3)

    try:
        options, args = getopt.getopt(sys.argv[1:], "t:s:m:a:n:", "--to= --subject= --msg= --att= --attname=")
    except getopt.GetoptError:
        usage()
        sys.exit(3)

    #Login SMTP server
    server      = "smtp.exmail.qq.com"
    user        = "account@idsuipai.com"
    passwd      = "Ppbb2016"
    fro         = "证件照随拍<account@idsuipai.com>"   #the name of the "from" person (i.e., the envelope sender of the mail)
    to          = None
    subject     = None  #标题
    msg         = None  #正文
    html_text   = """ 
	<html> 
	  <head>证件照随拍</head> 
	  <body> 
		<p>亲爱的frank:<br> 
		   您申请的微信号合作通过!<br>
		   请点击下面的链接完善资料:<br>	
		   <a href="http://www.baidu.com" mce_href="http://www.baidu.com">www.baidu.com</a><br>
		   如果以上链接无法点击，请将上面的地址复制到你的浏览器(如IE)的地址栏进入<br><br>
		   --证件照随拍<br>
		   (这是一封自动产生的email，请勿回复)<br>
		</p> 
	  </body> 
	</html> 
	"""  
    for k, v in options:
        if k in ("-h", "--help"):
            usage()
        elif k in ("-t", "--to"):
            to = v
        elif k in ("-s", "--subject"):
            subject = v
        elif k in ("-m", "--msg"):
            msg = v

    #print "to:", to
    #print "subject:", subject
    #print "msg:", msg
    #print "attach:", attach
    #print "attachname:", attachname

    send_mail(server, user, passwd, fro, to, subject, html_text)
    sys.exit(0)
