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
if [ -d ${SYSTEMDRIVE}/Dev/Builds/OpenSSLx64Debug/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/OpenSSLx64Debug/*.* ${SYSTEMDRIVE}/Dev/Builds/OpenSSLx64Debug/* ${SYSTEMDRIVE}/Dev/Builds/OpenSSLx64Debug/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/OpenSSLx64Debug/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/openssl/ ${SYSTEMDRIVE}/Dev/Builds/OpenSSLx64Debug/
fi
cd ${SYSTEMDRIVE}/Dev/Builds/OpenSSLx64Debug/
perl Configure CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -fstack-protector-all -grecord-gcc-switches -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -g3 -ggdb -pipe -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--default-image-base-high -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-Bdynamic' shared --debug no-idea no-mdc2 no-rc5 no-comp no-deprecated no-weak-ssl-ciphers no-ssl3 no-ssl3-method no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-dtls1 no-dtls1-method mingw64 --prefix=${SYSTEMDRIVE}/Dev/Binaries/OpenSSLx64Debug/ --openssldir=${SYSTEMDRIVE}/Dev/Binaries/OpenSSLx64Debug/
make --jobs=$(nproc) V=1
make --jobs=$(nproc) test
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
echo I do not want the Documentation. So I use 'install_sw' instead of 'install'
make install_sw
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/OpenSSLx64Debug/*.* ${SYSTEMDRIVE}/Dev/Builds/OpenSSLx64Debug/* ${SYSTEMDRIVE}/Dev/Builds/OpenSSLx64Debug/
echo DONE!
echo DISABLED: sleep 10s
exit
