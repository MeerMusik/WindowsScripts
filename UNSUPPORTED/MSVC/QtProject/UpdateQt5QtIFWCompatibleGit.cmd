@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title SYNC LOCAL QT5 BRANCH WITH EXTERNAL GIT BRANCH - OLDER VERSION FOR QTIFW
echo Add Git Directory to PATH temporarily...
set PATH=%PATH%;%SystemDrive%\Dev\Perlx64\perl\bin\;%SystemDrive%\Dev\Git\bin\
echo Switching into Qt5 Subdirectory...
cd %SystemDrive%\Dev\Qt5QtIFWCompatibleSrcGit\qt5\ && ^
echo Update Qt5 Repository... && ^
git pull --verbose && ^
perl init-repository --force --module-subset=qtbase,qtdeclarative,qttools,qttranslations,qtwinextras && ^
echo Done! && ^
pause;
