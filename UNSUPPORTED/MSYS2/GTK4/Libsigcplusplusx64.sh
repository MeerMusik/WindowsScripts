#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End --L${SYSTEMDRIVE}/Dev/Sources/GTK4/boost/x64/debug/lib/-L${SYSTEMDRIVE}/Dev/Sources/GTK4/boost/x64/debug/lib/
#export PKG_CONFIG_PATH=${SYSTEMDRIVE}/Dev/Sources/GTK4/mm-common/share/
#export pkg_config_path=${SYSTEMDRIVE}/Dev/Sources/GTK4/mm-common/share/pkgconfig/:${SYSTEMDRIVE}/Dev/msys64/mingw64/lib/pkgconfig/:${SYSTEMDRIVE}/Dev/msys64/mingw64/share/pkgconfig/
export BOOST_ROOT=${SYSTEMDRIVE}/Dev/Sources/GTK4/boost/x64/debug/
#export CC=C:/Dev/TDM-GCC-64/bin/gcc
#export CXX=C:/Dev/TDM-GCC-64/bin/g++
#export PATH=${SYSTEMDRIVE}/Dev/Sources/GTK4/mm-common/bin/:${PATH}
#export ACLOCAL_PATH="${SYSTEMDRIVE}/Dev/Sources/GTK4/mm-common/share/aclocal/"
#export PATH="$PATH:${SYSTEMDRIVE}/Dev/Graphviz/bin/dot.exe:${SYSTEMDRIVE}/Dev/doxygen/bin/"
#export CFLAGS='-g3 -ggdb -std=c2x -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -pipe -O0 -Wall -Wl,-pic -Wl,--gc-sections -Wl,-O0'
#export CXXFLAGS='-g3 -ggdb -std=c++20 -ffunction-sections -fdata-sections -fno-lto -Wl,-fno-lto -pipe -O0 -Wall -Wl,--gc-sections -Wl,-O0'
#export CXXFLAGS='-fpic -shared -Wl,-pic'
#export LDFLAGS='--relocatable'
#export CXXFLAGS="-IC:/Dev/msys64/mingw64/include/c++/10.2.0"
if [ -d ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/*.* ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/* ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/libsigcplusplus/ ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/
fi
cd ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/
echo ${PATH}
#cp --force --verbose ${SYSTEMDRIVE}/Dev/Sources/GTK4/mm-common/bin/mm-common-get ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/
#cp --force --verbose ${SYSTEMDRIVE}/Dev/Sources/GTK4/mm-common/bin/mm-common-prepare ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/
#./autogen.sh --prefix=${SYSTEMDRIVE}/Dev/Sources/GTK4/libsigcplusplus/x64/debug/
#./configure --prefix=${SYSTEMDRIVE}/Dev/Sources/GTK4/libsigcplusplus/x64/debug/ --libdir=${SYSTEMDRIVE}/Dev/Sources/GTK4/libsigcplusplus/x64/debug/lib/
#make -j V=1
#make -j1 install
#./mm-common-prepare
#./mm-common-get
meson --prefix=${SYSTEMDRIVE}/Dev/Sources/GTK4/libsigcplusplus/x64/debug/ --libdir=${SYSTEMDRIVE}/Dev/Sources/GTK4/libsigcplusplus/x64/debug/lib/ -Dbuild-documentation=true -Dbuild.pkg_config_path=${SYSTEMDRIVE}/Dev/Sources/GTK4/mm-common/share/pkgconfig -Dpkg_config_path=${SYSTEMDRIVE}/Dev/Sources/GTK4/mm-common/share/pkgconfig ${PWD}/build_me/ .
meson compile --verbose -C ${PWD}/build_me/
#meson install -C ${PWD}/build_me/
#ninja --verbose
#ninja install
#cd ${PWD}/build_libsigcpp/
#cd ${SYSTEMDRIVE}/Dev/msys64/usr/bin/ -Ddebug=true -Dbuildtype=debug -Ddefault_library=both -Doptimization=0 -Dstrip=false -Dunity=off -Db_colorout=always -Db_lto=false -Db_ndebug=false -Db_pch=true -Db_pie=true -Db_staticpic=true
#make --jobs=$(nproc) V=1 
#make --jobs=1 V=1 install
#./libtool --finish ${SYSTEMDRIVE}/Dev/Sources/GTK4/libsigcplusplus/x64/debug/lib/
#make distclean
#export BOOST_ROOT=${SYSTEMDRIVE}/Dev/Sources/GTK4/boost/x64/release/
#export CFLAGS='-std=c2x -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -g0 -pipe -Os -Wall -Wl,-pic -Wl,--gc-sections -Wl,--strip-debug -Wl,-Os'
#export CXXFLAGS='-std=c++20 -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -g0 -pipe -Os -Wall -Wl,-pic -Wl,--gc-sections -Wl,--strip-debug -Wl,-Os'
#meson --prefix=${SYSTEMDRIVE}/Dev/Sources/GTK4/libsigcplusplus/x64/debug/ --libdir=lib -Dbuild-documentation=false -Dbuild.pkg_config_path=${SYSTEMDRIVE}/Dev/Sources/GTK4/mmcommon/x64/debug/share/pkgconfig/ ${PWD}/build/ .
#meson configure -Dbuild-documentation=false -Ddebug=false -Dbuild_type=release -Ddefault_library=both -Doptimization=s -Dstrip=true -Dunity=off -Db_colorout=always -Db_lto=false -Db_ndebug=true -Db_pch=true -Db_pie=true -Db_staticpic=true -Dprefix='${SYSTEMDRIVE}/Dev/Sources/GTK4/libsigcplusplus/x64/release/'
#./configure --enable-relocatable --enable-static --with-pic --host=x86_64-w64-mingw32 CC=x86_64-w64-mingw32-gcc --prefix='${SYSTEMDRIVE}/Dev/Sources/GTK4/libsigcplusplus/x64/release/'
#make --jobs=$(nproc) V=1
#make --jobs=1 V=1 install
#./libtool --finish ${SYSTEMDRIVE}/Dev/Sources/GTK4/libsigcplusplus/x64/release/lib/
#cd ${TMP}
#echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
#sleep 8s
#rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/*.* ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/* ${SYSTEMDRIVE}/Dev/LibsigcplusplusSrc/
#echo DONE!
exit
