@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD NINJA-X64 RELEASE DYNAMIC MSVC
:START
set CL=/MP%NUMBER_OF_PROCESSORS% /cgthreads8 /utf-8 /nologo /GL /GS /Gw /Gy /guard:cf /permissive- /Qpar /Qspectre /sdl /ZH:SHA_256
set LINK=/NOLOGO /CGTHREADS:%NUMBER_OF_PROCESSORS% /DYNAMICBASE /GUARD:CF /HIGHENTROPYVA /LARGEADDRESSAWARE /LTCG:STATUS /NXCOMPAT
set PATH=%PATH%;%SystemDrive%\Dev\CMake\bin\;%SystemDrive%\Dev\Pythonx64\;%SystemDrive%\Dev\Ninja\
if not exist %SystemDrive%\Dev\NinjaSrcx64MSVC\ ( 
mkdir %SystemDrive%\Dev\NinjaSrcx64MSVC\ 
goto :BUILD1 
)

if exist %SystemDrive%\Dev\NinjaSrcx64MSVC\ ( 
cd %SystemDrive%\Dev\NinjaSrcx64MSVC\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\NinjaSrcx64MSVC\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\NinjaSrcx64MSVC\
goto :BUILD1 
)


:BUILD1
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\GitRepos\ninja\ %SystemDrive%\Dev\NinjaSrcx64MSVC\ /xd ".git" & ^
cd %SystemDrive%\Dev\NinjaSrcx64MSVC\ && ^
configure.py --verbose --bootstrap && ^
ninja ninja_test && ^
ninja_test.exe && ^
goto :RENAMEOLDNINJA

:RENAMEOLDNINJA
if exist %SystemDrive%\Dev\Ninja\ninja.exe ( 
ren %SystemDrive%\Dev\Ninja\ninja.exe ninja.exe.old
cd %SystemDrive%\Dev\NinjaSrcx64MSVC\ )
rem 10 Seconds to check the Result from ninja-test.exe and press CTRL+C etc. to stop the Script if necessary
timeout /t 10 /nobreak && ^
robocopy %SystemDrive%\Dev\NinjaSrcx64MSVC\ %SystemDrive%\Dev\Ninja\ ninja.exe && ^
cd %SystemDrive%\Dev\NinjaSrcx64MSVC\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\Dev\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\NinjaSrcx64MSVC\ /s /q && ^
echo DONE! && ^
pause;
