@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title CREATE LOCAL QT5 BRANCH FROM EXTERNAL GIT BRANCH - OLDER VERSION FOR QTIFW
:START
set PATH=%PATH%;%SystemDrive%\Dev\Perlx64\perl\bin\;%SystemDrive%\Dev\Git\bin\
if not exist %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\ ( 
mkdir %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\
goto :CHECKOUT 
)

if exist %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\ ( 
cd %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\
echo Wait for Windows to release the File handle, then delete the Directory:
timeout /t 4 /nobreak
rmdir %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\qt5\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\
goto :CHECKOUT 
)

if not exist *.* ( 
goto :CHECKOUT 
)

:CHECKOUT
echo Switch into %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\ - just in case any Tool stopped hanging in a wrong Directory...
cd %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\ && ^
echo Create Qt5 Git Repository.. && ^
git clone https://code.qt.io/qt/qt5.git --verbose --progress && ^
echo Switch into Qt5 Subdirectory... && ^
cd %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\qt5\ && ^
rem Checkout the Branch which is compatible with the latest Version of QtIFW. && ^
git checkout 5.12 --progress && ^
echo Initialize the Repository and checkout (download) only the Qt Modules that are being used (directly or indirectly): && ^
perl init-repository --module-subset=qtbase,qtdeclarative,qttools,qttranslations,qtwinextras && ^
echo DONE! && ^
pause;
