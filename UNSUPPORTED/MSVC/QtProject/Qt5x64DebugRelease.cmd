@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD QT-X64 DEBUG AND RELEASE DYNAMIC MSVC
:START
set CL=/MP%NUMBER_OF_PROCESSORS% /cgthreads8 /bigobj /utf-8 /nologo
set LINK=/NOLOGO /CGTHREADS:%NUMBER_OF_PROCESSORS%
set LLVM_INSTALL_DIR=%SystemDrive%\Dev\LLVMx64Release\
set OPENSSL_LIBS="-llibssl -llibcrypto"
set PATH=%PATH%;%SystemDrive%\Dev\Qt5SrcGit\qt5\gnuwin32\bin\;%SystemDrive%\Dev\JOM\;%SystemDrive%\Dev\ICUx64MSVC\bin64\;%SystemDrive%\Dev\ICUx64MSVC\include\;%SystemDrive%\Dev\ICUx64MSVC\lib64\;%SystemDrive%\Dev\OpenSSLx64MSVC\include\;%SystemDrive%\Dev\OpenSSLx64MSVC\lib\;%SystemDrive%\Dev\Perlx64\perl\bin\;%SystemDrive%\Dev\Pythonx64\;%SystemDrive%\Dev\LLVMx64Release\bin\;%SystemDrive%\Dev\Git\bin\
if not exist %SystemDrive%\Dev\Z\ ( 
mkdir %SystemDrive%\Dev\Z\
goto :BUILD 
)

if exist %SystemDrive%\Dev\Z\ ( 
cd %SystemDrive%\Dev\Z\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\Z\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\Z\
goto :BUILD 
)

if not exist *.* ( 
goto :BUILD 
)

:BUILD
cd %SystemDrive%\Dev\Z\ && ^
%SystemDrive%\Dev\Qt5SrcGit\qt5\configure QMAKE_CXXFLAGS_DEBUG+="/DSUBSYSTEM:CONSOLE,6.1 /GS /Gw /Gy /Qpar /Qspectre /guard:cf /INCREMENTAL /Qpar /Zc:__cplusplus /ZH:SHA_256" QMAKE_LFLAGS_DEBUG+="/DYNAMICBASE /SUBSYSTEM:CONSOLE,6.1 /DEBUG:FASTLINK /GUARD:CF /HIGHENTROPYVA /LARGEADDRESSAWARE /INCREMENTAL /NXCOMPAT" QMAKE_CXXFLAGS_RELEASE-="-O1" QMAKE_CXXFLAGS_RELEASE+="/DSUBSYSTEM:WINDOWS,6.1 /GL /GS /Gw /Gy /guard:cf /O2 /Qpar /Qspectre /Zc:__cplusplus /ZH:SHA_256" QMAKE_LFLAGS_RELEASE+="/DYNAMICBASE /SUBSYSTEM:WINDOWS,6.1 /GUARD:CF /HIGHENTROPYVA /LARGEADDRESSAWARE /LTCG:STATUS /NXCOMPAT" -make-tool "jom /nologo" -silent -c++std c++17 -opensource -confirm-license -ltcg -platform win32-msvc -prefix %SystemDrive%\Dev\Qt5x64MSVC\ -opengl dynamic -debug-and-release -no-optimize-size -no-optimize-debug -openssl-linked -I%SystemDrive%\Dev\OpenSSLx64MSVC\include -L%SystemDrive%\Dev\OpenSSLx64MSVC\lib OPENSSL_LIBS="-llibssl -llibcrypto" -icu -I%SystemDrive%\Dev\ICUx64MSVC\include -L%SystemDrive%\Dev\ICUx64MSVC\lib64 -mp -nomake tests -nomake examples -no-warnings-are-errors -skip qtwebengine && ^
jom /nologo && ^
echo DISABLED: pause && ^
cd %SystemDrive%\Dev\Z\ && ^
robocopy %SystemDrive%\Dev\ICUx64MSVC\bin64\ %SystemDrive%\Dev\Qt5x64MSVC\bin\ icudt69.dll & ^
robocopy %SystemDrive%\Dev\ICUx64MSVC\bin64\ %SystemDrive%\Dev\Qt5x64MSVC\bin\ icuin69.dll & ^
robocopy %SystemDrive%\Dev\ICUx64MSVC\bin64\ %SystemDrive%\Dev\Qt5x64MSVC\bin\ icuuc69.dll & ^
robocopy %SystemDrive%\Dev\LLVMx64Release\bin\ %SystemDrive%\Dev\Qt5x64MSVC\bin\ libclang.dll & ^
robocopy %SystemDrive%\Dev\OpenSSLx64MSVC\bin\ %SystemDrive%\Dev\Qt5x64MSVC\bin\ libcrypto-1_1-x64.dll & ^
robocopy %SystemDrive%\Dev\OpenSSLx64MSVC\bin\ %SystemDrive%\Dev\Qt5x64MSVC\bin\ libssl-1_1-x64.dll & ^
jom /nologo install && ^
jom /nologo docs && ^
jom /nologo install_docs && ^
echo DISABLED: pause && ^
cd %SystemDrive%\Dev\Z\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\Z\ /s /q && ^
echo DONE! && ^
pause;
