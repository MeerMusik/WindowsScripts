#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export CXXFLAGS='-fPIC -pipe -O3 -std=c++17 -Wl,-pic'
export PATH="${PATH}:${SYSTEMDRIVE}/Qt5x64MinGW/bin/"
if [ -d ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/*.* ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/* ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/
fi
if [ -d ${SYSTEMDRIVE}/Dev/GammaRayQt5Bldx64MinGW/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/GammaRayQt5Bldx64MinGW/*.* ${SYSTEMDRIVE}/Dev/GammaRayQt5Bldx64MinGW/* ${SYSTEMDRIVE}/Dev/GammaRayQt5Bldx64MinGW/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/GammaRay/ ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/
fi
cd ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/
cmake -G 'Ninja' -DCMAKE_CXX_FLAGS='-fPIC -pipe -O3 -std=c++17 -Wl,-pic' -DCMAKE_INSTALL_PREFIX=${SYSTEMDRIVE}/Dev/GammaRayQt5x64MinGW/ ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/
ninja -j$(nproc)
ninja install
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/*.* ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/* ${SYSTEMDRIVE}/Dev/GammaRayQt5Srcx64MinGW/
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/GammaRayQt5Bldx64MinGW/*.* ${SYSTEMDRIVE}/Dev/GammaRayQt5Bldx64MinGW/* ${SYSTEMDRIVE}/Dev/GammaRayQt5Bldx64MinGW/
echo DONE!
echo DISABLED: sleep 10s
exit
