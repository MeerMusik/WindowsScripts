@echo off
rem SPDX-License-Identifier: Unlicense OR CC0-1.0
rem Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
rem - CC0 1.0 Universal License Text Start -
rem WindowsScripts
rem Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
rem To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
rem You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
rem - CC0 1.0 Universal License Text End -
title CREATE VS-2019 COMMUNITY EDITION RELEASE LAYOUT
:CHECKFOREXISTINGLAYOUT
if not exist %SystemDrive%\Dev\VSInstaller\OfflineImage\VS2019Release\vs_community.exe ( 
goto :FULLDOWNLOAD 
)

if exist %SystemDrive%\Dev\VSInstaller\OfflineImage\VS2019Release\vs_community.exe ( 
goto :UPDATE 
)

:FULLDOWNLOAD
echo Downloading VS-2019 Release Layout:
%SystemDrive%\Dev\VSInstaller\Installer\VS2019Release\vs_community.exe --layout %SystemDrive%\Dev\VSInstaller\OfflineImage\VS2019Release\ ^
--lang en-US ^
--add Microsoft.VisualStudio.Workload.NativeDesktop ^
--add Microsoft.VisualStudio.Workload.Universal ^
--add Microsoft.VisualStudio.Workload.ManagedGame ^
--add Microsoft.VisualStudio.Workload.NativeGame ^
--includeRecommended ^
--includeOptional && ^
goto :DONE

:UPDATE
echo Updating VS-2019 Release Layout:
%SystemDrive%\Dev\VSInstaller\Installer\VS2019Release\vs_community.exe --layout %SystemDrive%\Dev\VSInstaller\OfflineImage\VS2019Release\ ^
--lang en-US ^
--add Microsoft.VisualStudio.Workload.NativeDesktop ^
--add Microsoft.VisualStudio.Workload.Universal ^
--add Microsoft.VisualStudio.Workload.ManagedGame ^
--add Microsoft.VisualStudio.Workload.NativeGame ^
--includeRecommended ^
--includeOptional && ^
goto :DONE

:DONE
echo DONE! && ^
pause;
