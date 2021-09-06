@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD QT-X64 RELEASE STATIC MSVC
:START
set CL=/MP%NUMBER_OF_PROCESSORS% /cgthreads8 /utf-8 /nologo
set LINK=/NOLOGO /CGTHREADS:%NUMBER_OF_PROCESSORS%
set LLVM_INSTALL_DIR=%SystemDrive%\Dev\LLVMx64Release\
set OPENSSL_LIBS="-llibssl -llibcrypto -lWS2_32 -lCrypt32 -lAdvAPI32 -lGdi32 -lUser32"
set PATH=%PATH%;%SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\qt5\gnuwin32\bin\;%SystemDrive%\Dev\JOM\;%SystemDrive%\Dev\OpenSSLx64StaticMSVC\bin\;%SystemDrive%\Dev\OpenSSLx64StaticMSVC\include\;%SystemDrive%\Dev\OpenSSLx64StaticMSVC\lib\;%SystemDrive%\Dev\Perlx64\perl\bin\;%SystemDrive%\Dev\Pythonx64\;%SystemDrive%\Dev\LLVMx64Release\bin\;%SystemDrive%\Dev\Git\bin\
if not exist %SystemDrive%\Dev\QtSrcx64StaticMSVC\ ( 
mkdir %SystemDrive%\Dev\QtSrcx64StaticMSVC\
goto :BUILD 
)

if exist %SystemDrive%\Dev\QtSrcx64StaticMSVC\ ( 
cd %SystemDrive%\Dev\QtSrcx64StaticMSVC\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\QtSrcx64StaticMSVC\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\QtSrcx64StaticMSVC\
goto :BUILD 
)

if not exist *.* ( 
goto :BUILD 
)

:BUILD
cd %SystemDrive%\Dev\QtSrcx64StaticMSVC\ && ^
%SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\qt5\configure QMAKE_CXXFLAGS_RELEASE-="-O1" QMAKE_CXXFLAGS_RELEASE+="/DSUBSYSTEM:WINDOWS,6.1 /GL /GS /Gw /Gy /guard:cf /Os /Qpar /Qspectre /Zc:__cplusplus /ZH:SHA_256" QMAKE_LFLAGS_RELEASE+="/DYNAMICBASE /SUBSYSTEM:WINDOWS,6.1 /GUARD:CF /HIGHENTROPYVA /LARGEADDRESSAWARE /LTCG:STATUS /NXCOMPAT" -make-tool "jom /nologo" -silent -c++std c++1z -release -static -static-runtime -accessibility -no-icu -no-opengl -no-qml-debug -sql-sqlite -no-vulkan -nomake examples -nomake tests -opensource -confirm-license -optimize-size -ltcg -mp -prefix %SystemDrive%\Dev\Qt5x64StaticMSVC\ -openssl-linked -I%SystemDrive%\Dev\OpenSSLx64StaticMSVC\include -L%SystemDrive%\Dev\OpenSSLx64StaticMSVC\lib OPENSSL_LIBS="-llibssl -llibcrypto -lWS2_32 -lCrypt32 -lAdvAPI32 -lGdi32 -lUser32" && ^
jom /nologo module-qtbase module-qtdeclarative module-qttools module-qttranslations module-qtwinextras && ^
robocopy %SystemDrive%\Dev\LLVMx64Release\bin\ %SystemDrive%\Dev\Qt5x64StaticMSVC\bin\ libclang.dll & ^
echo DISABLED: pause && ^
jom /nologo install && ^
echo DISABLED: pause && ^
cd %SystemDrive%\Dev\QtSrcx64StaticMSVC\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\QtSrcx64StaticMSVC\ /s /q && ^
echo DONE! && ^
pause;
