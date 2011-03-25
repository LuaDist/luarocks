# Copyright (C) 2011 LuaDist.
# Created by Peter Drahoš
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

project ( luarocks NONE )
cmake_minimum_required ( VERSION 2.6 )
include ( dist.cmake )

## settings
set ( LUA_INCDIR ${INSTALL_INC} )
set ( LUA_LIBDIR ${INSTALL_LIB} )
set ( LUA_BINDIR ${INSTALL_BIN} )
set ( LUA_INTERPRETER lua )
set ( LUA_SUFFIX "51" )

set ( LUAROCKS_SYSCONFIG ${INSTALL_ETC} )
set ( LUAROCKS_ROCKS_TREE ${INSTALL_DATA}/rocks )

# System detection
set ( LUAROCKS_UNAME_S Unix CACHE STRING "Detected system.")
if ( CYGWIN )
  set ( LUAROCKS_UNAME_S CYGWIN )
elseif ( MINGW )
  set ( LUAROCKS_UNAME_S MINGW )
elseif ( WIN32 )
  set ( LUAROCKS_UNAME_S Windows )
elseif ( LINUX )
  set ( LUAROCKS_UNAME_S Linux )
elseif ( APPLE )
  set ( LUAROCKS_UNAME_S Darwin )
endif ()

# Architecture detection
set ( LUAROCKS_UNAME_M x86 CACHE STRING "Detected architecture." )
if( CMAKE_SIZEOF_VOID_P EQUAL 8 )
   set ( LUAROCKS_UNAME_M x86_64 )
endif ()

set ( LUAROCKS_DOWNLOADER curl )
set ( LUAROCKS_MD5CHECKER md5sum )
set ( LUAROCKS_FORCE_CONFIG true )
configure_file ( config.in ${CMAKE_CURRENT_BINARY_DIR}/config.lua @ONLY )

install ( DIRECTORY src/luarocks DESTINATION ${INSTALL_LMOD} )
install_lua_module ( luarocks.config ${CMAKE_CURRENT_BINARY_DIR}/config.lua )
install_lua_executable ( luarocks src/bin/luarocks )  
install_lua_executable ( luarocks-admin src/bin/luarocks-admin )  

install_data ( COPYING README.md )
install_data ( COPYING INTO rocks )
install_test ( test/ )