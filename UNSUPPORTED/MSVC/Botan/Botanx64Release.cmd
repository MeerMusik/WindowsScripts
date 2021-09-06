@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD BOTAN-X64 RELEASE DYNAMIC MSVC
:START
set CL=/MP%NUMBER_OF_PROCESSORS% /bigobj /cgthreads8 /utf-8 /nologo /FS /GL /GS /Gw /Gy /guard:cf /permissive- /Qpar /Qspectre /sdl /Zc:__cplusplus /ZH:SHA_256
set LINK=/NOLOGO /CGTHREADS:%NUMBER_OF_PROCESSORS% /DYNAMICBASE /GUARD:CF /HIGHENTROPYVA /LARGEADDRESSAWARE /LTCG:STATUS /NXCOMPAT
set PATH=%PATH%;%SystemDrive%\Dev\JOM\;%SystemDrive%\Dev\Perlx64\perl\bin\;%SystemDrive%\Dev\Pythonx64\
if not exist %SystemDrive%\Dev\BotanSrcx64MSVC\ ( 
mkdir %SystemDrive%\Dev\BotanSrcx64MSVC\ 
goto :BUILD 
)

if exist %SystemDrive%\Dev\BotanSrcx64MSVC\ ( 
cd %SystemDrive%\Dev\BotanSrcx64MSVC\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\BotanSrcx64MSVC\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\BotanSrcx64MSVC\
goto :BUILD 
)

:BUILD
cd %SystemDrive%\Dev\BotanSrcx64MSVC\ && ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\GitRepos\botan\ %SystemDrive%\Dev\BotanSrcx64MSVC\ /xd ".git" & ^
cd %SystemDrive%\Dev\BotanSrcx64MSVC\ && ^
python configure.py --prefix=%SystemDrive%/Dev/Botanx64MSVC/ --verbose --enable-shared-library --cpu=x86_64 --cc=msvc --os=windows && ^
jom /nologo && ^
botan-test.exe && ^
pause; && ^
jom install && ^
echo cd %SystemDrive%\Dev\BotanSrcx64MSVC\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\Dev\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\BotanSrcx64MSVC\ /s /q && ^
echo DONE! && ^
pause;
