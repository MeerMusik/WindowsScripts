#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export CDFLAGS='-DZLIB_DEBUG -shared -fPIC -pipe -Wl,-pic -Wl,--dynamicbase -Wl,--nxcompat -Wl,--high-entropy-va -Wl,--dynamicbase,--export-all-symbols -Wa,-mbig-obj'
export CRFLAGS='-std=c2x -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -g0 -pipe -Os -Wall -Wl,-pic -Wl,--gc-sections -Wl,--strip-debug -Wl,-Os'
export LDFLAGS='--relocatable'
#export LDFLAGS='--print-gc-sections'
#export STRIP='--strip-unneeded'
if [ ! -d ${SYSTEMDRIVE}/Dev/ ]; then mkdir ${SYSTEMDRIVE}/Dev/
fi
if [ -d ${SYSTEMDRIVE}/Dev/ZlibSrc/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/ZlibSrc/*.* ${SYSTEMDRIVE}/Dev/ZlibSrc/* ${SYSTEMDRIVE}/Dev/ZlibSrc/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/ZlibSrc/ ]; then mkdir ${SYSTEMDRIVE}/Dev/ZlibSrc/
fi
cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/zlib/ ${SYSTEMDRIVE}/Dev/ZlibSrc/
cd ${SYSTEMDRIVE}/Dev/ZlibSrc/zlib/
make --jobs=$(nproc) V=1 -fwin32/Makefile.gcc CFLAGS:='$(CDFLAGS)' LOC='-DZLIB_DEBUG -g'
make --jobs=1 V=1 install prefix='${SYSTEMDRIVE}/Dev/Sources/GTK4/zlib/x64/debug/' BINARY_PATH='${prefix}bin/' INCLUDE_PATH='${prefix}include/' LIBRARY_PATH='${prefix}lib/' -fwin32/Makefile.gcc SHARED_MODE=1
#make --jobs=1 distclean
#make --jobs=$(nproc) V=1 -fwin32/Makefile.gcc CFLAGS:='$(CRFLAGS)'
#make --jobs=1 V=1 install prefix='${SYSTEMDRIVE}/Dev/Sources/GTK4/zlib/x64/release/' BINARY_PATH='${prefix}bin/' INCLUDE_PATH='${prefix}include/' LIBRARY_PATH='${prefix}lib/' -fwin32/Makefile.gcc SHARED_MODE=1
#cd ${TMP}
#echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
#sleep 8s
#rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/ZlibSrc/*.* ${SYSTEMDRIVE}/Dev/ZlibSrc/* ${SYSTEMDRIVE}/Dev/ZlibSrc/
#echo DONE!
exit
