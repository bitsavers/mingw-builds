
#
# The BSD 3-Clause License. http://www.opensource.org/licenses/BSD-3-Clause
#
# This file is part of MinGW-W64(mingw-builds: https://github.com/niXman/mingw-builds) project.
# Copyright (c) 2011-2023 by niXman (i dotty nixman doggy gmail dotty com)
# Copyright (c) 2012-2015 by Alexpux (alexpux doggy gmail dotty com)
# All rights reserved.
#
# Project: MinGW-Builds ( https://github.com/niXman/mingw-builds )
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

PKG_VERSION=1.17
PKG_NAME=$PKG_ARCHITECTURE-libiconv-$LINK_TYPE_SUFFIX
PKG_DIR_NAME=libiconv-${PKG_VERSION}
PKG_TYPE=.tar.gz
PKG_SHA256=8f74213b56238c85a50a5329f77e06198771e70dd9a739779f4c02f65d971313
PKG_URLS=(
	"https://ftpmirror.gnu.org/gnu/libiconv/libiconv-${PKG_VERSION}${PKG_TYPE}|sha256:${PKG_SHA256}"
)

PKG_PRIORITY=prereq

#

PKG_PATCHES=(
	libiconv/0002-fix-cr-for-awk-in-configure.all.patch
	libiconv/fix-pointer-buf.patch
)

#

PKG_CONFIGURE_FLAGS=(
	--host=$HOST
	--build=$BUILD
	--target=$TARGET
	#
	--prefix=$PREREQ_DIR/$PKG_NAME
    --enable-relocatable
    --disable-rpath
    --disable-silent-rules
    --enable-nls
    #
	$GCC_DEPS_LINK_TYPE
	#
	CFLAGS="$COMMON_CFLAGS"
	CXXFLAGS="$COMMON_CXXFLAGS"
	CPPFLAGS="$COMMON_CPPFLAGS"
	LDFLAGS="$COMMON_LDFLAGS"
)

#

PKG_MAKE_FLAGS=(
	-j$JOBS
	all
)

#

PKG_TESTSUITE_FLAGS=(
	-j$JOBS
	check
)

#

PKG_INSTALL_FLAGS=(
	-j$JOBS
	$( [[ $STRIP_ON_INSTALL == yes ]] && echo install-strip || echo install )
)

# **************************************************************************
