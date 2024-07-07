
#
# The BSD 3-Clause License. http://www.opensource.org/licenses/BSD-3-Clause
#
# This file is part of MinGW-W64(mingw-builds: https://github.com/niXman/mingw-builds) project.
# Copyright (c) 2011-2021 by niXman (i dotty nixman doggy gmail dotty com)
# Copyright (c) 2012-2015 by Alexpux (alexpux doggy gmail dotty com)
# All rights reserved.
#
# Project: MinGW-W64 ( http://sourceforge.net/projects/mingw-w64/ )
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# - Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
# - Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in
#     the documentation and/or other materials provided with the distribution.
# - Neither the name of the 'MinGW-W64' nor the names of its contributors may
#     be used to endorse or promote products derived from this software
#     without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# **************************************************************************

PKG_VERSION=1.8
PKG_NAME=$PKG_ARCHITECTURE-mcfgthread-${PKG_VERSION}
PKG_DIR_NAME=mcfgthread-${PKG_VERSION}
PKG_TYPE=git
PKG_URLS=(
	"https://github.com/lhmouse/mcfgthread.git|branch:releases/v$PKG_VERSION|repo:$PKG_TYPE|module:$PKG_DIR_NAME"
)

PKG_PRIORITY=prereq

#

PKG_EXECUTE_AFTER_UNCOMPRESS=(
	"git reset --hard 6d5e63b58dc0ddacdce22de0a1575f99c24d8374" # Reset to this commit hash for reproducible builds
)

#

PKG_PATCHES=()

#

PKG_CONFIGURE_PROG=/mingw64/bin/meson.exe
PKG_CONFIGURE_SCRIPT=(NO_CONFIGURE_SCRIPT)
PKG_MAKE_PROG=/mingw64/bin/meson.exe

#

# https://mesonbuild.com/Builtin-options.html#details-for-buildtype
PKG_CONFIGURE_FLAGS=(
	setup
	$PREREQ_BUILD_DIR/$PKG_NAME
	--buildtype=release
# 	--host=$HOST
# 	--build=$BUILD
# 	--target=$TARGET
	#
	--prefix=$PREREQ_DIR/$PKG_ARCHITECTURE-mcfgthread
	#
# 	CFLAGS="-Os -g \"$COMMON_CFLAGS\""
# 	CXXFLAGS="\"$COMMON_CXXFLAGS\""
# 	CPPFLAGS="\"$COMMON_CPPFLAGS\""
# 	LDFLAGS="\"$COMMON_LDFLAGS\""
)



PKG_MAKE_FLAGS=(
	compile -C $PREREQ_BUILD_DIR/$PKG_NAME
)

#

# PKG_TESTSUITE_FLAGS=(
# # 	cd $PREREQ_DIR/$PKG_ARCHITECTURE-mcfgthread
# 	test -C $PREREQ_BUILD_DIR/$PKG_NAME
# )

#

PKG_INSTALL_FLAGS=(
	$( [[ $STRIP_ON_INSTALL == yes ]] && echo "install -C $PREREQ_BUILD_DIR/$PKG_NAME --strip" || echo "install -C $PREREQ_BUILD_DIR/$PKG_NAME" )
)

# PKG_VERSION=1.6
# PKG_NAME=$PKG_ARCHITECTURE-mcfgthread-${PKG_VERSION}
# PKG_DIR_NAME=mcfgthread-${PKG_VERSION}
# PKG_TYPE=git
# PKG_URLS=(
# 	"https://github.com/lhmouse/mcfgthread.git|branch:releases/v$PKG_VERSION|repo:$PKG_TYPE|module:$PKG_DIR_NAME"
# )
#
# PKG_PRIORITY=prereq
#
# #
#
# PKG_EXECUTE_AFTER_UNCOMPRESS=(
# 	"git reset --hard c4f164cac9d6022ae327b31147106d8ff9c27ac2" # Reset to this commit hash for reproducible builds
# )
#
# #
#
# PKG_PATCHES=()
#
# #
#
# PKG_EXECUTE_AFTER_PATCH=(
# 	"autoreconf -i"
# )
#
# #
#
# PKG_CONFIGURE_FLAGS=(
# 	--host=$HOST
# 	--build=$BUILD
# 	--target=$TARGET
# 	#
# 	--prefix=$PREREQ_DIR/$PKG_ARCHITECTURE-mcfgthread
# 	#
# 	CFLAGS="\"$COMMON_CFLAGS\""
# 	CXXFLAGS="\"$COMMON_CXXFLAGS\""
# 	CPPFLAGS="\"$COMMON_CPPFLAGS\""
# 	LDFLAGS="\"$COMMON_LDFLAGS\""
# )
#
# #
#
# PKG_MAKE_FLAGS=(
# 	-j$JOBS
# 	all
# )
#
# #
#
# PKG_TESTSUITE_FLAGS=(
# 	-j$JOBS
# 	check
# )
#
# #
#
# PKG_INSTALL_FLAGS=(
# 	-j$JOBS
# 	$( [[ $STRIP_ON_INSTALL == yes ]] && echo install-strip || echo install )
# )

# **************************************************************************
