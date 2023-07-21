#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2023 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2013-2023 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
if [ ! -d ${SYSTEMDRIVE}/Dev/ ]; then mkdir ${SYSTEMDRIVE}/Dev/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/ ]; then mkdir ${SYSTEMDRIVE}/Dev/Builds/
fi
if [ -d ${SYSTEMDRIVE}/Dev/Builds/Zigx86/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Zigx86/*.* ${SYSTEMDRIVE}/Dev/Builds/Zigx86/* ${SYSTEMDRIVE}/Dev/Builds/Zigx86/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/Zigx86/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/zig/ ${SYSTEMDRIVE}/Dev/Builds/Zigx86/
fi
cd ${SYSTEMDRIVE}/Dev/Builds/Zigx86/
# --- Section to build Debug Libraries ---
cmake . -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX="${SYSTEMDRIVE}/Dev/Binaries/Zigx86Debug/"
make --jobs=$(nproc) V=1
make check V=1
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
make install V=1
make --jobs=1 V=1 distclean
# --- Section to build Release Libraries ---
cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${SYSTEMDRIVE}/Dev/Binaries/Zigx86Release/"
make --jobs=$(nproc) V=1
make check V=1
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
make install V=1
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Zigx86/*.* ${SYSTEMDRIVE}/Dev/Builds/Zigx86/* ${SYSTEMDRIVE}/Dev/Builds/Zigx86/
echo DONE!
echo DISABLED: sleep 10s
exit
