@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD GAMMARAY-X64 DYNAMIC MSVC
rem This Command Shell Script is set up to use Ninja instead of NMake. Ninja is a small build system which extremely minimizes build time.
rem Ninja is Open Source. Download the latest Version for Free from https://ninja-build.org/ - No Installation needed! Just "unzip and run".

rem How to use Ninja:
rem 1.) Unzip the Archive to a Folder without Spaces - you can use %SystemDrive%\Dev\Ninja for example - as this is Part of the "set Path" Command below and ready to use :)
rem     You can use any Folder you want of course, just make sure the Ninja Directory Entry is modified accordingly in the "set Path" Command.
rem 2.) Change "%SystemDrive%\Dev\GitRepos\GammaRay\*.*" to the GammaRay Source Directory accordingly.
rem 3.) Open the Visual Studio CMD Prompt.
rem 4.) Type GammaRayx64ReleaseMSVC and press the Enter Key (Use Lower Case or Upper Case - it does not matter on Windows)
rem 4.)A.) CMake automatically creates the necessary "build.ninja" File. No need to create your own. But you can if you have specific needs
rem 5.) Wait until everything got built and installed (copied) to the Target Directory
rem 6.) Thats all

rem For the Installation Process: From my experience, it is always advisable, to force any Tool that copies Files or Directories, to use only 1 Core to copy the Files to the Target Folder.
rem It is easy to run into a "File is in use by another Process" Error on Windows otherwise.

rem You want to use the Default Toolset instead of Ninja and waste your time? No Problem:
rem 1.) Change "Ninja" to "NMake Makefiles"
rem 2.) Change:
rem ninja && ^
rem ninja -j1 install && ^
rem to
rem nmake /nologo && ^
rem nmake /nologo install && ^
rem 3.) Enjoy wasting your time :)

:START
set CL=/MP%NUMBER_OF_PROCESSORS% /cgthreads8 /utf-8 /nologo /GS /Gw /Gy /permissive- /Qpar /Qspectre /Zc:__cplusplus /ZH:SHA_256
set LINK=/NOLOGO /CGTHREADS:%NUMBER_OF_PROCESSORS% /DYNAMICBASE /HIGHENTROPYVA /LARGEADDRESSAWARE /NXCOMPAT
set PATH=%PATH%;%SystemDrive%\Dev\CMake\bin\;%SystemDrive%\Dev\Qt5x64MSVC\bin\;%SystemDrive%\Dev\Ninja\
if not exist %SystemDrive%\Dev\GammaRayQt5Srcx64MSVC\ ( 
mkdir %SystemDrive%\Dev\GammaRayQt5Srcx64MSVC\
goto :CHECKFOREXISTINGBUILDDIR 
)

if exist %SystemDrive%\Dev\GammaRayQt5Srcx64MSVC\ ( 
cd %SystemDrive%\Dev\GammaRayQt5Srcx64MSVC\
goto :CLEANSRCDIRECTORY 
)

:CLEANSRCDIRECTORY
if exist *.* ( 
del *.* /s /f /q
goto :CHECKFOREXISTINGBUILDDIR 
)

if not exist *.* ( 
goto :CHECKFOREXISTINGBUILDDIR 
)

:CHECKFOREXISTINGBUILDDIR
if not exist %SystemDrive%\Dev\GammaRayQt5Bldx64MSVC\ ( 
mkdir %SystemDrive%\Dev\GammaRayQt5Bldx64MSVC\
goto :BUILD 
)

if exist %SystemDrive%\Dev\GammaRayQt5Bldx64MSVC\ ( 
cd %SystemDrive%\Dev\GammaRayQt5Bldx64MSVC\
goto :CLEANBUILDDIRECTORY 
)

:CLEANBUILDDIRECTORY
if exist *.* ( 
del *.* /s /f /q
goto :BUILD 
)

if not exist *.* ( 
goto :BUILD 
)

:BUILD
cd %SystemDrive%\Dev\GammaRayQt5Srcx64MSVC\ && ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\GitRepos\GammaRay\ %SystemDrive%\Dev\GammaRayQt5Srcx64MSVC\ /xd ".git" & ^
cd %SystemDrive%\Dev\GammaRayQt5Bldx64MSVC\ && ^
cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX=%SystemDrive%\Dev\GammaRayQt5x64MSVC\ %SystemDrive%\Dev\GammaRayQt5Srcx64MSVC\ && ^
ninja && ^
ninja install && ^
cd %SystemDrive%\Dev\GammaRayQt5Srcx64MSVC\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\Dev\GammaRayQt5Bldx64MSVC\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\GammaRayQt5Srcx64MSVC\ /s /q && ^
rmdir %SystemDrive%\Dev\GammaRayQt5Bldx64MSVC\ /s /q && ^
echo DONE! && ^
pause;
