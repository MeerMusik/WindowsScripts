@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD OPENSSL-X64 RELEASE DYNAMIC MSVC
:START
set CL=/MP1 /bigobj /cgthreads8 /DWINVER=0x0601 /D_WIN32_WINNT=_WIN32_WINNT_WIN7 /utf-8 /nologo /FS /GL /GS /Gw /Gy /O2 /permissive- /Qpar /Qspectre /sdl /Zc:__cplusplus /ZH:SHA_256
set LINK=/NOLOGO /CGTHREADS:8 /DYNAMICBASE /HIGHENTROPYVA /LARGEADDRESSAWARE /LTCG:STATUS /NXCOMPAT
set PATH=%PATH%;%SystemDrive%\Dev\NASMx64\;%SystemDrive%\Dev\Perlx64\perl\bin\;%SystemDrive%\Dev\JOM\
if not exist %SystemDrive%\Dev\OpenSSLSrcx64MSVC\ ( 
mkdir %SystemDrive%\Dev\OpenSSLSrcx64MSVC\
goto :BUILD 
)

if exist %SystemDrive%\Dev\OpenSSLSrcx64MSVC\ ( 
cd %SystemDrive%\Dev\OpenSSLSrcx64MSVC\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\OpenSSLSrcx64MSVC\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\OpenSSLSrcx64MSVC\
goto :BUILD 
)

if not exist *.* ( 
goto :BUILD 
)

:BUILD
cd %SystemDrive%\Dev\OpenSSLSrcx64MSVC\ && ^
echo TO BUILD THE DOCUMENTATION, REMOVE "doc" FROM THE EXCLUDED DIRECTORIES. && ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\GitRepos\openssl\ %SystemDrive%\Dev\OpenSSLSrcx64MSVC\ /xd ".git" ".github" "boringssl" "demos" "doc" ".jenkins" "krb5" "pyca-cryptography" ".travis" "vms" & ^
perl Configure shared --release no-idea no-mdc2 no-rc5 no-comp no-deprecated no-weak-ssl-ciphers no-ssl3 no-ssl3-method no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-dtls1 no-dtls1-method VC-WIN64A --prefix=%SystemDrive%\Dev\OpenSSLx64MSVC\ --openssldir=%SystemDrive%\Dev\OpenSSLx64MSVC\ && ^
rem Do NOT use more than 8 CPU Cores / Threads when building OpenSSL! The old Build System will error out in 9 out of 10 times! No need to worry about Tests: They are limited to use 1 Core / 1 Thread by Design.
jom /nologo /j8 && ^
jom /nologo test && ^
pause; && ^
echo I do not want the Documentation. So I use 'install_sw' instead of 'install' && ^
jom /nologo install_sw && ^
cd %SystemDrive%\Dev\OpenSSLSrcx64MSVC\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\OpenSSLSrcx64MSVC\ /s /q && ^
echo DONE! && ^
pause;
