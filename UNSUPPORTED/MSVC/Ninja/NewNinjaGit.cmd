@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title CREATE LOCAL NINJA BRANCH FROM EXTERNAL GIT BRANCH
:START
set PATH=%PATH%;%SystemDrive%\Dev\Git\bin\
if not exist %SystemDrive%\Dev\GitRepos\ ( 
mkdir %SystemDrive%\Dev\GitRepos\
goto :CHECKFORNINJADIR 
)

if exist %SystemDrive%\Dev\GitRepos\ ( 
goto :CHECKFORNINJADIR 
)

:CHECKFORNINJADIR
if exist %SystemDrive%\Dev\GitRepos\ninja\ ( 
cd %SystemDrive%\Dev\GitRepos\ninja\
goto :CLEANDIRECTORY 
)

if not exist %SystemDrive%\Dev\GitRepos\ninja\ ( 
cd %SystemDrive%\Dev\GitRepos\
goto :CHECKOUTNINJA 
)

:CLEANDIRECTORY
if exist *.* ( 
del *.* /s /f /q
cd %SystemDrive%\Dev\GitRepos\
echo Wait for Windows to release the File handle, then delete the Directory:
timeout /t 4 /nobreak
rmdir %SystemDrive%\Dev\GitRepos\ninja\ /s /q
echo Wait for Windows to release the Directory handle, then delete the Directory:
timeout /t 8 /nobreak
goto :CHECKOUTNINJA 
)

:CHECKOUTNINJA
cd %SystemDrive%\Dev\GitRepos\ && ^
echo This checks out the Master Branch! If you want the Release Branch, enable the Line below!
git clone https://github.com/ninja-build/ninja.git --verbose --progress && ^
rem cd %SystemDrive%\Dev\GitRepos\ninja\ && git checkout release && ^
echo DONE! && ^
pause;
