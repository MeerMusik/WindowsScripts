#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export CXXFLAGS='-pipe -Wa,-mbig-obj'
export OPENSSL_LIBS='${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/lib/libssl.a ${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/lib/libcrypto.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libws2_32.a'
export PATH="${PATH}:${SYSTEMDRIVE}/Dev/Qt6SrcGit/qt5/:${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/include/:${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/lib/"
if [ -d ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/*.* ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/* ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/ ]; then mkdir ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/
fi
cd ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/
cmake --verbose ${SYSTEMDRIVE}/Dev/Qt6SrcGit/qt5/ -G"Ninja Multi-Config" -DCMAKE_CONFIGURATION_TYPES="Release;Debug" -DCMAKE_DEFAULT_CONFIGS="all" -DBUILD_WITH_PCH=ON -DBUILD_qt5compat=OFF -DWARNINGS_ARE_ERRORS=OFF -DFEATURE_ltcg=OFF -DFEATURE_optimize_full=ON -DFEATURE_optimize_size=OFF -DFEATURE_optimize_debug=OFF -DFEATURE_opengl_desktop=ON -DFEATURE_opengl_dynamic=OFF -DFEATURE_relocatable=ON -DFEATURE_clangcpp=ON -DFEATURE_doubleconversion=ON -DFEATURE_system_doubleconversion=OFF -DFEATURE_freetype=ON -DFEATURE_system_freetype=OFF -DFEATURE_harfbuzz=ON -DFEATURE_system_harfbuzz=OFF -DFEATURE_pcre2=ON -DFEATURE_system_pcre2=OFF -DFEATURE_system_zlib=OFF -DFEATURE_icu=ON -DICU_ROOT=${SYSTEMDRIVE}/Dev/ICUx64MinGW/ -DICU_INCLUDE_DIRS=${SYSTEMDRIVE}/Dev/ICUx64MinGW/include/ -DICU_LIBRARIES=${SYSTEMDRIVE}/Dev/ICUx64MinGW/lib/ -DFEATURE_openssl=ON -DFEATURE_openssl_linked=ON -DOPENSSL_ROOT_DIR=${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/ -DOPENSSL_INCLUDE_DIR=${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/include/ -DOPENSSL_LIBRARIES=${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/lib/ -DCMAKE_INSTALL_PREFIX=${SYSTEMDRIVE}/Dev/Qt6x64MinGW/
ninja --verbose
cd ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/
ninja --verbose install
#GCC and LLVM Libraries:
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libclang.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libclang-cpp.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libgcc_s_seh-1.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libLLVM.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libffi-7.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libstdc++-6.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libwinpthread-1.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/zlib1.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
#ICU Libraries:
cp --force --verbose ${SYSTEMDRIVE}/Dev/ICUx64MinGW/bin/icuin69.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/ICUx64MinGW/bin/icuuc69.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/ICUx64MinGW/bin/icudt69.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
#OpenSSL Libraries:
cp --force --verbose ${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/bin/libcrypto-1_1-x64.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/bin/libssl-1_1-x64.dll ${SYSTEMDRIVE}/Dev/Qt6x64MinGW/bin/
ninja --verbose docs
ninja --verbose install_docs
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/*.* ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/* ${SYSTEMDRIVE}/Dev/Qt6Srcx64MinGW/
echo DONE!
#echo DISABLED: sleep 10s
exit
