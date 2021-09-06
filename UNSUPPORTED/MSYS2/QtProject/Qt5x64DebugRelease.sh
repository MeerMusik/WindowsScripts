#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export CXXFLAGS='-fPIC -pipe -O3 -std=c++17 -Wa,-mbig-obj -Wl,-pic'
export LDLIBS='${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libclang.a'
export LLVM_INSTALL_DIR="${SYSTEMDRIVE}/Dev/msys64/mingw64"
export MAKEFLAGS='-j$(nproc)'
export OPENSSL_LIBS='${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/lib/libssl.a ${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/lib/libcrypto.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libws2_32.a'
export PATH="${PATH}:${SYSTEMDRIVE}/Dev/Qt5SrcGit/qt5/gnuwin32/bin/:${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/include/:${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/lib/"
if [ -d ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/*.* ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/* ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/ ]; then mkdir ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/
fi
cd ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/
${SYSTEMDRIVE}/Dev/Qt5SrcGit/qt5/configure QMAKE_CXXFLAGS_RELEASE-='-O2' QMAKE_CXXFLAGS+='-fPIC -pipe -O3 -std=c++17 -Wa,-mbig-obj -Wl,-pic' QMAKE_LFLAGS+='-Wl,-pic' QMAKE_MAKEFLAGS+='-j$(nproc)' -silent -platform win32-g++ -opensource -confirm-license -prefix ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/ -opengl desktop -debug-and-release -no-feature-d3d12 -no-ltcg -no-optimize-size -no-optimize-debug -qt-zlib -qt-doubleconversion -qt-harfbuzz -qt-pcre -icu -I"${SYSTEMDRIVE}/Dev/msys64/mingw64/include" -L"${SYSTEMDRIVE}/Dev/msys64/mingw64/lib" -openssl-linked -I"${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/include" -L"${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/lib" OPENSSL_LIBS='${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/lib/libssl.a ${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/lib/libcrypto.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libws2_32.a' -nomake tests -nomake examples -no-warnings-are-errors -skip qtwebengine
make --jobs=$(nproc) V=1 1>${SYSTEMDRIVE}/Dev/LogQt5MSYS2IssueX64.txt 2>&1
cd ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/
make install
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libclang.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libgcc_s_seh-1.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/ICUx64MinGW/bin/icuin69.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/ICUx64MinGW/bin/icuuc69.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/ICUx64MinGW/bin/icudt69.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libstdc++-6.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libwinpthread-1.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/libzstd.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw64/bin/zlib1.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/bin/libcrypto-1_1-x64.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/OpenSSLx64MinGW/bin/libssl-1_1-x64.dll ${SYSTEMDRIVE}/Dev/Qt5x64MinGW/bin/
make --jobs=$(nproc) V=1 docs
make --jobs=1 V=1 install_docs
echo DISABLED: PAUSE
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/*.* ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/* ${SYSTEMDRIVE}/Dev/QtSrcx64MinGW/
echo DONE!
echo DISABLED: sleep 10s
exit
