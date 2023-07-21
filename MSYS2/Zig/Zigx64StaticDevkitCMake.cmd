rem @echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2023 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2023 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD ZIG-X64 DEBUG AND RELEASE STATIC MSVC
:START
rem Build Debug Variant
rem Use Zig CMake Config Value for now!
rem set CL=/MP%NUMBER_OF_PROCESSORS% /cgthreads8 /utf-8 /nologo /GL- /GS /Gw /Gy /guard:cf /permissive- /Qpar /Qspectre /Zc:__cplusplus /ZH:SHA_256
rem set LINK=/NOLOGO /CGTHREADS:%NUMBER_OF_PROCESSORS% /DYNAMICBASE /GUARD:CF /HIGHENTROPYVA /LARGEADDRESSAWARE /LTCG:OFF /NXCOMPAT
set PATH=%PATH%;%SystemDrive%\Dev\CMake\bin\;C:\Dev\Ninja\
set DEVKIT=%SystemDrive%\Dev\zigdevkit\
if not exist %SystemDrive%\Dev\Builds\Zigx64Debug\ ( 
mkdir %SystemDrive%\Dev\Builds\Zigx64Debug\ 
goto :BUILDDEBUG 
)

if exist %SystemDrive%\Dev\Builds\Zigx64Debug\ ( 
cd %SystemDrive%\Dev\Builds\Zigx64Debug\
goto :CLEANDIRECTORYDEBUG 
)

:CLEANDIRECTORYDEBUG
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\Builds\Zigx64Debug\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\Builds\Zigx64Debug\
goto :BUILDDEBUG 
)

:BUILDDEBUG
cd %SystemDrive%\Dev\Builds\Zigx64Debug\ && ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\GitRepos\zig\ %SystemDrive%\Dev\Builds\Zigx64Debug\ /xd ".git" & ^
cd %SystemDrive%\Dev\Builds\Zigx64Debug\ && ^
rem cmake %SystemDrive%\Dev\Builds\Zigx64Debug\ -G"Ninja" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=%SystemDrive%\Dev\CMakeGit\ && ^
cmake %SystemDrive%\Dev\Builds\Zigx64Debug\ -G"Ninja" -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_PREFIX_PATH="%DEVKIT%" -DCMAKE_C_COMPILER="%DEVKIT%/bin/zig.exe;cc" -DCMAKE_CXX_COMPILER="%DEVKIT%/bin/zig.exe;c++" -DCMAKE_AR="%DEVKIT%/bin/zig.exe" -DZIG_AR_WORKAROUND=ON -DZIG_STATIC=ON -DZIG_USE_LLVM_CONFIG=OFF -A x64 && ^
cmake --build . --verbose && ^
cmake --install . --verbose && ^
rem echo cd %SystemDrive%\Dev\Builds\Zigx64Debug\ && ^
rem del *.* /s /f /q && ^
rem cd %SystemDrive%\Dev\ && ^
rem echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
rem timeout /t 8 /nobreak && ^
rem rmdir %SystemDrive%\Dev\Builds\Zigx64Debug\ /s /q && ^
rem echo DONE! && ^
rem pause;

rem Build Release Variant
rem Use Zig CMake Config Value for now!
rem set CL=/MP%NUMBER_OF_PROCESSORS% /cgthreads8 /utf-8 /nologo /GL- /GS /Gw /Gy /guard:cf /permissive- /Qpar /Qspectre /Zc:__cplusplus /ZH:SHA_256
rem set LINK=/NOLOGO /CGTHREADS:%NUMBER_OF_PROCESSORS% /DYNAMICBASE /GUARD:CF /HIGHENTROPYVA /LARGEADDRESSAWARE /LTCG:OFF /NXCOMPAT
rem set PATH=%PATH%;%SystemDrive%\Dev\CMake\bin\;C:\Dev\Ninja\
rem set DEVKIT=%SystemDrive%\Dev\zigdevkit\
rem if not exist %SystemDrive%\Dev\Builds\Zigx64Release\ ( 
rem mkdir %SystemDrive%\Dev\Builds\Zigx64Release\ 
rem goto :BUILD 
rem )

rem if exist %SystemDrive%\Dev\Builds\Zigx64Release\ ( 
rem cd %SystemDrive%\Dev\Builds\Zigx64Release\
rem goto :CLEANDIRECTORY 
rem )

rem :CLEANDIRECTORY
rem if exist *.* ( 
rem del *.* /s /f /q
rem cd %SystemDrive%\
rem rmdir %SystemDrive%\Dev\Builds\Zigx64Release\ /s /q
rem echo Wait for Windows to release the Directory handle, then delete the Directory:
rem timeout /t 8 /nobreak
rem mkdir %SystemDrive%\Dev\Builds\Zigx64Release\
rem goto :BUILD 
rem )

rem :BUILD
rem cd %SystemDrive%\Dev\Builds\Zigx64Release\ && ^
rem robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\GitRepos\zig\ %SystemDrive%\Dev\Builds\Zigx64Release\ /xd ".git" & ^
rem cd %SystemDrive%\Dev\Builds\Zigx64Release\ && ^
rem cmake %SystemDrive%\Dev\Builds\Zigx64Release\ -G"Ninja" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=%SystemDrive%\Dev\CMakeGit\ && ^
rem cmake %SystemDrive%\Dev\Builds\Zigx64Release\ -G"Ninja" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_PREFIX_PATH="%DEVKIT%" -DCMAKE_C_COMPILER="%DEVKIT%/bin/zig.exe;cc" -DCMAKE_CXX_COMPILER="%DEVKIT%/bin/zig.exe;c++" -DCMAKE_AR="%DEVKIT%/bin/zig.exe" -DZIG_AR_WORKAROUND=ON -DZIG_STATIC=ON -DZIG_USE_LLVM_CONFIG=OFF -A X64 && ^
rem cmake --build . --verbose && ^
rem cmake --install . --verbose && ^
rem echo cd %SystemDrive%\Dev\Builds\Zigx64Release\ && ^
rem del *.* /s /f /q && ^
rem cd %SystemDrive%\Dev\ && ^
rem echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
rem timeout /t 8 /nobreak && ^
rem rmdir %SystemDrive%\Dev\Builds\Zigx64Release\ /s /q && ^
rem echo DONE! && ^
rem pause;
