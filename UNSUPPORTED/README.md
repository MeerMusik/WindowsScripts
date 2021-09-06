[[_TOC_]]
# !!! UNSUPPORTED SCRIPTS !!!
The Scripts in this Directory are currently unused and are therefore unsupported! They are not getting updated as long as they are in the "UNSUPPORTED" state! All Scripts were tested to be functional at the time of publishing.

## About WindowsScripts
(C) Copyright 2013-2021 Oliver Niebuhr

Very basic Scripts to
1. Clone (Download) the Source Code of Libraries and Frameworks like ICU, LLVM, OpenSSL and Qt from their Git Repositories
2. Build these Libraries and Frameworks

May they be useful to you in one way or another.

All Scripts are written to compliment each other. Example: Locally cloned Repositories will be found under

%SystemDrive%\Dev\GitRepos\[Name-Of-The-Repository]

The Build Scripts will search for the Libraries in this Directory.

Also, this Repository serves as some sort of Transparency List. Until the "Pirateparty-Helper-Tool" (WIP Name...) Repository is ready to be published, it will only be updated when necessary.

## All !!! UNSUPPORTED SCRIPTS !!! are basically functional. Read the dedicated Sections for Details
All Scripts were created and successfully tested under the following Windows and Compiler Versions:

1. Windows 10 20H2, x86_64
2. Windows 10 SDK 19041
3. MinGW-w64 on MSYS2, 10.2 and partially under 10.3
4. MSVC++ 2019, 16.9.2

Newer Windows 10, Windows 10 SDK, MinGW-w64 and MSVC++ Versions should be compatible too.

Older Versions should work if they are not too old. What too old means, has not been fully tested.

You probably need to remove or modify some Compiler Flags for newer and older Versions.

Other Compiler Variants like Clang-MinGW-w64 or Clang-MSVC are untested and therefore not supported by me!

All Scripts are heavily personalized and have a lot of Compiler Flags to fit my personal needs. Except for the Qt 6 Build Scripts, everything should work by Default on Windows 7, 8.(0|1) and Windows 10 without the need for bigger modifications.

Some Build Scripts like for Example for OpenSSL, ICU and Qt contain Definitions like "/DWINVER=0x0601 /D_WIN32_WINNT=_WIN32_WINNT_WIN7" to explicitly tell the MSVC++ and MinGW-w64 Compilers to support Windows 7 and newer.

Please look at the different Sections about the Build Scripts for Version Numbers - if mentioned.

## LICENSE
The Content in this Repository is Dual-Licensed under "The Unlicense" (Public Domain) OR under the "CC0-1.0 Universal License" (Public Domain with Fallback Mechanism).

If you live in a Jurisdiction like Germany or anywhere else outside the USA which
1. does not acknowledge Public Domain at all OR
2. does only acknowledge some Parts of Public Domain

and therefore The Unlicense is deemed illegal or invalid, choose the CC0-1.0 Universal License with the Fallback Mechanism.

Simplified Explanation: Both Licenses allow you to do with these Scripts whatever you want without mentioning my Name ('without giving me Credit' also known as 'No Attribution').

The Fallback Mechanism is made for Jurisdictions like Germany etc., to allow me (the 'Licensor') to give away all my Rights as far as the local Laws allow me to do so. So that you (the 'Licensee') can do whatever you want with whatever I have published under these License(s).

The huge Amount of different Jurisdictions and Copyright Laws are a horrible Mess and need these specific Statements unfortunately.

Also: Repositories got removed or hidden if they do not contain a License Document.

And as always the usual necessary Disclaimer: I AM NOT A LAWYER AND THIS IS NOT LEGAL ADVICE. IF YOU NEED LEGAL ADVICE, CONSULT A LICENSED ATTORNEY.

Here you can find the different License Texts: The Unlicense (Public Domain):
1. THE_UNLICENSE.txt: [In this Repository](THE_UNLICENSE.txt)
2. The Unlicense: Original at the Authors Website: https://unlicense.org/
3. The Unlicense: At SPDX.org: https://spdx.org/licenses/Unlicense.html

CC0-1.0 Universal (Public Domain with Fallback Mechanism):
1. CC0-1.0.txt: [In this Repository](CC0-1.0.txt)
2. CC0-1.0: Full Text at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt
3. CC0-1.0: Human-Readable Summary - English at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/
4. CC0-1.0: Human-Readable Summary - German Translation at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/deed.de
5. CC0-1.0: At SDPX.org: https://spdx.org/licenses/CC0-1.0.html

## Questions?
Send me a Message. I will try to reply within 96 hours. Sometimes sooner, sometimes later.
1. Contact Form on my personal Website (German): https://oliverniebuhr.de/kontakt
2. eMail: MailTo Link: [Opens your eMail Program](mailto:gitrepos@oliverniebuhr.de?subject=WindowsScripts-UnsupportedScripts)
3. Contact me on Twitter: https://twitter.com/MeerMusik

Remember that Tweets are always public! Everyone can read what you write! If you need to send Personal Infos, send me a Direct Message!

## Contributing
The full Contribution Rules can be found in the
1. CONTRIBUTING.md: [In this Repository](CONTRIBUTING.md)

## Bug Reports, Merge Requests etc.
Found a Bug? Infos are outdated? Please take a look at the Issue List first! If your Topic is not listed, feel free to create a new one:
1. WindowsScripts - Issue List: https://github.com/MeerMusik/WindowsScripts/issues/

Alternatively: Use one of the Options under "Questions?" (2 Sections above).

## Info about Windows 10 and the "Python(3).exe" stubs and aliasing
Because Microsoft loves to make Windows and everything around it a living Hell for their Customers, they decided to install stubs of Python.exe and Python3.exe and created some aliases which overwrite everything. The Idea behind that is good. The execution a total mess. Problem: They interfere with any Python Installation. Solution:

1. Open "Windows Settings"
2. Open "Apps and Installations"
3. Under the Section "Apps & Features" click on "App execution aliases" ("Manage App execution aliases" on older Windows 10 Versions)
4. Disable all Python aliases by clicking on the blue Switch on the left side of the unwanted alias
5. Enjoy a working Python Installation

Be aware, that Windows sometimes reenables those aliases on its own. Especially when you uninstall a Python Version. It also can happen (luckily rarely), that those Aliases get enabled after updating to a newer Windows 10 Version. Luckily enough, I never had that happen when installing the monthly Update. Yet.

## List of Scripts
The '.SH' Shell Scripts are made for MinGW-w64 on [MSYS2 - Software Distribution and Building Platform for Windows](https://www.msys2.org/)

### AKKomPolTool / Pirates-Little-Helper - (WIP NAME. PLACEHOLDER)
The Links to the Files have been removed while the Tool will be rewritten from Scratch with another Framework.

The old Source Code based on the Qt Framework will not be published: It is discontinued and in 'Recycle Mode'.

Info:
1. My personal Website (German): https://oliverniebuhr.de
2. FAQ on my Website (German): https://oliverniebuhr.de/

Get the Source Code:
1. [I AM AN EMPTY PLACEHOLDER! IGNORE ME!](I AM AN EMPTY PLACEHOLDER! IGNORE ME!)
2. [I AM AN EMPTY PLACEHOLDER! IGNORE ME!](I AM AN EMPTY PLACEHOLDER! IGNORE ME!)

Build it: The real Build Scripts will be added when they are ready...
1. [I AM AN EMPTY PLACEHOLDER! IGNORE ME!](I AM AN EMPTY PLACEHOLDER! IGNORE ME!)
2. [I AM AN EMPTY PLACEHOLDER! IGNORE ME!](I AM AN EMPTY PLACEHOLDER! IGNORE ME!)

### Botan - Crypto and TLS for Modern C++
Infos:
1. Documentation: https://botan.randombit.net/handbook/building.html
2. Download Source Code directly: https://github.com/randombit/botan/releases

Get the Source Code:
1. [Clone Git Repository to local Drive: NewBotanGit.cmd](MSVC/Botan/NewBotanGit.cmd)
2. [Update local Git Repository: UpdateBotanGit.cmd](MSVC/Botan/UpdateBotanGit.cmd)

Build it:
1. [X86_64, Static, Release, MSVC: Botanx64Release.cmd](MSVC/Botan/Botanx64Release.cmd)
2. [X86, Static, Release, MSVC: Botanx86Release.cmd](MSVC/Botan/Botanx86Release.cmd)

### CMake - Build Management Tool. Used to build Clang, GammaRay, Qt 6.x and other
Status: Used when a Tool or Library supports it or has it set as a fixed Dependency.<br>
Installation on MSYS2: Install prebuilt Binaries: pacman -S mingw-w64-x86_64-cmake

Do NOT use MSYS2 CMake! It has a lot of compatibility Issues!

Version: Master Branch

I usually use the latest prebuilt x86_64 Binaries (ZIP Archive) from https://cmake.org/download/<br>
If you are unsure: Download the ZIP Archive: No hassle with Installation and Uninstallation. Also very simple to overwrite all the Files with a newer Version that way

I build only from Source, when I need to test specific fixes or a new Feature.

Attention: You need an existing CMake and Ninja Installation to build CMake from Source!

Infos:
1. Official Documentation: https://cmake.org/cmake/help/latest/
2. Community Wiki: https://gitlab.kitware.com/cmake/community/-/wikis/home

Get the Source Code:
1. [Clone Git Repository to local Drive: NewCMakeGit.cmd](MSVC/CMake/NewCMakeGit.cmd)
2. [Update local Git Repository: UpdateCMakeGit.cmd](MSVC/CMake/UpdateCMakeGit.cmd)

Build it:
1. [X86_64, Static, Release, MSVC: CMakex64ReleaseStatic.cmd](MSVC/CMake/CMakex64ReleaseStatic.cmd)

### GammaRay - Introspection Tool for the Qt Framework
Status: No longer used<br>
Version: Master Branch

Infos:
1. About GammaRay: https://www.kdab.com/development-resources/qt-tools/gammaray/
2. Documentation: https://docs.kdab.com/gammaray-manual/latest/
3. Download Source: https://github.com/KDAB/GammaRay/releases

Get the Source Code:
1. [Clone Git Repository to local Drive: NewGammaRayGit.cmd](MSVC/GammaRay/NewGammaRayGit.cmd)
2. [Update Source Code from Git Repository: UpdateGammaRayGit.cmd](MSVC/GammaRay/UpdateGammaRayGit.cmd)

Build it:
1. [X86_64, Dynamic, Release, Qt5: GammaRayQt5x64Release.sh](MSYS2/GammaRay/GammaRayQt5x64Release.sh)
2. [X86_64, Dynamic, Release, Qt6: GammaRayQt6x64Release.sh](MSYS2/GammaRay/GammaRayQt6x64Release.sh)
3. [X86_64, Dynamic, Release, MSVC, Qt5: GammaRayQt5x64Release.cmd](MSVC/GammaRay/GammaRayQt5x64Release.cmd)
4. [X86_64, Dynamic, Release, MSVC, Qt6: GammaRayQt6x64Release.cmd](MSVC/GammaRay/GammaRayQt6x64Release.cmd)

Other Scripts:
1. [Script to start GammaRay, Qt5, X86_64: StartGammaRayQt5x64.sh](MSYS2/GammaRay/StartGammaRayQt5x64.sh)
2. [Script to start GammaRay, Qt6, X86_64: StartGammaRayQt6x64.sh](MSYS2/GammaRay/StartGammaRayQt6x64.sh)
3. [Script to start GammaRay, Qt5, MSVC, X86_64: StartGammaRayQt5x64.cmd](MSVC/GammaRay/StartGammaRayQt5x64.cmd)
4. [Script to start GammaRay, Qt6, MSVC, X86_64: StartGammaRayQt6x64.cmd](MSVC/GammaRay/StartGammaRayQt6x64.cmd)

### GTK4 - Main Libraries and Dependencies - WIP!!
Status: WIP. Either this with GTKMM4 or Rust with GTK4-RS Bindings.<br>
Version: Master Branch

Get the Source Code:<br>

GTK4:
1. [Clone Git Repository to local Drive: NewGTK4Git.sh](MSYS2/GTK4/NewGTK4Git.sh)
2. [Update Source Code from Git Repository: UpdateGTK4Git.sh](MSYS2/GTK4/UpdateGTK4Git.sh)

GLib:
1. [Clone Git Repository to local Drive: NewGlibGit.sh](MSYS2/GTK4/NewGlibGit.sh)
2. [Update Source Code from Git Repository: UpdateGlibGit.sh](MSYS2/GTK4/UpdateGlibGit.sh)

GNU libiconv - Optional if provided by your OS:
1. [Clone Git Repository to local Drive: NewLibiconvGit.sh](MSYS2/GTK4/NewLibiconvGit.sh)
2. [Update Source Code from Git Repository: UpdateLibiconvGit.sh](MSYS2/GTK4/UpdateLibiconvGit.sh)

GdkPixbuf:
1. [Clone Git Repository to local Drive: NewGdkPixbufGit.sh](MSYS2/GTK4/NewGdkPixbufGit.sh)
2. [Update Source Code from Git Repository: UpdateGdkPixbufGit.sh](MSYS2/GTK4/UpdateGdkPixbufGit.sh)

Pango - for Cairo and GTK:
1. [Clone Git Repository to local Drive: NewPangoGit.sh](MSYS2/GTK4/NewPangoGit.sh)
2. [Update Source Code from Git Repository: UpdatePangoGit.sh](MSYS2/GTK4/UpdatePangoGit.sh)

Fontconfig - Optional for Pango:
1. [Clone Git Repository to local Drive: NewFontconfigGit.sh](MSYS2/GTK4/NewFontconfigGit.sh)
2. [Update Source Code from Git Repository: UpdateFontconfigGit.sh](MSYS2/GTK4/UpdateFontconfigGit.sh)

Hard Dependencies for Fontconfig:
Freetype2:
1. [Clone Git Repository to local Drive: NewFreetype2Git.sh](MSYS2/GTK4/NewFreetype2Git.sh)
2. [Update Source Code from Git Repository: UpdateFreetype2Git.sh](MSYS2/GTK4/UpdateFreetype2Git.sh)

Recommended for Fontconfig:
Harfbuzz:
1. [Clone Git Repository to local Drive: NewHarfbuzzGit.sh](MSYS2/GTK4/NewHarfbuzzGit.sh)
2. [Update Source Code from Git Repository: UpdateHarfbuzzGit.sh](MSYS2/GTK4/UpdateHarfbuzzGit.sh)

Optional for Harfbuzz: ICU - See: ICU - International Components for Unicode -->> Create ICU Static Scripts!!

GObject-Introspection:
1. [Clone Git Repository to local Drive: NewGobjectIntrospectionGit.sh](MSYS2/GTK4/NewGobjectIntrospectionGit.sh)
2. [Update Source Code from Git Repository: UpdateGobjectIntrospectionGit.sh](MSYS2/GTK4/UpdateGobjectIntrospectionGit.sh)

GNU gettext - Optional if provided by your OS:
1. [Clone Git Repository to local Drive: NewGettextGit.sh](MSYS2/GTK4/NewGettextGit.sh)
2. [Update Source Code from Git Repository: UpdateGettextGit.sh](MSYS2/GTK4/UpdateGettextGit.sh)

Cairo:
1. [Clone Git Repository to local Drive: NewCairoGit.sh](MSYS2/GTK4/NewCairoGit.sh)
2. [Update Source Code from Git Repository: UpdateCairoGit.sh](MSYS2/GTK4/UpdateCairoGit.sh)

Hard Dependencies for Cairo:
Libpng:
1. [Clone Git Repository to local Drive: NewLibpngGit.sh](MSYS2/GTK4/NewLibpngGit.sh)
2. [Update Source Code from Git Repository: UpdateLibpngGit.sh](MSYS2/GTK4/UpdateLibpngGit.sh)

Zlib:
1. [Clone Git Repository to local Drive: NewZlibGit.sh](MSYS2/GTK4/NewZlibGit.sh)
2. [Update Source Code from Git Repository: UpdateZlibGit.sh](MSYS2/GTK4/UpdateZlibGit.sh)

Epoxy:
1. [Clone Git Repository to local Drive: NewLibepoxyGit.sh](MSYS2/GTK4/NewLibepoxyGit.sh)
2. [Update Source Code from Git Repository: UpdateLibepoxyGit.sh](MSYS2/GTK4/UpdateLibepoxyGit.sh)

Graphene:
1. [Clone Git Repository to local Drive: NewGrapheneGit.sh](MSYS2/GTK4/NewGrapheneGit.sh)
2. [Update Source Code from Git Repository: UpdateGrapheneGit.sh](MSYS2/GTK4/UpdateGrapheneGit.sh)

Xkb-common:
1. [Clone Git Repository to local Drive: NewLibxkbcommonGit.sh](MSYS2/GTK4/NewLibxkbcommonGit.sh)
2. [Update Source Code from Git Repository: UpdateLibxkbcommonGit.sh](MSYS2/GTK4/UpdateLibxkbcommonGit.sh)

Build it: Most of them do not exist yet! I am still figuring out how to compile the basic dependencies under MSYS2 with MinGW-w64. Probably around 2 more weeks work at minimum based on my current progress rate... Plus tuning the Scripts to my needs = possibly 4 Weeks minimum for testing basic stability etc.<br>
The order of Building the Dependencies is important! Some Dependencies have circular-dependencies that must be fullfilled first! The below order is extreme WIP!

A - Zlib - Has no other Dependencies. Compile first.
1. [X86, Debug and Release: Zlibx86.sh](MSYS2/GTK4/Zlibx86.sh)
2. [X86_64, Debug and Release: Zlibx64.sh](MSYS2/GTK4/Zlibx64.sh)

B- - first libiconv, then gettext, then libiconv again,
or (on systems supporting shared libraries, excluding AIX)
  - first gettext, then libiconv, then gettext again.

#### GTK4 - Hard Dependencies - WIP!!
Status: Hard Dependencies. Either this with GTKMM4 or Rust with GTK4-RS Bindings.<br>
Version: Master Branch

Get the Source Code:<br>

Build it:<br>

### GTKMM4 and Dependencies - WIP!!
Status: Hard Dependencies. Either this with GTKMM4 or Rust with GTK4-RS Bindings.<br>
Version: Master Branch

The Scripts are set up to use the Default 'Autogen.sh' Scripts - for now. I will switch all Scripts over to Meson, when available, as soon as I have figured out how it works.

To install Meson and Ninja under Installation on MSYS2:
Open the Base MSYS2 Shell and copy and paste the following commands:<br>
For: mingw32: pacman -S mingw-w64-i686-python3 mingw-w64-i686-ninja mingw-w64-i686-meson<br>
For: mingw64: pacman -S mingw-w64-x86_64-python3 mingw-w64-x86_64-ninja mingw-w64-x86_64-meson

Get the Source Code:<br>

GTKMM4 - Bindings for C++:
1. [Clone Git Repository to local Drive: NewGTKMM4Git.sh](MSYS2/GTKMM4/NewGTKMM4Git.sh)
2. [Update Source Code from Git Repository: UpdateGTKMM4Git.sh](MSYS2/GTKMM4/UpdateGTKMM4Git.sh)

It also needs GLib (for Scripts see above) and GIO (comes with the Source Code).<br>

GLibmm:
1. [Clone Git Repository to local Drive: NewGlibmmGit.sh](MSYS2/GTKMM4/NewGlibmmGit.sh)
2. [Update Source Code from Git Repository: UpdateGlibmmGit.sh](MSYS2/GTKMM4/UpdateGlibmmGit.sh)

Libsigc++: DO NOT USE! Download the latest Source Tarball '<archivename>.tar.xz' from https://github.com/libsigcplusplus/libsigcplusplus/releases
If you try to build from git Source, 'maintainer-mode' is set to 'true'. Then you need thing like doxygen and dependencies. The Meson Build System does not let you overwrite this and other Values! Very annoying.
1. [Clone Git Repository to local Drive: NewLibsigcppGit.sh](MSYS2/GTKMM4/NewLibsigcppGit.sh)
2. [Update Source Code from Git Repository: UpdateLibsigcppGit.sh](MSYS2/GTKMM4/UpdateLibsigcppGit.sh)

When building Libsigc++ from Git Source, you also need:
doxygen: Install basic doxygen with 'pacman -S doxygen'
The binary 'dot' from 'graphviz': Install: mingw32: pacman -S graphmingw-w64-i686-graphviz - mingw64: pacman -S mingw-w64-x86_64-graphviz
Attention: When you install 'graphviz', GTK3 and other Dependencies will be installed too! I do NOT want that, so I build Libsigc++ from the Source Tarball!

Hard Dependencies for Libsigc++:
MM-Common: DO NOT USE! Download the latest Source Tarball from https://download.gnome.org/sources/mm-common/
I build from the Source Tarball. Too much Trouble and there are too many Dependencies already.
1. [Clone Git Repository to local Drive: NewMMCommonGit.sh](MSYS2/GTKMM4/NewMMCommonGit.sh)
2. [Update Source Code from Git Repository: UpdateMMCommonGit.sh](MSYS2/GTKMM4/UpdateMMCommonGit.sh)

Also, when building mm-common from Git Source, it needs to download 'doctags/libstdc++.tag'. If you use the Default Build Scripts, you will get this Error during configuration time:

"Downloading it is not possible because network is disabled.
Please run "make USE_NETWORK=yes", or reconfigure with
the --enable-network option."

Modify the mm-common Build Scripts as necessary.

Runtime Dependency for Libsigc++: C++ Boost Libraries. Specifically:
1. system, timer

---- WIP!!! BUILD ORDER IS IMPORTANT!!! TAKE CARE OF CIRCULAR-DEPENDENCIES!!! ----
Used Build Systems:
* mm-common: Meson
* Libsigc++: Meson

Build it:<br>

### ICU - International Components for Unicode
Status: Currently unused<br>
Version: maint/maint-69

Activated in the Qt 5 + 6 Build Scripts. But often optional depending on the local Language of the Host and / or Target Operating System. Simply disable it if you have no use for it.

Infos:
1. Documentation: http://site.icu-project.org/docs
2. Download Source Archive or prebuilt Binaries directly: http://site.icu-project.org/download

Get the Source Code:
1. [Clone Git Repository to local Drive: NewICUGit.cmd](MSVC/ICU/NewICUGit.cmd)
2. [Update local Git Repository: UpdateICUGit.cmd](MSVC/ICU/UpdateICUGit.cmd)

You also need [Git Large File Storage Extension](https://git-lfs.github.com/)<br>
Need help setting up Git LFS? [Follow the Section "Detailed Instructions" -> "Prerequisites: Git and Git LFS" at the ICU Project Site](http://site.ICU-project.org/repository)

Build it:
1. [X86_64, Dynamic, Release, MSVC: ICUx64Release.cmd](MSVC/ICU/ICUx64Release.cmd)
2. [X86, Dynamic, Release, MSVC: ICUx86Release.cmd](MSVC/ICU/ICUx86Release.cmd)

### JOM - MSVC++ NMake Drop-In Replacement
Status: Some Scripts using JOM instead of NMake. NMake got a lot faster in Visual Studio 2019 but it still tends to be slower for a lot of People.

1. Drop-In Replacement for nmake which has Multithread Support and saves a lot of time. Highly recommended!
2. Latest Version: 1.1.3 (05. December 2018)
3. Latest Code Changes in the Git Repository: January 2020
4. As of April 2021, the old 1.1.3 Version works perfectly fine for me on Windows 10 20H2 ("2009")
5. [Download Precompiled Binaries from download.qt.io](https://download.qt.io/official_releases/jom/)
6. Just download, unzip to a Directory of your choice without Space and add the Directory to the User Environment PATH Settings
  * Not necessary when you are only running the Scripts from this Repository and follow the Directory Structure within them
  * Hint: If you are following the Directory Structure used by the Scripts in this Repository, unzip it to %SystemDrive%\Dev\JOM\

### LLVM / CLANG - The LLVM Compiler Infrastructure
Status: Currently not used<br>
Version: Release/12.x Branch

Building from Source is optional. I have only used Clang as a Parser to build Qt specific Parts so far. I have not yet build any Library solely with Clang.

If you use the Build Scripts as they are:
1. Download Swingwin: http://www.swig.org/download.html
2. Unzip the Archive to %SystemDrive%\Dev\swigwin
  * Alternatively: You can disable building of LLDB and get rid of the Swigwin Dependency

Infos:
1. You can use the prebuilt Binaries from https://releases.llvm.org/
2. General Documentation: https://llvm.org/docs/

Get the Source Code:
1. [Clone Git Repository to local Drive: NewLLVMGit.cmd](MSVC/LLVM/NewLLVMGit.cmd)
2. [Update local Git Repository: UpdateLLVMGit.cmd](MSVC/LLVM/UpdateLLVMGit.cmd)

Build it:
1. [X86_64, Release, MSVC: LLVMx64Debug.cmd](MSVC/LLVM/LLVMx64Debug.cmd)
2. [X86_64, Release, MSVC: LLVMx64Release.cmd](MSVC/LLVM/LLVMx64Release.cmd)
3. [X86, Release, MSVC: LLVMx86Debug.cmd](MSVC/LLVM/LLVMx86Debug.cmd)
4. [X86, Release, MSVC: LLVMx86Release.cmd](MSVC/LLVM/LLVMx86Release.cmd)

### Ninja - The Ninja Build System
Status: Heavily recommended! I use it whenever possible. Not used with Ultimate++ Actively used to build wxWidgets from Git Source.
Installation on MSYS2: Install prebuilt Binaries: pacman -S mingw-w64-i686-ninja mingw-w64-x86_64-ninja

Infos:
1. Documentation: https://ninja-build.org/manual.html
2. Download Source Archive or prebuilt Binaries directly: https://github.com/ninja-build/ninja/releases

Get the Source Code:
1. [Clone Git Repository to local Drive: NewNinjaGit.cmd](MSVC/Ninja/NewNinjaGit.cmd)
2. [Update local Git Repository: UpdateNinjaGit.cmd](MSVC/Ninja/UpdateNinjaGit.cmd)

Build it:
1. [X86_64, Static, Release, MSVC: Ninjax64Release.cmd](MSVC/Ninja/Ninjax64Release.cmd)

Attention: You need Python for the Bootstrapping Script!

### OpenSSL - Cryptography and SSL/TLS Toolkit
Status: Qt Build it: Explicitly linked against the specific Version created by these OpenSSL Scripts.
1. Qt: Dynamic Builds: x86_64 (64-bit) in the QtWebEngine Module (The internal "Browser" in the originally planned Tool) to enable secure Communication
2. Qt: Static Builds: x86 (32-Bit) and x86_64 (64-bit) to create static builds of the QtIFW (Qt Installer Framework). Needed for secure Communication through TLS
3. You can disable it or just switch from "-openssl-linked" to "-openssl" and remove all References to the OpenSSL Includes and Libs in the Scripts. Then, Qt will use the first Version it will find on the OS
4. Disabling explicitly linking also makes it easier to switch out the OpenSSL Libraries without the need of recompiling Qt for you and the Enduser
5. If it is illegal in your Jurisdiction to use secure Communication: Get rid of these crooks which acting as your Government. Alternatively: Switch "-openssl-linked" with "-no-openssl" to disable OpenSSL completely

Additional Infos:
1. The Scripts build a Version which only supports DTLS 1.2 and TLS 1.2 and 1.3
2. A lot of the Protocols, which I never intended to use, are disabled as well. Everything that is disabled by Default, is less pressure, to keep up with possible Security holes in OpenSSL. Simple as that.

Version: 1.1.1 Branch

Infos:
1. Documentation: https://www.openssl.org/docs/
2. Download Source Archive or prebuilt Binaries directly: https://www.openssl.org/source/

Get the Source Code:
1. [Clone Git Repository to local Drive: NewOpenSSLGit.cmd](MSVC/OpenSSL/NewOpenSSLGit.cmd)
2. [Update local Git Repository: UpdateOpenSSLGit.cmd](MSVC/OpenSSL/UpdateOpenSSLGit.cmd)

Build it:
1. [X86_64, Dynamic, Release, MSVC: OpenSSLx64Release.cmd](MSVC/OpenSSL/OpenSSLx64Release.cmd)
2. [X86_64, Static, Release, MSVC: OpenSSLx64ReleaseStatic.cmd](MSVC/OpenSSL/OpenSSLx64ReleaseStatic.cmd)
3. [X86, Dynamic, Release, MSVC: OpenSSLx86Release.cmd](MSVC/OpenSSL/OpenSSLx86Release.cmd)
4. [X86, Static, Release, MSVC: OpenSSLx86ReleaseStatic.cmd](MSVC/OpenSSL/OpenSSLx86ReleaseStatic.cmd)

### Qt Framework - Cross-Platform Application Development Framework
Status: No longer used

Version:
1. Qt 5: 5.15 Branch
2. Exception: Static builds to create the QtIFW: 5.12 Branch
3. The QtIFW is always a bit behind when it comes to supporting the latest Version of Qt. Reason: Older Qt Versions are usually more stable ("bug free").
4. Qt 6: DEV Branch. All future Qt 6 Versions are created from this Branch

Windows, MSVC++ and MinGW-w64 Compatibility: Qt 5.15 Scripts:
1. Compatible with Windows 7, 8.(0|1) and Windows 10
2. The Qt 5 and 6 Scripts for MinGW-w64 on MSYS2 are broken for a long time now, because Digia is unnecessarily hard-coding some Compiler Flags and Definitions
3. As MSYS2 is POSIX based like Linux and Unix, and Windows is WIN32 based, the hard-coding of some of these Flags and Definitions make it incompatible with the MSYS2 based MinGW-w64 GCC/G++ Compiler
4. As I am moving away from Qt, I will no longer try to fix that Mess
5. The MSYS2 based MinGW-w64 GCC/G++ Compiler is not officially supported by Digia anyway

I have read different Reports, that Qt 5.12 or 5.11 and older are still working under MSYS2. Sometimes with, sometimes without Modifications. But as I needed a lot of fixes only available in the latest 5.14 and 5.15 Versions, I have not tested, if this is still true.

Qt 6.x Scripts:
1. COMPATIBLE WITH WINDOWS 10 64-BIT ONLY
2. Windows 10 32-BIT IS NO LONGER SUPPORTED! I kept the 32-Bit Script because I was able to build early Qt 6.0 Beta Versions
3. Windows 7 and 8.(0|1), which are both End-Of-Life, are no longer supported!
4. The Qt 6 Scripts for MinGW-w64 on MSYS2 are broken as well (see above under "Qt 5.15 Scripts")
5. The Qt 6 Scripts require CMake 3.19 or newer!

Infos:
1. Documentation: https://wiki.qt.io/Main
2. Download Source Archive or prebuilt Binaries directly: https://download.qt.io/official_releases/qt/

Get the Source Code:
1. [Get Source from 5.12 Branch: Older Version for QtIFW; Latest Version supported: NewQt5QtIFWCompatibleGit.cmd](MSVC/QtProject/NewQt5QtIFWCompatibleGit.cmd)
2. [Get Source from 5.15 Branch: NewQt5Git.cmd](MSVC/QtProject/NewQt5Git.cmd)
3. [Get Source from DEV Branch (Qt 6): NewQt6Git.cmd](MSVC/QtProject/NewQt6Git.cmd)
4. [Update Source from 5.12 Branch: Older Version for QtIFW; Latest Version supported: UpdateQt5QtIFWCompatibleGit.cmd](MSVC/QtProject/UpdateQt5QtIFWCompatibleGit.cmd)
5. [Update Source from 5.15 Branch: UpdateQt5Git.cmd](MSVC/QtProject/UpdateQt5Git.cmd)
6. [Update Source from DEV Branch (Qt 6): UpdateQt6Git.cmd](MSVC/QtProject/UpdateQt6Git.cmd)

Build it:
1. [5.15 Branch: X86_64, Dynamic, Debug and Release: Qt5x64DebugRelease.sh](MSYS2/QtProject/Qt5x64DebugRelease.sh)
2. [5.12 Branch: X86_64, Static, Release: Qt5x64ReleaseStatic.sh](MSYS2/QtProject/Qt5x64ReleaseStatic.sh)
3. [5.12 Branch: X86, Static, Release: Qt5x86ReleaseStatic.sh](MSYS2/QtProject/Qt5x86ReleaseStatic.sh)
4. [5.15 Branch: X86_64, Dynamic, Debug and Release, MSVC: Qt5x64DebugRelease.cmd](MSVC/QtProject/Qt5x64DebugRelease.cmd)
5. [5.12 Branch: X86_64, Static, Release, MSVC: Qt5x64ReleaseStatic.cmd](MSVC/QtProject/Qt5x64ReleaseStatic.cmd)
6. [5.15 Branch: X86, Dynamic, Debug and Release, MSVC: Qt5x86DebugRelease.cmd](MSVC/QtProject/Qt5x86DebugRelease.cmd)
7. [5.12 Branch: X86, Static, Release, MSVC: Qt5x86ReleaseStatic.cmd](MSVC/QtProject/Qt5x86ReleaseStatic.cmd)
8. [6.x Branch (DEV Branch): X86_64, Dynamic, Debug and Release, MSVC: Qt6x64DebugRelease.cmd](MSVC/QtProject/Qt6x64DebugRelease.cmd)
9. [6.x Branch (DEV Branch): X86, Dynamic, Debug and Release, MSVC: Qt6x86DebugRelease.cmd](MSVC/QtProject/Qt6x86DebugRelease.cmd)

#### Qt 5.15 has LTS Status but is also the last 5.x Version
If you really want to use Qt and you do not have any specific reason to use Qt 5: Switch to Qt 6.x

Qt 5.15 is the last Version for Qt 5. Qt 6 is under active Development.

#### The Qt Scripts are getting no more updates!
This means:
1. The Qt Scripts are unused now
2. The Qt 5 Scripts are cloning the 5.15 LTS Branch
3. The latest Version available for Open Source Users is 5.15.2
4. Even as the Open Source Branch says 5.15.3 (or newer in the Future), it does only contain Bug Fixes for upto Version 5.15.2
5. The only updates Open Source Users will get for the Lifetime of 5.15 LTS, are Chromium Security Updates for the QtWebEngine Module
6. The Qt 6 Scripts are based on the DEV Branch. As of April 2021: The Qt 6.x Development happens in this Branch

#### QtWebEngine and 32-Bit
You need 64-Bit Windows to compile QtWebEngine for 32-Bit. Make sure to use the Visual Studio Command Prompt for Cross-Compilation with the "-arch=x86 -host_arch=amd64" Configuration.
1. [See the Notes for the different Platforms:](https://doc.qt.io/qt-5/qtwebengine-platform-notes.html)

#### QtWebEngine and Python 3
As of May 2021: Chromium still does not fully support building with Python 3! That means QtWebEngine can only be build with Python 2! The Chromium Project is working on the [Switch to Python 3](https://bugs.chromium.org/p/chromium/issues/detail?id=942720#c78)

Make sure the Path Settings are pointing to the Python 2 Directory. Either change the User Environment Variable or modify any used Scripts accordingly.
* Not necessary when you are following the Directory Structure used in the provided Build Scripts

1. Python 2.7.0 is the minimum Version required to build the Qt Framework
2. Python 2.7.5 is the minimum Version required to build the QtWebEngine Module with Qt 5 (The Qt 6 Status is unknown)
3. Python 2 is End-Of-Life. The latest Version is 2.7.18
4. For more Details read the "Other Tools" Section above

### QtIFW - Qt Installer Framework
Status: Currently unused. I dont know if I will still use the QtIFW for the Rust Version of the Tool.

As building the Linux Versions is buggy as hell for multiple Reasons, I will probably try to find another Solution long-term.

Version: Master Branch

Infos:
1. Documentation: https://doc.qt.io/qtinstallerframework/index.html
2. Download Source Archive or prebuilt Binaries directly: https://download.qt.io/official_releases/qt-installer-framework/

Get the Source Code:
1. [Get Source from Git Repository: NewQtIFWGit.cmd](MSVC/QtIFW/NewQtIFWGit.cmd)
2. [Update local Git Repository: UpdateQtIFWGit.cmd](MSVC/QtIFW/UpdateQtIFWGit.cmd)

Build it:
1. [X86_64, Static: QtIFWx64ReleaseStatic.sh](MSYS2/QtIFW/QtIFWx64ReleaseStatic.sh)
2. [X86, Static: QtIFWx86ReleaseStatic.sh](MSYS2/QtIFW/QtIFWx86ReleaseStatic.sh)
3. [X86_64, Static, MSVC: QtIFWx64ReleaseStatic.cmd](MSVC/QtIFW/QtIFWx64ReleaseStatic.cmd)
4. [X86, Static, MSVC: QtIFWx86ReleaseStatic.cmd](MSVC/QtIFW/QtIFWx86ReleaseStatic.cmd)

### Visual Studio 2019 Community Edition: Create Offline Installation Layout: Definitely not a minimal Layout but everything to build the Qt Framework
Status: No longer used. Rust has its own Compiler: Until I run into some incompatibilities, I will use the GNU Flavor with MinGW-w64 on MSYS2.

This is NOT a minimal Layout! Directory Size after creating a fresh Offline Layout with Version 16.9.2: 13.3 Gigabyte

It is possible to minimize the Layout in many ways. If you want to, start by reading the [Microsoft VS Docs](https://docs.microsoft.com/en-us/visualstudio/install/create-an-offline-installation-of-visual-studio?view=vs-2019)

The Flags to create the Offline Layout are based on the Information for Visual Studio 2017. As it still works with VS 2019, I have not updated them. But: The Installer always download additional stuff for my Configuration. So it seems that the Flags definitely need an overhaul. Additionally I have always installed:
1. All Spectre enabled Variants of the Libraries I am using directly or indirectly
2. The Build Scripts have the "/Qspectre" Flag set already. If those Libraries are not installed, the Flag gets ignored and nothing negative will happen

You need to download "vs_community.exe" from https://visualstudio.microsoft.com/
  * When using the Default Directory Structure: Put the "vs_community.exe" under %SystemDrive%\Dev\VSInstaller\Installer\VS2019Release
  * Yes, these are 3 Subdirectories. It makes sense because of how things are kept in separate Categorized Directories. Example: Having multiple Layouts for different VS Versions.

Create Offline Layout Scripts:
1. [VS-2019 Release Layout: VS2019ReleaseLayout.cmd](MSVC/VisualStudio/VS2019ReleaseLayout.cmd)
2. [VS-2021 Preview Layout. Placeholder: VS2021PreviewLayout.cmd](MSVC/VisualStudio/VS2021PreviewLayout.cmd)
3. [List of personalized Parameters for the created Shortcuts: VSCMDParameter.txt](MSVC/VisualStudio/VSCMDParameter.txt)

## Other Tools
1. Perl - Programming Language
* Required as an Interpreter to build the Qt Framework
* Minimum supported Version by Qt: 5.14
* [Download prebuilt Binaries from strawberryperl.com](http://strawberryperl.com/releases.html)
* If you do not have any specific needs, choose the latest Version
  * I recommend the "ZIP edition" - No installation necessary. Just unzip it and it is ready to use

Installation on MSYS2: Use Default Perl unless you know what you do!!! But if you need to:<br>
pacman -S mingw-w64-i686-perl mingw-w64-x86_64-perl

2. Python - Programming Language
* Required as an Interpreter to build the Qt Framework
* Minimum supported Version by Qt: 2.7.0
* Version 2.7.5 or later is required to build QtWebEngine
* Chromium (and therefore QtWebEngine) still do not Support Python 3!
* Build Qt with QtWebEngine: [Download the last 2.7 Release from python.org](https://www.python.org/downloads/release/python-2718/)
* Build Qt without QtWebEngine: Use the latest Python Version available for your Operating System
  * [Or download the latest Version at python.org](https://www.python.org/downloads/)

MSYS2 - Python 2.7.18: pacman -S mingw-w64-i686-python2 mingw-w64-x86_64-python2
MSYS2 - Python 3.x: pacman -S mingw-w64-i686-python mingw-w64-x86_64-python

2. Python - Programming Language
* Required as an Interpreter for all Projects using Python Scripts

MSYS2 - Python 2.7.18: pacman -S mingw-w64-i686-python2 mingw-w64-x86_64-python2
MSYS2 - Python 3.x: pacman -S mingw-w64-i686-python mingw-w64-x86_64-python
