@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD ICU-X64 RELEASE DYNAMIC MSVC
rem IMPORTANT! In Case of Errors during compilation:

rem "Windows x.y SDK not found" Error:
rem For non-UWP: In the Directory "icu\icu4c\source\allinone" open the File "Build.Windows.ProjectConfiguration.props" and change:
rem <WindowsTargetPlatformVersion>8.1</WindowsTargetPlatformVersion>
rem to the Windows SDK Version you are using. Example:
rem <WindowsTargetPlatformVersion>10.0.19041.0</WindowsTargetPlatformVersion>

rem ICU should autimatically detect the installed UWP SDK Version and set it automatically. If not or if you have multiple UWP SDK Version installed:
rem You have to change 2 things:
rem 1.) Make sure the Windows 10 SDK UWP Version you are using, is correctly set. For Example:
rem In the Directory "icu\icu4c\source\allinone" open the File "Build.Windows.UWP.ProjectConfiguration.props" and change:
rem <WindowsTargetPlatformVersion>$(WindowsTargetPlatformVersion_10)</WindowsTargetPlatformVersion>
rem to the Windows 10 SDK Version you are using

rem 2.) Remove the configure flag "/property:SkipUWP=true" (or just set it to false)

rem Also make sure, all necessary UWP Libraries and Tools are installed!
rem A.) Windows 10 <$Version> SDK UWP
rem B.) C++ Universal Windows Platform Tools
rem Much easier Option: Just open the "icu\icu4c\source\allinone\allinone.sln" File in Visual Studio 2017 or later.

rem Data based on ICU Version: 67.1
rem Paths are based on the naming used when using the Code from ICU Git. Using Archive Files, the Naming can be slightly different
rem 8.1 = Windows 8.1 SDK (Support for Windows 7, 8.1 etc.)
rem 10.0.19041.0 = Windows 10 2004 May 2020 Update
rem ICU states that you need to have the 8.1 SDK installed, if you want to deploy ICU on Windows 7 or 8.1
rem From my Tests in a Windows 7 SP1 x64 VM, I got compatible Code with a Windows 10 SDK.
rem But it is possible, that ICU for example uses some specific API Calls, which can lead to Issues, when using a W10 SDK. Or something else. Who knows.

:START
set CL=/MP%NUMBER_OF_PROCESSORS% /cgthreads8 /DWINVER=0x0601 /D_WIN32_WINNT=_WIN32_WINNT_WIN7 /utf-8 /nologo /GL /GS /Gw /Gy /O2 /permissive- /Qpar /Qspectre /sdl /Zc:__cplusplus /ZH:SHA_256
set LINK=/NOLOGO /CGTHREADS:%NUMBER_OF_PROCESSORS% /DYNAMICBASE /HIGHENTROPYVA /LARGEADDRESSAWARE /LTCG:STATUS /NXCOMPAT
set PATH=%PATH%;%SYSTEMDRIVE%\Dev\Pythonx64\
if not exist %SystemDrive%\Dev\ICUSrcx64MSVC\ ( 
mkdir %SystemDrive%\Dev\ICUSrcx64MSVC\
goto :BUILD 
)

if exist %SystemDrive%\Dev\ICUSrcx64MSVC\ ( 
cd %SystemDrive%\Dev\ICUSrcx64MSVC\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\ICUSrcx64MSVC\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\ICUSrcx64MSVC\
goto :BUILD 
)

if not exist *.* ( 
goto :BUILD 
)

:BUILD
echo Verbosity is set to 'quiet' and logging is disabled! If you have Problems: Disable the Default MSBuild Config and Enable the second one! && ^
cd %SystemDrive%\Dev\ICUSrcx64MSVC\ && ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\GitRepos\icu\icu4c\ %SystemDrive%\Dev\ICUSrcx64MSVC\ /xd ".git" & ^
cd %SystemDrive%\Dev\ICUSrcx64MSVC\source && ^
msbuild.exe /nologo /maxcpucount:%NUMBER_OF_PROCESSORS% /verbosity:quiet %SystemDrive%\Dev\ICUSrcx64MSVC\source\allinone\allinone.sln /property:Configuration=Release /property:Platform=x64 /property:SkipUWP=true && ^
echo DISABLED: msbuild.exe /nologo /maxcpucount:%NUMBER_OF_PROCESSORS% /verbosity:diagnostic /fileLogger /fileloggerparameters:logfile=%TMP%\ICUx64MSVCBuildOutput.log;verbosity=diagnostic %SystemDrive%\Dev\ICUSrcx64MSVC\source\allinone\allinone.sln /property:Configuration=Release;Platform=x64 /property:SkipUWP=true && ^
%SystemDrive%\Dev\ICUSrcx64MSVC\source\allinone\icucheck.bat x64 Release && ^
pause; && ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\ICUSrcx64MSVC\bin64\ %SystemDrive%\Dev\ICUx64MSVC\bin64\ & ^
echo DISABLED: robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\ICUSrcx64MSVC\bin64uwp\ %SystemDrive%\Dev\ICUx64MSVC\bin64uwp\ & ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\ICUSrcx64MSVC\include\ %SystemDrive%\Dev\ICUx64MSVC\include\ & ^
robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\ICUSrcx64MSVC\lib64\ %SystemDrive%\Dev\ICUx64MSVC\lib64\ & ^
echo DISABLED: robocopy /s /NJS /NDL /NJH /nc /ns /np %SystemDrive%\Dev\ICUSrcx64MSVC\lib64uwp\ %SystemDrive%\Dev\ICUx64MSVC\lib64uwp\ & ^
cd %SystemDrive%\Dev\ICUSrcx64MSVC\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\ICUSrcx64MSVC\ /s /q && ^
echo DONE! && ^
pause;
