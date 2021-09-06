@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title CREATE LOCAL QT6 DEV BRANCH FROM EXTERNAL GIT BRANCH
:START
set PATH=%PATH%;%SystemDrive%\Dev\Perlx64\perl\bin\;%SystemDrive%\Dev\Git\bin\
if not exist %SystemDrive%\Dev\Qt6SrcGit\ ( 
mkdir %SystemDrive%\Dev\Qt6SrcGit\
goto :CHECKOUT 
)

if exist %SystemDrive%\Dev\Qt6SrcGit\ ( 
cd %SystemDrive%\Dev\Qt6SrcGit\
goto :CLEANDIRECTORY 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\Dev\Qt6SrcGit\
echo Wait for Windows to release the File handle, then delete the Directory:
timeout /t 8 /nobreak
rmdir %SystemDrive%\Dev\Qt6SrcGit\qt5\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
mkdir %SystemDrive%\Dev\Qt6SrcGit\
goto :CHECKOUT 
)

if not exist *.* ( 
goto :CHECKOUT 
)

:CHECKOUT
echo Switch into %SystemDrive%\Dev\Qt6SrcGit\ - just in case any Tool stopped hanging in a wrong Directory...
cd %SystemDrive%\Dev\Qt6SrcGit\ && ^
echo Create Qt6 Git Repository.. && ^
git clone https://code.qt.io/qt/qt5.git --verbose --progress && ^
echo Switch into Qt6 Subdirectory... && ^
cd %SystemDrive%\Dev\Qt6SrcGit\qt5\ && ^
rem Checkout the Branch of the Version you want: Without '.0,' '.1' etc. during Alpha and Beta Phase (i.e. dev, 5.15). With '.0,' '.1' etc. for the Final Minor and Patch Release Version (i.e. 5.15.0, 5.15.1). Update the Line in "UpdateQt5Git.cmd"! && ^
git checkout dev --progress && ^
echo Initialize the Repository and checkout (download) only the Qt Modules that are being used (directly or indirectly): && ^
rem Redo this Line after the first Qt 6.0 Beta Release! Afther that: Must be checked after every Qt 6.x Minor Release for the time being!
rem qtwebengine <<-- Qt 5: This Module was disabled: It is over 1 Gigabyte in Size and the use is disabled in the Source Code anyway. Just add it again if you need it. Qt 6: It does not exist in 6.0 and 6.1
rem perl init-repository --module-subset=qtbase,qtdeclarative,qtdoc,qtgraphicaleffects,qtimageformats,qtmultimedia,qtquickcontrols,qtquickcontrols2,qttools,qttranslations,qtwebchannel,qtwebsockets,qtwebview,qtwinextras,qtxmlpatterns, && ^
perl init-repository && ^
echo DONE! && ^
pause;
