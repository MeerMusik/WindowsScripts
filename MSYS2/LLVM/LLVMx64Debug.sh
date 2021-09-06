#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
#If there is an additional Compiler than GCC/G++ in the Path, tell CMake that we definitely want to use GCC and that it should ignore everything else
export CC=gcc
export CXX=g++
echo How to build Clang/LLVM: Basic starting Guide: https://clang.llvm.org/get_started.html
echo Additional Dependency for LLDB: SWIG: http://www.swig.org/
if [ ! -d ${SYSTEMDRIVE}/Dev/ ]; then mkdir ${SYSTEMDRIVE}/Dev/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/ ]; then mkdir ${SYSTEMDRIVE}/Dev/Builds/
fi
if [ -d ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/*.* ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/* ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/ ]; then mkdir ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/
fi
cd ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/
cmake ${SYSTEMDRIVE}/Dev/GitRepos/llvm-project/llvm/ ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/ -G'Ninja' -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_C_FLAGS_RELEASE='-fasynchronous-unwind-tables -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -grecord-gcc-switches -m64 -pthread -Og -g1 -pipe -Wall -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--high-entropy-va -Wl,--nxcompat -Wa,-mbig-obj' -DCMAKE_CXX_FLAGS_RELEASE='-fasynchronous-unwind-tables -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -grecord-gcc-switches -m64 -pthread -Og -g1 -pipe -Wall -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--high-entropy-va -Wl,--nxcompat' -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra;compiler-rt;debuginfo-tests;lld;lldb;llvm' -DCMAKE_CXX_STANDARD=17 -DCMAKE_INSTALL_PREFIX=${SYSTEMDRIVE}/Dev/Binaries/LLVMx64Debug/ -DCMAKE_BUILD_TYPE='Release' -DLLVM_TARGETS_TO_BUILD='X86' -DLLVM_INCLUDE_EXAMPLES='OFF' -DLLVM_INCLUDE_TESTS='OFF' -DLLVM_INCLUDE_DOCS='OFF' -DLLVM_PARALLEL_COMPILE_JOBS=$(nproc) -DLLVM_PARALLEL_LINK_JOBS=$(nproc) -DLLVM_ENABLE_EH='ON' -DLLVM_ENABLE_RTTI='ON' -DLLVM_ENABLE_DIA_SDK='OFF' -DLLVM_ENABLE_ASSERTIONS='OFF'
ninja
echo Script paused for 10 Seconds to be able to read the Test / Build Results! Please wait a Moment...
sleep 10s
ninja install
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/*.* ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/* ${SYSTEMDRIVE}/Dev/Builds/LLVMx64Debug/
exit
