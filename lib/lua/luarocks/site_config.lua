-- This file was automatically generated by LuaDist

-- LuaDist specific "relarive" root when using portable Lua install
local root = [[/home/drahosp/Desktop/Work/Repository/_install/bin/_test/]]
if _PROGDIR then
  root = _PROGDIR .. "/../"
end

module("luarocks.site_config")

LUAROCKS_PREFIX		    = root
LUA_INCDIR			      = root .. [[include]]
LUA_LIBDIR			      = root .. [[lib]]
LUA_BINDIR			      = root .. [[bin]]
LUA_BIN		    		= [[lua]]
LUA_LIB					= [[lua]]
LUAROCKS_SYSCONFIG	  = root .. [[etc/config.lua]]
LUAROCKS_ROCKS_TREE   = root .. [[share/luarocks/rocks]]
LUAROCKS_FORCE_CONFIG = true
LUAROCKS_UNAME_S      = [[Unix;CACHE;STRING;Detected system.;Unknown]]
LUAROCKS_UNAME_M      = [[x86_64]]
LUAROCKS_DOWNLOADER   = [[curl]]
LUAROCKS_MD5CHECKER   = [[md5]]
