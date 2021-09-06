@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD QT6-X64 DEBUG AND RELEASE DYNAMIC MSVC
:START
set PATH=%PATH%;%SystemDrive%\Dev\CMake\bin\;%SystemDrive%\Dev\Ninja\;%SystemDrive%\Dev\ICUx64MSVC\bin64\;%SystemDrive%\Dev\ICUx64MSVC\include\;%SystemDrive%\Dev\ICUx64MSVC\lib\;%SystemDrive%\Dev\OpenSSLx64MSVC\bin\;%SystemDrive%\Dev\OpenSSLx64MSVC\include\;%SystemDrive%\Dev\OpenSSLx64MSVC\lib\;%SystemDrive%\Dev\Perlx64\perl\bin\;%SystemDrive%\Dev\Pythonx64\;%SystemDrive%\Dev\LLVMx64Release\bin\;%SystemDrive%\Dev\LLVMx64Release\lib\;%SystemDrive%\Dev\Git\bin\
if not exist %SystemDrive%\Dev\Qt6Srcx64MSVC\ ( 
mkdir %SystemDrive%\Dev\Qt6Srcx64MSVC\
goto :BUILD 
)

if exist %SystemDrive%\Dev\Qt6Srcx64MSVC\ ( 
cd %SystemDrive%\Dev\Qt6Srcx64MSVC\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\Qt6Srcx64MSVC\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\Qt6Srcx64MSVC\
goto :BUILD 
)

if not exist *.* ( 
goto :BUILD 
)

:BUILD
cd %SystemDrive%\Dev\Qt6Srcx64MSVC\ && ^
cmake --verbose %SystemDrive%\Dev\Qt6SrcGit\qt5\ -G"Ninja Multi-Config" -DCMAKE_CONFIGURATION_TYPES="Release;Debug" -DCMAKE_DEFAULT_CONFIGS="all" -DBUILD_WITH_PCH=ON -DFEATURE_ltcg=OFF -DFEATURE_clangcpp=ON -DFEATURE_icu=ON -DICU_ROOT=%SystemDrive%\Dev\ICUx64MSVC\ -DICU_INCLUDE_DIRS=%SystemDrive%\Dev\ICUx64MSVC\include\ -DICU_LIBRARIES=%SystemDrive%\Dev\ICUx64MSVC\lib\ -DFEATURE_openssl_linked=ON -DOPENSSL_ROOT_DIR=%SystemDrive%\Dev\OpenSSLx64MSVC\ -DOPENSSL_INCLUDE_DIR=%SystemDrive%\Dev\OpenSSLx64MSVC\include\ -DOPENSSL_LIBRARIES=%SystemDrive%\Dev\OpenSSLx64MSVC\lib\ -DCMAKE_CXX_FLAGS_DEBUG="/bigobj /cgthreads8 /GL- /GS /Gw /Gy /Qpar /Qspectre /guard:cf /INCREMENTAL /MP%NUMBER_OF_PROCESSORS% /nologo /Qpar /utf-8 /Zc:__cplusplus /ZH:SHA_256" -DCMAKE_SHARED_LINKER_FLAGS_DEBUG="/CGTHREADS:%NUMBER_OF_PROCESSORS% /DEBUG:FASTLINK /DYNAMICBASE /GUARD:CF /HIGHENTROPYVA /LARGEADDRESSAWARE /nologo /NXCOMPAT" -DCMAKE_EXE_LINKER_FLAGS_DEBUG="/CGTHREADS:%NUMBER_OF_PROCESSORS% /DEBUG:FASTLINK /DYNAMICBASE /GUARD:CF /INCREMENTAL /HIGHENTROPYVA /LARGEADDRESSAWARE /nologo /NXCOMPAT" -DCMAKE_CXX_FLAGS_RELEASE="/bigobj /cgthreads8 /GL /GS /Gw /Gy /guard:cf /O2 /MP%NUMBER_OF_PROCESSORS% /nologo /Qpar /Qspectre /utf-8 /Zc:__cplusplus /ZH:SHA_256" -DCMAKE_SHARED_LINKER_FLAGS_RELEASE="/CGTHREADS:%NUMBER_OF_PROCESSORS% /DYNAMICBASE /HIGHENTROPYVA /GUARD:CF /LARGEADDRESSAWARE /LTCG:STATUS /nologo /NXCOMPAT" -DCMAKE_EXE_LINKER_FLAGS_RELEASE="/CGTHREADS:%NUMBER_OF_PROCESSORS% /DYNAMICBASE /GUARD:CF /HIGHENTROPYVA /LARGEADDRESSAWARE /LTCG:STATUS /nologo /NXCOMPAT" -DCMAKE_INSTALL_PREFIX=%SystemDrive%\Dev\Qt6x64MSVC\ && ^
cd %SystemDrive%\Dev\Qt6Srcx64MSVC\ && ^
rem -- Non-Logging Default Part Start --
ninja -v && ^
rem -- Non-Logging Default Part End --
rem -- This Part is prepared to create some Logfiles! Make sure to disable the Commands in the above "Non-Logging" Default Part --
rem ninja -v 1>%SystemDrive%\Dev\Qt6x64_BuildQt_DebugAndRelease_MSVC_%DATE:/=-%.log 2>&1 && ^
rem -- Logging Section End --
robocopy %SystemDrive%\Dev\ICUx64MSVC\bin64\ %SystemDrive%\Dev\Qt6x64MSVC\bin\ icudt69.dll & ^
robocopy %SystemDrive%\Dev\ICUx64MSVC\bin64\ %SystemDrive%\Dev\Qt6x64MSVC\bin\ icuin69.dll & ^
robocopy %SystemDrive%\Dev\ICUx64MSVC\bin64\ %SystemDrive%\Dev\Qt6x64MSVC\bin\ icuuc69.dll & ^
robocopy %SystemDrive%\Dev\LLVMx64Release\bin\ %SystemDrive%\Dev\Qt6x64MSVC\bin\ libclang.dll & ^
robocopy %SystemDrive%\Dev\OpenSSLx64MSVC\bin\ %SystemDrive%\Dev\Qt6x64MSVC\bin\ libcrypto-1_1-x64.dll & ^
robocopy %SystemDrive%\Dev\OpenSSLx64MSVC\bin\ %SystemDrive%\Dev\Qt6x64MSVC\bin\ libssl-1_1-x64.dll & ^
rem -- Non-Logging Default Part Start --
rem cd %SystemDrive%\Dev\Qt6Srcx64MSVC\ && ^
ninja -v install && ^
ninja -v docs && ^
ninja -v install_docs && ^
rem -- Non-Logging Default Part End --
rem -- This Part is prepared to create some Logfiles! Make sure to disable the Commands in the above "Non-Logging" Default Part --
rem ninja -v install 1>%SystemDrive%\Dev\Qt6x64_InstallQt_DebugAndRelease_MSVC_%DATE:/=-%.log 2>&1 && ^
rem ninja -v docs 1>%SystemDrive%\Dev\Qt6x64_BuildDocs_DebugAndRelease_MSVC_%DATE:/=-%.log 2>&1 && ^
rem ninja -v install_docs 1>%SystemDrive%\Dev\Qt6x64_InstallDocs_DebugAndRelease_MSVC_%DATE:/=-%.log 2>&1 && ^
rem -- Logging Part End --
cd %SystemDrive%\Dev\Qt6Srcx64MSVC\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\Dev\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\Qt6Srcx64MSVC\ /s /q && ^
echo DONE! && ^
pause;
