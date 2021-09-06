#!/usr/bin/sh
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
if [ -d ${SYSTEMDRIVE}/Dev/MMCommonSrc/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/MMCommonSrc/*.* ${SYSTEMDRIVE}/Dev/MMCommonSrc/* ${SYSTEMDRIVE}/Dev/MMCommonSrc/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/MMCommonSrc/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/Sources/mm-common/ ${SYSTEMDRIVE}/Dev/MMCommonSrc/
fi
cd ${SYSTEMDRIVE}/Dev/MMCommonSrc/
meson build
meson configure ${PWD}/build/ -Ddebug=true -Dbuildtype=release -Ddefault_library=both -Doptimization=0 -Dstrip=false -Dunity=on -Dprefix=${SYSTEMDRIVE}/Dev/Sources/GTK4/mmcommon/x86/debug/
meson compile --verbose -C ${PWD}/build/
meson install -C ${PWD}/build/
export CFLAGS='-std=c2x -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -g0 -pipe -Os -Wall -Wl,-pic -Wl,--gc-sections -Wl,--strip-debug -Wl,-Os'
export CXXFLAGS='-std=c++20 -ffunction-sections -fdata-sections -fPIC -fno-lto -Wl,-fno-lto -g0 -pipe -Os -Wall -Wl,-pic -Wl,--gc-sections -Wl,--strip-debug -Wl,-Os'
meson configure --clearcache ${PWD}/build/ -Ddebug=false -Dbuildtype=release -Ddefault_library=both -Doptimization=s -Dstrip=true -Dunity=on -Dprefix=${SYSTEMDRIVE}/Dev/Sources/GTK4/mmcommon/x86/release/
meson compile --verbose -C ${PWD}/build/
meson install -C ${PWD}/build/
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/MMCommonSrc/*.* ${SYSTEMDRIVE}/Dev/MMCommonSrc/* ${SYSTEMDRIVE}/Dev/MMCommonSrc/
echo DONE!
exit
