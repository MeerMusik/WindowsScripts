#!/usr/bin/sh
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
#export ACLOCAL="C:/Dev/msys64/usr/bin/"
#export ACLOCAL_DIR="C:/Dev/msys64/usr/bin/"
#export PATH=$PATH:${SYSTEMDRIVE}/Dev/Graphviz/bin/:${SYSTEMDRIVE}/Dev/doxygen/bin/
#export ACLOCAL_PATH="C:/Dev/msys64/usr/share/aclocal/"
if [ -d ${SYSTEMDRIVE}/Dev/MMCommonSrc/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/MMCommonSrc/*.* ${SYSTEMDRIVE}/Dev/MMCommonSrc/* ${SYSTEMDRIVE}/Dev/MMCommonSrc/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/MMCommonSrc/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/Sources/mm-common/ ${SYSTEMDRIVE}/Dev/MMCommonSrc/
fi
cd ${SYSTEMDRIVE}/Dev/MMCommonSrc/
#To always download the latest 'libstdc++.tag' File for doxygen, add -Duse-network=true to the below Line. Right after 'meson'. By Default, the provided Version will be used. Download Size as of April 2021: 4.6 Megabyte
#./autogen.sh
meson --prefix="${SYSTEMDRIVE}/Dev/Sources/GTK4/mm-common/test/" ${PWD}/build/ .
meson ${PWD}/build/ .
meson compile --verbose -C ${PWD}/build/
meson install -C ${PWD}/build/
#cd ${TMP}
#echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
#sleep 8s
#rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/MMCommonSrc/*.* ${SYSTEMDRIVE}/Dev/MMCommonSrc/* ${SYSTEMDRIVE}/Dev/MMCommonSrc/
#echo DONE!
exit
