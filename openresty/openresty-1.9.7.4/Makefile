.PHONY: all install clean

all:
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/LuaJIT-2.1-20160108 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/home/cp/openresty_install/luajit
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-cjson-2.1.0.3 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/luajit-root/home/cp/openresty_install/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/home/cp/openresty_install/lualib LUA_MODULE_DIR=/home/cp/openresty_install/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-redis-parser-0.12 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/luajit-root/home/cp/openresty_install/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/cp/openresty_install/lualib CC=cc
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/luajit-root/home/cp/openresty_install/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/cp/openresty_install/lualib CC=cc
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/nginx-1.9.7 && $(MAKE)

install: all
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/LuaJIT-2.1-20160108 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g CC=cc PREFIX=/home/cp/openresty_install/luajit DESTDIR=$(DESTDIR)
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-cjson-2.1.0.3 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/luajit-root/home/cp/openresty_install/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/home/cp/openresty_install/lualib LUA_MODULE_DIR=/home/cp/openresty_install/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-redis-parser-0.12 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/luajit-root/home/cp/openresty_install/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/cp/openresty_install/lualib CC=cc
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/luajit-root/home/cp/openresty_install/luajit/include/luajit-2.1 LUA_LIB_DIR=/home/cp/openresty_install/lualib CC=cc
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-dns-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-memcached-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-redis-0.22 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-mysql-0.15 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-string-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-upload-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-websocket-0.05 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-lock-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-lrucache-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-core-0.1.5 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/lua-resty-upstream-healthcheck-0.04 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/home/cp/openresty_install/lualib INSTALL=/home/cp/work-dir/openresty/openresty-1.9.7.4/build/install
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/resty-cli-0.06 && /home/cp/work-dir/openresty/openresty-1.9.7.4/build/install resty $(DESTDIR)/home/cp/openresty_install/bin/
	cd /home/cp/work-dir/openresty/openresty-1.9.7.4/build/nginx-1.9.7 && $(MAKE) install DESTDIR=$(DESTDIR)

clean:
	rm -rf build
