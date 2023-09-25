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
if [ -d ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/*.* ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/* ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/zls/ ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/
fi
cd ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/
# --- Section to build Debug Libraries ---
#rem DEBUG BUILDS UNDER MSYS2 ARE BROKEN AS OF 25th Septemer 2023!
#export PATH=${SYSTEMDRIVE}/Dev/Binaries/Zigx64StaticDebug/bin/:$PATH
#${SYSTEMDRIVE}/Dev/Binaries/Zigx64StaticDebug/bin/zig.exe build -Doptimize=Debug -Dtarget=x86_64-windows-gnu
#if [ ! -d ${SYSTEMDRIVE}/Dev/Binaries/ZLSx64Debug ]; then mkdir ${SYSTEMDRIVE}/Dev/Binaries/ZLSx64Debug
#fi
#cp --force --verbose --recursive ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/zig-out/bin/*.* ${SYSTEMDRIVE}/Dev/Binaries/ZLSx64Debug/
#echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
#sleep 10s
#rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/*.* ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/* ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/
# --- Section to build Release Libraries ---
export PATH=${SYSTEMDRIVE}/Dev/Binaries/Zigx64StaticRelease/bin/:$PATH
#if [ -d ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/*.* ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/* ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/
#fi
#if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/zls/ ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/
#fi
${SYSTEMDRIVE}/Dev/Binaries/Zigx64StaticRelease/bin/zig.exe build -Doptimize=ReleaseSafe -Dtarget=x86_64-windows-gnu
if [ ! -d ${SYSTEMDRIVE}/Dev/Binaries/ZLSx64Release ]; then mkdir ${SYSTEMDRIVE}/Dev/Binaries/ZLSx64Release
fi
cp --force --verbose --recursive ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/zig-out/bin/*.* ${SYSTEMDRIVE}/Dev/Binaries/ZLSx64Release/
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/*.* ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/* ${SYSTEMDRIVE}/Dev/Builds/Zlsx64/
echo DONE!
echo DISABLED: sleep 10s
exit
