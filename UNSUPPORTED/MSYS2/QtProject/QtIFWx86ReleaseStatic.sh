#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export CXXFLAGS='-fPIE -pipe -Os -std=c++17 -Wl,-pie'
export MAKEFLAGS='-j$(nproc)'
export QTDIR="${SYSTEMDRIVE}/Dev/Qt5x86StaticMinGW/"
export PATH="${PATH}:${QTDIR}/bin/"
if [ -d ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/*.* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/installer-framework/ ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/
fi
cd ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/
${SYSTEMDRIVE}/Dev/Qt5x86StaticMinGW/bin/qmake.exe QMAKE_CXXFLAGS_RELEASE-='-O2' QMAKE_CXXFLAGS+='-fPIE -pipe -Os -std=c++17' QMAKE_LFLAGS+='-Wl,-pie' QMAKE_MAKEFLAGS+='-j$(nproc)' installerfw.pro
make --jobs=$(nproc) V=1
cp --force --verbose ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/tools/repocompare/release/repocompare.exe ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/bin/
echo This creates the Documentation in the HTML Format under \doc\html. Recommended if you have never worked with the IFW before. Or if you find it too cumbersome to register and open the .qch Files in e.g. QtCreator.
echo DISABLED: make --jobs=$(nproc) V=1 docs
cd ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/.git/*.* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/.git/* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/.git/
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/dist/*.* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/dist/* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/dist/
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/lib/*.* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/lib/* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/lib/
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/src/*.* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/src/* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/src/
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/tests/*.* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/tests/* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/tests/
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/tools/*.* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/tools/* ${SYSTEMDRIVE}/Dev/QtIFWx86MinGW/tools/
echo DONE!
echo DISABLED: sleep 10s
exit
