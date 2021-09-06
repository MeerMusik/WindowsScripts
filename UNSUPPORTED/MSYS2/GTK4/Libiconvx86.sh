#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export CFLAGS='-g3 -ggdb -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -pipe -O0 -Wall -Wl,--gc-sections -Wl,-pic -Wl,-O0'
export CXXFLAGS='-g3 -ggdb -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -pipe -O0 -Wall -Wl,--gc-sections -Wl,-pic -Wl,-O0'
if [ -d ${SYSTEMDRIVE}/Dev/LibiconvSrc/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/LibiconvSrc/*.* ${SYSTEMDRIVE}/Dev/LibiconvSrc/* ${SYSTEMDRIVE}/Dev/LibiconvSrc/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/LibiconvSrc/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/libiconv/ ${SYSTEMDRIVE}/Dev/LibiconvSrc/
fi
cd ${SYSTEMDRIVE}/Dev/LibiconvSrc/
# !! File /lib/aliases.gperf (created by autogen.sh) has CRLF Line Ending - Use mingw-w64-i686-gperf (mingw32) or mingw-w64-x86_64-gperf (mingw64) - NOT msys2 default gperf - even if they have the same Version Number !!
./autogen.sh
./configure --enable-relocatable --enable-extra-encodings --enable-static --with-pic --host=i686-w64-mingw32 CC=i686-w64-mingw32-gcc --prefix='${SYSTEMDRIVE}/Dev/Sources/GTK4/libiconv/x86/debug/'
make --jobs=$(nproc) V=1
make --jobs=1 V=1 install
./libtool --finish ${SYSTEMDRIVE}/Dev/Sources/GTK4/libiconv/x86/debug/lib/
make distclean
export CFLAGS='-ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -g0 -pipe -Os -Wall -Wl,-pic -Wl,--gc-sections -Wl,--strip-debug -Wl,-Os'
export CXXFLAGS='-ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -g0 -pipe -Os -Wall -Wl,-pic -Wl,--gc-sections -Wl,--strip-debug -Wl,-Os'
./configure --enable-relocatable --enable-extra-encodings --enable-static --with-pic --host=i686-w64-mingw32 CC=i686-w64-mingw32-gcc --prefix='${SYSTEMDRIVE}/Dev/Sources/GTK4/libiconv/x86/release/'
make --jobs=$(nproc) V=1
make --jobs=1 V=1 install
./libtool --finish ${SYSTEMDRIVE}/Dev/Sources/GTK4/libiconv/x86/release/lib/
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/LibiconvSrc/*.* ${SYSTEMDRIVE}/Dev/LibiconvSrc/* ${SYSTEMDRIVE}/Dev/LibiconvSrc/
echo DONE!
exit
