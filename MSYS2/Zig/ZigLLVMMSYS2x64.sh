#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2023 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2013-2023 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# INFO: THIS SCRIPT IS ONLY FOR THE CASE WHEN YOU NEED TO BUILD LLVM, CLANG ETC. FROM SOURCE SPECIFICALLY TO BUILD THE ZIG COMPILER!
if [ ! -d ${SYSTEMDRIVE}/Dev/ ]; then mkdir ${SYSTEMDRIVE}/Dev/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/ ]; then mkdir ${SYSTEMDRIVE}/Dev/Builds/
fi
if [ -d ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/*.* ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/* ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/
fi

if [ -d ${SYSTEMDRIVE}/Dev/Builds/lld-build-debug/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/*.* ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/* ${SYSTEMDRIVE}/Dev/Builds/lld-build-debug/
fi

if [ -d ${SYSTEMDRIVE}/Dev/Builds/clang-build-debug/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/*.* ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/* ${SYSTEMDRIVE}/Dev/Builds/clang-build-debug/
fi

if [ -d ${SYSTEMDRIVE}/Dev/Builds/llvm-build-release/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/*.* ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/* ${SYSTEMDRIVE}/Dev/Builds/llvm-build-release/
fi

if [ -d ${SYSTEMDRIVE}/Dev/Builds/lld-build-release/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/*.* ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/* ${SYSTEMDRIVE}/Dev/Builds/lld-build-release/
fi

if [ -d ${SYSTEMDRIVE}/Dev/Builds/clang-build-release/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/*.* ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug/* ${SYSTEMDRIVE}/Dev/Builds/clang-build-release/
fi


if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/Zigx64/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/zig/ ${SYSTEMDRIVE}/Dev/Builds/Zigx64/
fi
cd ${SYSTEMDRIVE}/Dev/Builds/Zigx64/
# --- Section to build Debug Libraries ---
# --- BUILD LLVM ---
mkdir ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug
cd ${SYSTEMDRIVE}/Dev/Builds/llvm-build-debug
cmake .. -Thost=x64 -G " Visual Studio 17 2022" -A x64 -DCMAKE_INSTALL_PREFIX="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Debug" -
DLLVM_ENABLE_ZLIB=OFF -DCMAKE_PREFIX_PATH="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Debug" -DCMAKE_BUILD_TYPE=Debug -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="AVR" -DLLVM_ENABLE_LIBXML2=OFF -DLLVM_USE_CRT_DEBUG=MTd
msbuild /m INSTALL.vcxproj
# --- BUILD LLD ---
mkdir ${SYSTEMDRIVE}/Dev/Builds/lld-build-debug
cd ${SYSTEMDRIVE}/Dev/Builds/lld-build-debug
cmake.exe .. -Thost=x64 -G " Visual Studio 17 2022" -A x64 -DCMAKE_INSTALL_PREFIX="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Debug" -DCMAKE_PREFIX_PATH="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Debug" -DCMAKE_BUILD_TYPE=Debug -DLLVM_USE_CRT_DEBUG=MTd
msbuild /m INSTALL.vcxproj
# --- BUILD CLANG ---
mkdir ${SYSTEMDRIVE}/Dev/Builds/clang-build-debug
cd ${SYSTEMDRIVE}/Dev/Builds/clang-build-debug
cmake .. -Thost=x64 -G " Visual Studio 17 2022" -A x64 -DCMAKE_INSTALL_PREFIX="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Debug" -DCMAKE_PREFIX_PATH="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Debug" -DCMAKE_BUILD_TYPE=Debug -DLLVM_USE_CRT_DEBUG=MTd
msbuild /m INSTALL.vcxproj

#make --jobs=$(nproc) V=1
#make check V=1
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
make install V=1
make --jobs=1 V=1 distclean
# --- Section to build Release Libraries ---
# --- BUILD LLVM ---
mkdir ${SYSTEMDRIVE}/Dev/Builds/llvm-build-release
cd ${SYSTEMDRIVE}/Dev/Builds/llvm-build-release
"${SYSTEMDRIVE}/Dev/Binaries/CMakex64/cmake.exe" .. -Thost=x64 -G "Visual Studio 16 2019" -A x64 -DCMAKE_INSTALL_PREFIX="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Release"-mt -DCMAKE_PREFIX_PATH="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Release"-mt -
DLLVM_ENABLE_ZLIB=OFF -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_LIBXML2=OFF -DLLVM_USE_CRT_RELEASE=MT
msbuild /m -p:Configuration=Release INSTALL.vcxproj
# --- BUILD LLD ---
mkdir ${SYSTEMDRIVE}/Dev/Builds/lld-build-release
cd ${SYSTEMDRIVE}/Dev/Builds/lld-build-release
"${SYSTEMDRIVE}/Dev/Binaries/CMakex64/cmake.exe" .. -Thost=x64 -G "Visual Studio 16 2019" -A x64 -DCMAKE_INSTALL_PREFIX=C:\Users\Andy\llvm+clang+lld-14.0.6-x86_64-windows-msvc-release-mt -DCMAKE_PREFIX_PATH="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Release"-mt -DCMAKE_BUILD_TYPE=Release -DLLVM_USE_CRT_RELEASE=MT
msbuild /m -p:Configuration=Release INSTALL.vcxproj
# --- BUILD CLANG ---
mkdir ${SYSTEMDRIVE}/Dev/Builds/clang-build-release
cd ${SYSTEMDRIVE}/Dev/Builds/clang-build-release
"${SYSTEMDRIVE}/Dev/Binaries/CMakex64/cmake.exe" .. -Thost=x64 -G "Visual Studio 16 2019" -A x64 -DCMAKE_INSTALL_PREFIX="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Release"-mt -DCMAKE_PREFIX_PATH="${SYSTEMDRIVE}/Dev/Binaries/LLVMForZigx64-MSVC-Release"-mt -DCMAKE_BUILD_TYPE=Release -DLLVM_USE_CRT_RELEASE=MT
msbuild /m -p:Configuration=Release INSTALL.vcxproj

make --jobs=$(nproc) V=1
make check V=1
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
make install V=1
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Zigx64/*.* ${SYSTEMDRIVE}/Dev/Builds/Zigx64/* ${SYSTEMDRIVE}/Dev/Builds/Zigx64/
echo DONE!
echo DISABLED: sleep 10s
exit
