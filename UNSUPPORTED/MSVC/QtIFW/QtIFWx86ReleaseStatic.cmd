@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD QT-INSTALLER-FRAMEWORK-X86 RELEASE STATIC MSVC
:START
set CL=/MP%NUMBER_OF_PROCESSORS% /cgthreads8 /utf-8 /nologo
set LINK=/NOLOGO /CGTHREADS:%NUMBER_OF_PROCESSORS% /LTCG:STATUS
set QTDIR=%SystemDrive%\Dev\Qt5x86StaticMSVC\
set PATH=%PATH%;%QTDIR%\bin\;%SystemDrive%\Dev\Perlx64\perl\bin\;%SystemDrive%\Dev\Pythonx64\;%SystemDrive%\Dev\JOM\;%SystemDrive%\Dev\Git\bin\
if not exist %SystemDrive%\Dev\QtIFWx86MSVC\ ( 
mkdir %SystemDrive%\Dev\QtIFWx86MSVC\
goto :BUILD 
)

if exist %SystemDrive%\Dev\QtIFWx86MSVC\ ( 
cd %SystemDrive%\Dev\QtIFWx86MSVC\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\QtIFWx86MSVC\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\QtIFWx86MSVC\
goto :BUILD 
)

if not exist *.* ( 
goto :BUILD 
)

:BUILD
cd %SystemDrive%\Dev\QtIFWx86MSVC\ && ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\GitRepos\installer-framework\ %SystemDrive%\Dev\QtIFWx86MSVC\ & ^
%SystemDrive%\Dev\Qt5x86StaticMSVC\bin\qmake.exe QMAKE_CXXFLAGS_RELEASE-="-O1" QMAKE_CXXFLAGS_RELEASE+="/DWINVER=0x0601 /D_WIN32_WINNT=_WIN32_WINNT_WIN7 /GL /GS /Gw /Gy /guard:cf /Os /permissive- /Qpar /Qspectre-load /sdl /Zc:__cplusplus /ZH:SHA_256" QMAKE_LFLAGS_RELEASE+="/DYNAMICBASE /GUARD:CF /NXCOMPAT" installerfw.pro && ^
jom /nologo && ^
robocopy /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\QtIFWx86MSVC\tools\repocompare\release\ %SystemDrive%\Dev\QtIFWx86MSVC\bin\ repocompare.exe & ^
echo This creates the Documentation in the HTML Format under \doc\html. Recommended if you have never worked with the IFW before. Or if you find it too cumbersome to register and open the .qch Files in e.g. QtCreator. && ^
jom /nologo docs && ^
cd %SystemDrive%\Dev\QtIFWx86MSVC\ && ^
del %SystemDrive%\Dev\QtIFWx86MSVC\*.* /f /q && ^
del %SystemDrive%\Dev\QtIFWx86MSVC\.git\*.* /s /f /q && ^
del %SystemDrive%\Dev\QtIFWx86MSVC\dist\*.* /s /f /q && ^
del %SystemDrive%\Dev\QtIFWx86MSVC\lib\*.* /s /f /q && ^
del %SystemDrive%\Dev\QtIFWx86MSVC\src\*.* /s /f /q && ^
del %SystemDrive%\Dev\QtIFWx86MSVC\tests\*.* /s /f /q && ^
del %SystemDrive%\Dev\QtIFWx86MSVC\tools\*.* /s /f /q && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\QtIFWx86MSVC\.git\ /s /q && ^
rmdir %SystemDrive%\Dev\QtIFWx86MSVC\dist\ /s /q && ^
rmdir %SystemDrive%\Dev\QtIFWx86MSVC\lib\ /s /q && ^
rmdir %SystemDrive%\Dev\QtIFWx86MSVC\src\ /s /q && ^
rmdir %SystemDrive%\Dev\QtIFWx86MSVC\tests\ /s /q && ^
rmdir %SystemDrive%\Dev\QtIFWx86MSVC\tools\ /s /q && ^
echo DONE! && ^
pause;
