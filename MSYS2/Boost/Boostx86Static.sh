#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
if [ ! -d ${SYSTEMDRIVE}/Dev/ ]; then mkdir ${SYSTEMDRIVE}/Dev/
fi
if [ -d ${SYSTEMDRIVE}/Dev/Builds/ ]; then mkdir ${SYSTEMDRIVE}/Dev/Builds/
fi
if [ -d ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/*.* ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/* ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/boost/ ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/
fi
cd ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/
./bootstrap.sh --with-toolset=gcc --without-icu --prefix=${SYSTEMDRIVE}/Dev/Binaries/Boostx86DebugStatic/
./b2 -d2 --debug-configuration --jobs$(nproc) -sNO_BZIP2=1 -sNO_ZLIB=1 --without-python --layout=tagged --build-type=complete toolset=gcc architecture=x86 address-model=32 link=static debug-symbols=on variant=debug threading=multi cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -pie -fstack-protector-all -grecord-gcc-switches -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -ggdb -g3 -static-libgcc -static-libstdc++ -static-pie -std=c++20 -pipe -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,--pic-executable -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--default-image-base-high -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-Bstatic -Wl,-static' --prefix=${SYSTEMDRIVE}/Dev/Binaries/Boostx86DebugStatic/ install
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/bin.v2
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/b2.exe
./bootstrap.sh --with-toolset=gcc --without-icu --prefix=${SYSTEMDRIVE}/Dev/Binaries/Boostx86ReleaseStatic/
./b2 -d2 --debug-configuration --jobs$(nproc) -sNO_BZIP2=1 -sNO_ZLIB=1 --without-python --layout=tagged --build-type=complete toolset=gcc architecture=x86 address-model=32 link=static debug-symbols=off variant=release threading=multi cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -pie -fstack-protector-all -grecord-gcc-switches -mindirect-branch=thunk -mindirect-branch-register -pthread -Os -g0 -static-libgcc -static-libstdc++ -static-pie -std=c++20 -pipe -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,--pic-executable -Wl,-Os -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--default-image-base-high -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-Bstatic -Wl,-static' --prefix=${SYSTEMDRIVE}/Dev/Binaries/Boostx86ReleaseStatic/ install
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/*.* ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/* ${SYSTEMDRIVE}/Dev/Builds/Boostx86Static/
echo DONE!
exit
