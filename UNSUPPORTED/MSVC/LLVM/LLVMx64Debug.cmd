@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title BUILD LLVM-X64 DEBUG MSVC
:START
echo For the latest Infos on how to build Clang/LLVM: https://clang.llvm.org/get_started.html
echo Minimum additional dependency for LLDB: SWIG (SwigWin): http://www.swig.org/
set CC=cl
set CXX=cl
set CL=/MP%NUMBER_OF_PROCESSORS% /cgthreads8 /bigobj /utf-8 /nologo /Gw /Gy /permissive- /Qpar /Qspectre /Zc:__cplusplus /ZH:SHA_256
set LINK=/NOLOGO /CGTHREADS:%NUMBER_OF_PROCESSORS% /DYNAMICBASE /HIGHENTROPYVA /LARGEADDRESSAWARE /NXCOMPAT
set PATH=%PATH%;%SystemDrive%\Dev\CMake\bin\;%SystemDrive%\Dev\Ninja\;%SystemDrive%\Dev\Pythonx64\;%SystemDrive%\Dev\gnuwin32\bin\;%SystemDrive%\Dev\Perlx64\perl\bin\;%SystemDrive%\Dev\Git\bin\
if not exist %SystemDrive%\Dev\LLVMx64BuildDebug\ ( 
mkdir %SystemDrive%\Dev\LLVMx64BuildDebug\ 
goto :BUILD 
)

if exist %SystemDrive%\Dev\LLVMx64BuildDebug\ ( 
cd %SystemDrive%\Dev\LLVMx64BuildDebug\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\
rmdir %SystemDrive%\Dev\LLVMx64BuildDebug\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\LLVMx64BuildDebug\
goto :BUILD 
)

:BUILD
cd %SystemDrive%\Dev\LLVMx64BuildDebug\ && ^
rem Default Flags Part 1 of 2:
cmake %SystemDrive%\Dev\GitRepos\llvm-project\llvm\ -G"Ninja" -DCMAKE_VERBOSE_MAKEFILE=ON -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;libcxx;libcxxabi;lld;lldb;llvm" -DCMAKE_INSTALL_PREFIX=%SystemDrive%\Dev\LLVMx64Debug\ -DCMAKE_BUILD_TYPE="Debug" -DLLVM_TARGETS_TO_BUILD="X86" -DLLVM_INCLUDE_EXAMPLES="OFF" -DLLVM_INCLUDE_TESTS="OFF" -DLLVM_INCLUDE_DOCS="OFF" -DLLVM_PARALLEL_COMPILE_JOBS="%NUMBER_OF_PROCESSORS%" -DLLVM_PARALLEL_LINK_JOBS="%NUMBER_OF_PROCESSORS%" -DLLVM_ENABLE_EH="ON" -DLLVM_ENABLE_RTTI="ON" -DPYTHON_HOME=%SystemDrive%\Dev\Pythonx64\ -DSWIG_DIR=%SystemDrive%\Dev\swigwin\ -DSWIG_EXECUTABLE=%SystemDrive%\Dev\swigwin\swig.exe && ^
rem Default Flags Part 2 of 2:
ninja && ^
rem Enable Debug Logging Part 1 of 2:
rem cmake --verbose --debug-output --debug-find --log-level=TRACE --trace --trace-expand --trace-format=human --trace-redirect="%SystemDrive%\Dev\CMakeTraceLog_LLVMx64Debug_Configure_%DATE:/=-%.log" %SystemDrive%\Dev\GitRepos\llvm-project\llvm\ -G"Ninja" -DCMAKE_VERBOSE_MAKEFILE=ON -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;libcxx;libcxxabi;lld;lldb;llvm" -DCMAKE_INSTALL_PREFIX=%SystemDrive%\Dev\LLVMx64Debug\ -DCMAKE_BUILD_TYPE="Debug" -DLLVM_TARGETS_TO_BUILD="X86" -DLLVM_INCLUDE_EXAMPLES="OFF" -DLLVM_INCLUDE_TESTS="OFF" -DLLVM_INCLUDE_DOCS="OFF" -DLLVM_PARALLEL_COMPILE_JOBS="%NUMBER_OF_PROCESSORS%" -DLLVM_PARALLEL_LINK_JOBS="%NUMBER_OF_PROCESSORS%" -DLLVM_ENABLE_EH="ON" -DLLVM_ENABLE_RTTI="ON" -DPYTHON_HOME=%SystemDrive%\Dev\Pythonx64\ -DSWIG_DIR=%SystemDrive%\Dev\swigwin\ -DSWIG_EXECUTABLE=%SystemDrive%\Dev\swigwin\swig.exe && ^
rem Enable Debug Logging Part 2 of 2:
rem ninja -v 1>%SystemDrive%\Dev\LLVMx64Debug_Build_%DATE:/=-%.log 2>&1 && ^
echo DISABLED: pause; && ^
cd %SystemDrive%\Dev\LLVMx64BuildDebug\ && ^
echo DISABLED: ninja check-all && ^
echo DISABLED: pause; && ^
ninja -v install && ^
cd %SystemDrive%\Dev\LLVMx64BuildDebug\ && ^
del *.* /s /f /q && ^
cd %SystemDrive%\Dev\ && ^
echo Wait for Windows to release the Directory handle, then delete the Directory: && ^
timeout /t 8 /nobreak && ^
rmdir %SystemDrive%\Dev\LLVMx64BuildDebug\ /s /q && ^
echo DONE! && ^
pause;
