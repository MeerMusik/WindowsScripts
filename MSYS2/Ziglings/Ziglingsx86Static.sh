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
if [ -d ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/*.* ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/* ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/exercises/ ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/
fi
cd ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/
# --- Section to build Debug Libraries ---
${SYSTEMDRIVE}/Dev/Binaries/Zigx86StaticRelease/bin/zig.exe build -Dtarget=x86-windows-gnu
if [ ! -d ${SYSTEMDRIVE}/Dev/Binaries/Ziglingsx86 ]; then mkdir ${SYSTEMDRIVE}/Dev/Binaries/Ziglingsx86
fi
cp --force --verbose --recursive ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/zig-out/bin/*.* ${SYSTEMDRIVE}/Dev/Binaries/Ziglingsx86/
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/*.* ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/* ${SYSTEMDRIVE}/Dev/Builds/Ziglingsx86/
echo DONE!
echo DISABLED: sleep 10s
exit
