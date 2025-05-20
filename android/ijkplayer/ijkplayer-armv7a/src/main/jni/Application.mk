# Copyright (c) 2013 Bilibili
# copyright (c) 2013 Zhang Rui <bbcallen@gmail.com>
#
# This file is part of ijkPlayer.
#
# ijkPlayer is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# ijkPlayer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with ijkPlayer; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

APP_OPTIM := release
APP_PLATFORM := android-9
ifeq ($(NDK_MAJOR_VERSION),22)
    APP_PLATFORM := android-21
endif
APP_ABI := armeabi-v7a
NDK_TOOLCHAIN_VERSION=4.9
ifeq ($(NDK_MAJOR_VERSION),22)
    NDK_TOOLCHAIN_VERSION=
endif
APP_PIE := false

APP_STL := stlport_static
ifeq ($(NDK_MAJOR_VERSION),22)
    APP_STL := c++_static
endif

APP_CFLAGS := -O3 -Wall -pipe \
    -ffast-math \
    -fstrict-aliasing -Werror=strict-aliasing \
    -Wno-psabi -Wa,--noexecstack \
    -DANDROID -DNDEBUG
ifeq ($(NDK_MAJOR_VERSION),22)
    APP_CFLAGS := -O3 -Wall -pipe \
        -ffast-math \
        -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0 \
        -fstrict-aliasing -Werror=strict-aliasing \
        -Wa,--noexecstack \
        -DANDROID -DNDEBUG
endif
