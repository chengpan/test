#!/usr/bin/lua 

function sep_dir_file(str)
	local slash = string.find(str, "/")
	if not slash then
		return "", str
	end
	
	local dir_name, file_name = string.match(str, "(.*/)([^/]*)$")
	return dir_name, file_name
end

function sep_file_name_ext(str)
	local dot = string.find(str, ".")
	if not dot then
		return str, ""
	end
	
	local file_name, file_ext = string.match(str, "(.*)%.([^.]*)$")
	return file_name, file_ext
end

print(sep_dir_file("aa/bb"))
print(sep_dir_file("/aa/bb"))
print(sep_dir_file("/aa/bb/"))
print(sep_dir_file("/aabb"))
print(sep_dir_file("/aa/bb.cc"))
print(sep_dir_file("aa"))
print(sep_dir_file("a呵呵a/cc.c哥哥c"))

print(sep_file_name_ext("aa.cc"))
print(sep_file_name_ext(".哥哥"))
print(sep_file_name_ext("cjds.哥哥.呵呵"))
print(sep_file_name_ext("cjds.哥哥.呵呵."))
