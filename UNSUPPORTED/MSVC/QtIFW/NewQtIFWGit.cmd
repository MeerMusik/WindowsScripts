@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title CREATE LOCAL QT-INSTALLER-FRAMEWORK BRANCH FROM EXTERNAL GIT BRANCH
:START
set PATH=%PATH%;%SystemDrive%\Dev\Git\bin\
if not exist %SystemDrive%\Dev\GitRepos\ ( 
mkdir %SystemDrive%\Dev\GitRepos\
goto :CHECKOUTINSTALLERFRAMEWORK 
)

if exist %SystemDrive%\Dev\GitRepos\ ( 
cd %SystemDrive%\Dev\GitRepos\
goto :CHECKFORINSTALLERFRAMEWORKDIR 
)

:CHECKFORINSTALLERFRAMEWORKDIR
if exist %SystemDrive%\Dev\GitRepos\installer-framework\ ( 
cd %SystemDrive%\Dev\GitRepos\installer-framework\
goto :CLEANDIRECTORY 
)

if not exist %SystemDrive%\Dev\GitRepos\installer-framework\ ( 
goto :CHECKOUTINSTALLERFRAMEWORK 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\Dev\GitRepos\
echo Wait for Windows to release the File handle, then delete the Directory:
timeout /t 4 /nobreak
rmdir %SystemDrive%\Dev\GitRepos\installer-framework\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
goto :CHECKOUTINSTALLERFRAMEWORK 
)

if not exist *.* ( 
goto :CHECKOUTINSTALLERFRAMEWORK 
)

:CHECKOUTINSTALLERFRAMEWORK
cd %SystemDrive%\Dev\GitRepos\ && ^
git clone https://code.qt.io/installer-framework/installer-framework.git --verbose --progress && ^
echo DONE! && ^
pause;
