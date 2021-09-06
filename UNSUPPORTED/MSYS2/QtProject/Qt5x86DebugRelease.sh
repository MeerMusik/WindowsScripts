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
export LDLIBS='${SYSTEMDRIVE}/Dev/msys64/mingw32/i686-w64-mingw32/lib/libclang.a'
export LLVM_INSTALL_DIR="${SYSTEMDRIVE}/Dev/msys64/mingw32"
export MAKEFLAGS='-j$(nproc)'
export OPENSSL_LIBS='${SYSTEMDRIVE}/Dev/OpenSSLx86MinGW/lib/libssl.a ${SYSTEMDRIVE}/Dev/OpenSSLx86MinGW/lib/libcrypto.a ${SYSTEMDRIVE}/Dev/msys64/mingw32/i686-w64-mingw32/lib/libws2_32.a'
export PATH="${PATH}:${SYSTEMDRIVE}/Dev/Qt5SrcGit/qt5/gnuwin32/bin/:${SYSTEMDRIVE}/Dev/OpenSSLx86MinGW/include/:${SYSTEMDRIVE}/Dev/OpenSSLx86MinGW/lib/"
if [ -d ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/*.* ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/* ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/ ]; then mkdir ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/
fi
cd ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/
${SYSTEMDRIVE}/Dev/Qt5SrcGit/qt5/configure QMAKE_CXXFLAGS_RELEASE-='-O2' QMAKE_CXXFLAGS+='-fPIC -pipe -O3 -std=c++17 -Wl,-pic' QMAKE_LFLAGS+='-Wl,-pic' QMAKE_MAKEFLAGS+='-j$(nproc)' -silent -platform win32-g++ -opensource -confirm-license -prefix ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/ -opengl desktop -debug-and-release -no-feature-d3d12 -no-ltcg -no-optimize-size -no-optimize-debug -qt-zlib -qt-doubleconversion -qt-harfbuzz -qt-pcre -icu -I"${SYSTEMDRIVE}/Dev/msys64/mingw32/include" -L"${SYSTEMDRIVE}/Dev/msys64/mingw32/lib" -openssl-linked -I"${SYSTEMDRIVE}/Dev/OpenSSLx86MinGW/include" -L"${SYSTEMDRIVE}/Dev/OpenSSLx86MinGW/lib" OPENSSL_LIBS='${SYSTEMDRIVE}/Dev/OpenSSLx86MinGW/lib/libssl.a ${SYSTEMDRIVE}/Dev/OpenSSLx86MinGW/lib/libcrypto.a ${SYSTEMDRIVE}/Dev/msys64/mingw32/i686-w64-mingw32/lib/libws2_32.a' -nomake tests -nomake examples -no-warnings-are-errors -skip qtwebengine
make --jobs=$(nproc) V=1 1>${SYSTEMDRIVE}/Dev/LogQt5MSYS2IssueX86.txt 2>&1
cd ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/
make install
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw32/bin/libclang.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw32/bin/libgcc_s_dw2-1.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/ICUx86MinGW/bin/icuin69.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/ICUx86MinGW/bin/icuuc69.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/ICUx86MinGW/bin/icudt69.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw32/bin/libstdc++-6.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw32/bin/libwinpthread-1.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw32/bin/libzstd.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/msys64/mingw32/bin/zlib1.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/OpenSSLx86MinGW/bin/libcrypto-1_1.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
cp --force --verbose ${SYSTEMDRIVE}/Dev/OpenSSLx86MinGW/bin/libssl-1_1.dll ${SYSTEMDRIVE}/Dev/Qt5x86MinGW/bin/
#Building of the Qt Documentation is disabled because I already build it with the 64-Bit Variant. Just enable it if you need to.
#make --jobs=$(nproc) V=1 docs
#make --jobs=1 V=1 install_docs
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/*.* ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/* ${SYSTEMDRIVE}/Dev/QtSrcx86MinGW/
echo DONE!
echo DISABLED: sleep 10s
exit
