@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2023 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2023 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD ZIG-X86 DEBUG AND RELEASE STATIC GNU-MINGW64
:START
rem Make sure to have the latest Devkit Downloaded and Ready for use: See here how to: https://github.com/ziglang/zig/wiki/Building-Zig-on-Windows
rem Also the Version of the Zig Devkit must match Major and Minor Version of the existing Zig Compiler!
rem Build Debug Variant
set DEVKIT=%SystemDrive%\Dev\zigdevkit\
if not exist %SystemDrive%\Dev\Builds\Zigx86Debug\ ( 
mkdir %SystemDrive%\Dev\Builds\Zigx86Debug\ 
goto :BUILDDEBUG 
)

if exist %SystemDrive%\Dev\Builds\Zigx86Debug\ ( 
cd %SystemDrive%\Dev\Builds\Zigx86Debug\
goto :CLEANDIRECTORYDEBUG 
)

:CLEANDIRECTORYDEBUG
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\Builds\Zigx86Debug\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\Builds\Zigx86Debug\
goto :BUILDDEBUG 
)

:BUILDDEBUG
cd %SystemDrive%\Dev\Builds\Zigx86Debug\ && ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\GitRepos\zig\ %SystemDrive%\Dev\Builds\Zigx86Debug\ /xd ".git" & ^
cd %SystemDrive%\Dev\Builds\Zigx86Debug\ && ^
rem BUG How to build the Language Reference and Docs??
%SYSTEMDRIVE%\Dev\zigx86\zig.exe build -p stage3 --search-prefix %DEVKIT% --zig-lib-dir lib -Dstatic-llvm -Duse-zig-libcxx -Dtarget=x86-windows-gnu --verbose -Dno-langref -Dno-autodocs -Doptimize=Debug --prefix %SYSTEMDRIVE%/Dev/Binaries/Zigx86StaticDebug/ && ^
rem BUG How to use Build Tests? Docs are outdated!
rem stage3\bin\zig.exe build test
cd %SystemDrive%\Dev\Builds\Zigx86Debug\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\Dev\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\Builds\Zigx86Debug\ /s /q && ^
echo DONE! && ^
goto :PREPAREBUILDRELEASE 

rem Build Release Variant
:PREPAREBUILDRELEASE
set DEVKIT=%SystemDrive%\Dev\zigdevkit\
if not exist %SystemDrive%\Dev\Builds\Zigx86Release\ ( 
mkdir %SystemDrive%\Dev\Builds\Zigx86Release\ 
goto :BUILDRELEASE 
)

if exist %SystemDrive%\Dev\Builds\Zigx86Release\ ( 
cd %SystemDrive%\Dev\Builds\Zigx86Release\
goto :CLEANDIRECTORYRELEASE 
)

:CLEANDIRECTORYRELEASE
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\Builds\Zigx86Release\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\Builds\Zigx86Release\
goto :BUILDRELEASE 
)

:BUILDRELEASE
cd %SystemDrive%\Dev\Builds\Zigx86Release\ && ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\GitRepos\zig\ %SystemDrive%\Dev\Builds\Zigx86Release\ /xd ".git" & ^
cd %SystemDrive%\Dev\Builds\Zigx86Release\ && ^
rem BUG How to build the Language Reference and Docs??
rem BUG Which is the current correct Default Value for Release Builds? ReleaseFast? ReleaseSafe? ReleaseSmall?
%SYSTEMDRIVE%\Dev\zigx86\zig.exe build -p stage3 --search-prefix %DEVKIT% --zig-lib-dir lib -Dstatic-llvm -Duse-zig-libcxx -Dtarget=x86-windows-gnu --verbose -Dno-langref -Dno-autodocs -Doptimize=ReleaseSmall --prefix %SYSTEMDRIVE%/Dev/Binaries/Zigx86StaticRelease/ && ^
rem BUG How to use Build Tests? Docs are outdated!
rem stage3\bin\zig.exe build test
cd %SystemDrive%\Dev\Builds\Zigx86Release\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\Dev\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\Builds\Zigx86Release\ /s /q && ^
echo DONE!
