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
export LLVM_INSTALL_DIR="${SYSTEMDRIVE}/Dev/msys64/mingw64"
export MAKEFLAGS='-j$(nproc)'
export OPENSSL_LIBS='${SYSTEMDRIVE}/Dev/OpenSSLx64StaticMinGW/lib/libssl.a ${SYSTEMDRIVE}/Dev/OpenSSLx64StaticMinGW/lib/libcrypto.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libws2_32.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libcrypt32.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libadvapi32.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libgdi32.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libuser32.a'
export PATH="${PATH}:${SYSTEMDRIVE}/Dev/Qt5QtIFWCompatibleSrcGit/qt5/gnuwin32/bin/:${SYSTEMDRIVE}/Dev/OpenSSLx64StaticMinGW/include/:${SYSTEMDRIVE}/Dev/OpenSSLx64StaticMinGW/lib/:${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/"
if [ -d ${SYSTEMDRIVE}/Dev/QtSrcx64StaticMinGW/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtSrcx64StaticMinGW/*.* ${SYSTEMDRIVE}/Dev/QtSrcx64StaticMinGW/* ${SYSTEMDRIVE}/Dev/QtSrcx64StaticMinGW/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/QtSrcx64StaticMinGW/ ]; then mkdir ${SYSTEMDRIVE}/Dev/QtSrcx64StaticMinGW/
fi
cd ${SYSTEMDRIVE}/Dev/QtSrcx64StaticMinGW/
${SYSTEMDRIVE}/Dev/Qt5QtIFWCompatibleSrcGit/qt5/configure QMAKE_CXXFLAGS_RELEASE-='-O2' QMAKE_CXXFLAGS+='-fPIE -pipe -Os -std=c++17 -Wl,-pie' QMAKE_LFLAGS+='-Wl,-pie' QMAKE_MAKEFLAGS+='-j$(nproc)' -silent -platform win32-g++ -opensource -confirm-license -release -static -static-runtime -accessibility -no-feature-d3d12 -no-icu -no-ltcg -no-opengl -no-qml-debug -qt-zlib -sql-sqlite -no-vulkan -nomake examples -nomake tests -optimize-size -prefix ${SYSTEMDRIVE}/Dev/Qt5x64StaticMinGW/ -openssl-linked -I"${SYSTEMDRIVE}/Dev/OpenSSLx64StaticMinGW/include" -L"${SYSTEMDRIVE}/Dev/OpenSSLx64StaticMinGW/lib" OPENSSL_LIBS='${SYSTEMDRIVE}/Dev/OpenSSLx64StaticMinGW/lib/libssl.a ${SYSTEMDRIVE}/Dev/OpenSSLx64StaticMinGW/lib/libcrypto.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libws2_32.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libcrypt32.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libadvapi32.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libgdi32.a ${SYSTEMDRIVE}/Dev/msys64/mingw64/x86_64-w64-mingw32/lib/libuser32.a'
make --jobs=$(nproc) V=1 module-qtbase module-qtdeclarative module-qttools module-qttranslations module-qtwinextras
echo DISABLED: sleep 10s
make install
echo DISABLED: sleep 10s
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/QtSrcx64StaticMinGW/*.* ${SYSTEMDRIVE}/Dev/QtSrcx64StaticMinGW/* ${SYSTEMDRIVE}/Dev/QtSrcx64StaticMinGW/
echo DONE!
echo DISABLED: sleep 10s
exit
