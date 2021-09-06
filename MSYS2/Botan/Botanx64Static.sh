#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
if [ ! -d ${SYSTEMDRIVE}/Dev/ ]; then mkdir ${SYSTEMDRIVE}/Dev/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/ ]; then mkdir ${SYSTEMDRIVE}/Dev/Builds/
fi
if [ -d ${SYSTEMDRIVE}/Dev/Builds/Botanx64/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Botanx64/*.* ${SYSTEMDRIVE}/Dev/Builds/Botanx64/* ${SYSTEMDRIVE}/Dev/Builds/Botanx64/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/Botanx64/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/botan/ ${SYSTEMDRIVE}/Dev/Builds/Botanx64/
fi
cd ${SYSTEMDRIVE}/Dev/Builds/Botanx64/
# --- Section to build Debug Libraries ---
python configure.py --prefix=${SYSTEMDRIVE}/Dev/Binaries/Botanx64Debug/ --verbose --cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -pie -grecord-gcc-switches -fstack-protector-all -ftrapv -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -Og -g3 -ggdb -static-libgcc -static-libstdc++ -static-pie -pipe -pthread -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--default-image-base-high -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-Og -Wl,--pic-executable -Wl,-Bstatic -Wl,-static -Wa,-mbig-obj' --ldflags='-static' --link-method=hardlink --with-stack-protector --extra-libs='ssp' --amalgamation --with-pkg-config --debug-mode --cc=gcc --cpu=x86_64 --os=mingw
make --jobs=$(nproc) V=1
make check V=1
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
make install V=1
make --jobs=1 V=1 distclean
# --- Section to build Release Libraries ---
python configure.py --prefix=${SYSTEMDRIVE}/Dev/Binaries/Botanx64Release/ --verbose --cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -pie -grecord-gcc-switches -fstack-protector-all -ftrapv -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -Og -g1 -static-libgcc -static-libstdc++ -static-pie -pipe -pthread -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--default-image-base-high -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-Og -Wl,--pic-executable -Wl,-Bstatic -Wl,-static -Wa,-mbig-obj' --ldflags='-static' --link-method=hardlink --with-stack-protector --extra-libs='ssp' --amalgamation --with-pkg-config --cc=gcc --cpu=x86_64 --os=mingw
make --jobs=$(nproc) V=1
make check V=1
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
make install V=1
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/Botanx64/*.* ${SYSTEMDRIVE}/Dev/Builds/Botanx64/* ${SYSTEMDRIVE}/Dev/Builds/Botanx64/
echo DONE!
echo DISABLED: sleep 10s
exit
