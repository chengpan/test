
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile
	$(MAKE) -f objs/Makefile manpage

install:
	$(MAKE) -f objs/Makefile install

upgrade:
	/home/cp/openresty_install/nginx/sbin/nginx -t

	kill -USR2 `cat /home/cp/openresty_install/nginx/logs/nginx.pid`
	sleep 1
	test -f /home/cp/openresty_install/nginx/logs/nginx.pid.oldbin

	kill -QUIT `cat /home/cp/openresty_install/nginx/logs/nginx.pid.oldbin`
