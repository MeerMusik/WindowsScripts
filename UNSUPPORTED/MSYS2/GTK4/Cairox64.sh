#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export CFLAGS='-g3 -ggdb -std=c2x -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -pipe -O0 -Wall -Wl,-pic -Wl,--gc-sections -Wl,-O0'
export CXXFLAGS='-g3 -ggdb -std=c++20 -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -pipe -O0 -Wall -Wl,-pic -Wl,--gc-sections -Wl,-O0'
if [ -d ${SYSTEMDRIVE}/Dev/CairoSrc/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/CairoSrc/*.* ${SYSTEMDRIVE}/Dev/CairoSrc/* ${SYSTEMDRIVE}/Dev/CairoSrc/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/CairoSrc/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/cairo/ ${SYSTEMDRIVE}/Dev/CairoSrc/
fi
cd ${SYSTEMDRIVE}/Dev/CairoSrc/
./autogen.sh
./configure --enable-relocatable --enable-extra-encodings --enable-static --with-pic --host=x86_64-w64-mingw32 CC=x86_64-w64-mingw32-gcc --prefix='${SYSTEMDRIVE}/Dev/Sources/GTK4/libiconv/x64/debug/'
make --jobs=$(nproc) V=1
make --jobs=1 V=1 install
./libtool --finish ${SYSTEMDRIVE}/Dev/Sources/GTK4/libiconv/x64/debug/lib/
make distclean
export CFLAGS='-std=c2x -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -g0 -pipe -Os -Wall -Wl,-pic -Wl,--gc-sections -Wl,--strip-debug -Wl,-Os'
export CXXFLAGS='-std=c++20 -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -g0 -pipe -Os -Wall -Wl,-pic -Wl,--gc-sections -Wl,--strip-debug -Wl,-Os'
./configure --enable-relocatable --enable-extra-encodings --enable-static --with-pic --host=x86_64-w64-mingw32 CC=x86_64-w64-mingw32-gcc --prefix='${SYSTEMDRIVE}/Dev/Sources/GTK4/libiconv/x64/release/'
make --jobs=$(nproc) V=1
make --jobs=1 V=1 install
./libtool --finish ${SYSTEMDRIVE}/Dev/Sources/GTK4/libiconv/x64/release/lib/
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/CairoSrc/*.* ${SYSTEMDRIVE}/Dev/CairoSrc/* ${SYSTEMDRIVE}/Dev/CairoSrc/
echo DONE!
exit
