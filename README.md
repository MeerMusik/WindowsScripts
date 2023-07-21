[[_TOC_]]
# About WindowsScripts
(C) Copyright 2013-2023 Oliver Niebuhr

Very basic Scripts to
1. Clone (Download) the Source Code of Libraries and Frameworks like ICU, LLVM, OpenSSL and wxWidgets from their Git Repositories
2. Build these Libraries and Frameworks

May they be useful to you in one way or another.

The Scripts are written to compliment each other. Example: Locally cloned Repositories will be found under

%SystemDrive%\Dev\GitRepos\[Name-Of-The-Repository]

The Build Scripts will search for the Source Code of these Libraries in this Directory.

These Scripts will only get updated if I run into Issues myself! Bug Reports to fix or update a specific Compiler Flag will be ignored, if it interferes with my use case or it is not compatible with the Version of a Library and or Compiler I am using!

As I am currently using Rust and Go, these Scripts are currently unused and Bug Reports will probably stay open for many months.

The best options to get something fixed are:
1. Clone the Repository -> Fix the Bug -> Create a Pull Request -> Wait for me to Merge your PR / MR OR
2. Fork the Repository -> Fix the Bug -> Enjoy the Error Free Script

## General Infos
All Scripts were created and successfully tested under the following Windows and Compiler Versions:
1. Windows 10 21H1, x86_64
2. MinGW-w64 on MSYS2, 10.3, x86, x86_64

Older Compiler Versions should work, if they are not too old. What too old means, has not been fully tested. I personally tested down to GCC 8.1.0

You usually need to remove or modify some Compiler Flags for newer and older Versions of a Compiler, Linker, Library etc.

Other Compiler Variants like Clang-MinGW-w64 or Clang-MSVC are untested and therefore not supported by me!

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
1. THE_UNLICENSE.txt - In this Repo: [THE_UNLICENSE.txt](THE_UNLICENSE.txt)
2. The Unlicense: Original at the Authors Website: https://unlicense.org/
3. The Unlicense: At SPDX.org: https://spdx.org/licenses/Unlicense.html

CC0-1.0 Universal (Public Domain with Fallback Mechanism):
1. CC0-1.0.txt - In this Repo: [CC0-1.0.txt](CC0-1.0.txt)
2. CC0-1.0: Full Text at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt
3. CC0-1.0: Human-Readable Summary - English at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/
4. CC0-1.0: Human-Readable Summary - German Translation at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/deed.de
5. CC0-1.0: At SDPX.org: https://spdx.org/licenses/CC0-1.0.html

## Contributing
The full Contribution Rules can be found in the
1. [CONTRIBUTING.md](CONTRIBUTING.md)

## Questions? Need to report a Bug?
Send me a Message. I will try to reply within 96 hours. Sometimes sooner, sometimes later.
1. For Bug Reports: Click on the Button "New Issue" and use the "Bug Report" Form to create a new Issue marked as Bug Report: https://github.com/MeerMusik/WindowsScripts/issues/
2. For Questions: Click on the Button "New Issue" and use the "Question" Form to create a new Issue marked as Question: https://github.com/MeerMusik/WindowsScripts/issues/
3. eMail: Bug Report. MailTo Link: [Opens your eMail Program](mailto:gitrepos@oliverniebuhr.de?subject=WindowsScripts-Bug-Report)
4. eMail: Question. MailTo Link: [Opens your eMail Program](mailto:gitrepos@oliverniebuhr.de?subject=WindowsScripts-Question)
5. Contact me on Twitter: https://twitter.com/MeerMusik
6. Contact Form on my personal Website (German): https://oliverniebuhr.de/kontakt

Remember that Tweets are always public! Everyone can read what you write! If you need to send Personal Infos, send me a Direct Message!

## List of Scripts
The '.SH' Shell Scripts are made for MinGW-w64 on MSYS2 - Software Distribution and Building Platform for Windows: https://www.msys2.org/

### Boost - C++ Libraries
Status: Currently not used <br>

Infos:
1. Documentation: https://www.boost.org/doc/
2. Download Source Code directly: https://boostorg.jfrog.io/artifactory/main/release/

Get the Source Code:
1. Clone Git Repository to local Drive: [NewBoostGit.sh](MSYS2/Boost/NewBoostGit.sh)
2. Update local Git Repository: [UpdateBoostGit.sh](MSYS2/Boost/UpdateBoostGit.sh)

Build it:
1. X86_64, Shared, Debug and Release: [Boostx64.sh](MSYS2/Boost/Boostx64.sh)
2. X86_64, Static, Debug and Release: [Boostx64Static.sh](MSYS2/Boost/Boostx64Static.sh)
3. X86, Shared, Debug and Release: [Boostx86.sh](MSYS2/Boost/Boostx86.sh)
4. X86, Static, Debug and Release: [Boostx86Static.sh](MSYS2/Boost/Boostx86Static.sh)

### Botan - Crypto and TLS for Modern C++
Status: Currently not used <br>

Infos:
1. Documentation: https://botan.randombit.net/handbook/building.html
2. Download Source Code directly: https://github.com/randombit/botan/releases

Get the Source Code:
1. Clone Git Repository to local Drive: [NewBotanGit.sh](MSYS2/Botan/NewBotanGit.sh)
2. Update local Git Repository: [UpdateBotanGit.sh](MSYS2/Botan/UpdateBotanGit.sh)

Build it:
1. X86_64, Static, Debug and Release: [Botanx64Static.sh](MSYS2/Botan/Botanx64Static.sh)
2. X86, Static, Debug and Release: [Botanx86Static.sh](MSYS2/Botan/Botanx86Static.sh)

### CLANG / LLVM - The LLVM Compiler Infrastructure
Status: Currently not used <br>

Building from Source is optional. I have only used Clang as a Parser for Qt Framework specific Parts. I have not yet built any Library with Clang directly.

If you use the Build Scripts as they are: Either Install Swig on MSYS2:
1. X86: pacman -S mingw-w64-i686-swig
2. X86_64: pacman -S mingw-w64-x86_64-swig

Or:
1. Download Swig Source: http://www.swig.org/download.html
2. Unzip the Archive to %SystemDrive%\Dev\swigwin
3. Build the Swig Binaries (No Idea how, I have never done that)

Swig has additional Dependencies, which will get automatically installed:
1. PCRE
2. WinEditLine

Alternatively: Disable building of the LLDB and get rid of the Swig Dependency

Infos:
1. If you do not have any specific needs, You should use the prebuilt Binaries from https://releases.llvm.org/
2. General Documentation: https://llvm.org/docs/
3. How to build Clang / LLVM : Basic starting Guide: https://clang.llvm.org/get_started.html

Get the Source Code:
1. Clone Git Repository to local Drive: [NewLLVMGit.sh](MSYS2/LLVM/NewLLVMGit.sh)
2. Update local Git Repository: [UpdateLLVMGit.sh](MSYS2/LLVM/UpdateLLVMGit.sh)

Build it:
1. X86_64, Debug: [LLVMx64Debug.sh](MSYS2/LLVM/LLVMx64Debug.sh)
2. X86_64, Release: [LLVMx64Release.sh](MSYS2/LLVM/LLVMx64Release.sh)
3. X86, Debug: [LLVMx86Debug.sh](MSYS2/LLVM/LLVMx86Debug.sh)
4. X86, Release: [LLVMx86Release.sh](MSYS2/LLVM/LLVMx86Release.sh)

ATTENTION: DEBUG BUILDS ARE RELEASE BUILDS WITH MINIMUM DEBUG INFORMATION !!
1. The Debug builds are Release builds with minimum Debug Information (-g1) and ASSERTIONS DISABLED!
2. The Problem is the Size Limitation in the PE File Format (Portable Executable) https://en.wikipedia.org/wiki/Portable_Executable
3. The Limitation is the same for 32-Bit (x86) and 64-Bit (x86_64) Binaries as it is part of the File Format Implementation
4. There is no way to work around this: The LLVM Debug builds contain too many Debug Symbols. The Linker (LD.exe) will fail at the linking stage
5. If you really need good Debug builds of LLVM (As in: A good Amount of Debug Information): Switch to a 64-Bit Linux or Unix System

Known Limitation:
1. As of May 2021, enabling Assertions breaks Python with(?) / for(?) LLDB, which leads to an Error Message during the linking stage like: <br> 'tools/lldb/source/API/CMakeFiles/liblldb.dir/__/__/bindings/python/LLDBWrapPython.cpp.obj:LLDBWrapPython.cpp:(.text+0xce): undefined reference to _imp___Py_RefTotal'

It is either a Bug or a Limitation on the Windows Platform, if I remember correctly.

### CMake - Build Management Tool. Used to build wxWidgets and Clang / LLVM
Status: Used when a Tool or Library supports it or has it set as a fixed Dependency. <br>

Installation on MSYS2:
1. X86: pacman -S mingw-w64-i686-cmake
2. X86_64: pacman -S mingw-w64-x86_64-cmake

Do NOT use MSYS2 CMake! It has a lot of Compatibility Issues!

I build only from Source, when I need to test specific fixes or a new Feature.

Attention: By Default, You need an existing CMake and Ninja Installation to build CMake from Source! You can uncomment the Lines in the Script to use 'Make'. Do not forget to comment the CMake specific Parts - otherwise you will break the Scripts!

I usually use the latest prebuilt x86_64 Binaries (ZIP Archive) from https://cmake.org/download/ <br>
If you are unsure: Download the ZIP Archive: No hassle with Installation and Uninstallation. Also very simple to overwrite all the Files with a newer Version that way

Infos:
1. Official Documentation: https://cmake.org/cmake/help/latest/
2. Community Wiki: https://gitlab.kitware.com/cmake/community/-/wikis/home

Get the Source Code:
1. Clone Git Repository to local Drive: [NewCMakeGit.sh](MSYS2/CMake/NewCMakeGit.sh)
2. Update local Git Repository: [UpdateCMakeGit.sh](MSYS2/CMake/UpdateCMakeGit.sh)

Build it:
1. X86_64, Static, Release: [CMakex64Release.sh](MSYS2/CMake/CMakex64Release.sh)

### ICU - International Components for Unicode
Status: Currently unused. If it is still needed, needs to be determined. <br>

Infos:
1. Documentation: http://site.icu-project.org/docs
2. Download Source Archive or prebuilt Binaries directly: http://site.icu-project.org/download

Attention: It is possible that you will run into the following Error, when the Build Scripts are reaching the cleanup Phase:

'rm: cannot remove 'C:/Dev/Builds/ICUx64/source': Directory not empty'.

The Problem is, that the 'rm' command will add a malformed Character to the Names of all Subdirectories, under which ICU was built. This leads to multiple undeletable Directories. The Issue seems to only occur when I run the ICU Tests. I do not have found a Solution for that yet.

If you see this Error Message, you have to delete the ICU Build Directory manually. It can be found by Default under: ${SYSTEMDRIVE}/Dev/Builds/

One possible Solution could be to set the Locale, Character Set and UI Language explicitly in MSYS2.

How to do that:
1. Right-Click on the open MSYS2 Shell Window or Right-Click on the Titlebar of the open MSYS2 Shell Window
2. Click on 'Options'
3. On the Left Side, click on the Menuentry 'Text'
4. On the Right Side, set the correct 'Locale' and 'Character Set'. Usually UTF-8 for Unicode. Unless your Language is using something else like MBCS, UTF-16 etc.
5. Click on the 'Apply' Button on the Bottom of the Options Window
6. On the Left Side click on the Menuentry 'Window'
7. On the Right Side, set the UI Language matching your Operating System
8. Click on the 'Save' Button on the Bottom of the Options Window to Apply the changes and close the Options Window

You only need to set this once.

On my System, with English-US Language and German Localization for Keyboard, Currency etc., the Final Settings are:
1. Text: Locale: en_DE
2. Text: Character Set: UTF-8
3. Window: UI Language: de

This has helped me so far only, when I do NOT run the ICU Tests - which is obviously not a Solution at all. If you know a permanent Solution, please tell us all. Thank you in advance!

Get the Source Code:
1. Clone Git Repository to local Drive: [NewICUGit.sh](MSYS2/ICU/NewICUGit.sh)
2. Update local Git Repository: [UpdateICUGit.sh](MSYS2/ICU/UpdateICUGit.sh)

You also need [Git Large File Storage Extension](https://git-lfs.github.com/) <br>
Need help setting up Git LFS? [Follow the Section 'Detailed Instructions' -> 'Prerequisites: Git and Git LFS' at the ICU Project Site](http://site.ICU-project.org/repository)

Build it:
1. X86_64, Dynamic, Debug and Release: [ICUx64.sh](MSYS2/ICU/ICUx64.sh)
2. X86, Dynamic, Debug and Release: [ICUx86.sh](MSYS2/ICU/ICUx86.sh)

Building static Libraries on Windows is not officially supported. MinGW-w64 correctly creates static Libraries with the specific Character 's' as Part of the Filename. But LD is always looking for the Dynamic Libraries which do not contain the 's' Character. At some point, I will take another look at it. For now I have other Priorities. Feel free to test and create a Merge Request. Or better: Ask the ICU Developers directly for static Library Support on Windows if you need it!
1. X86_64, Static, Debug and Release: [ICUx64Static.sh](MSYS2/ICU/BROKEN/ICUx64Static.sh)
2. X86, Static, Debug and Release: [ICUx86Static.sh](MSYS2/ICU/BROKEN/ICUx86Static.sh)

### Ninja - The Ninja Build System
Status: Heavily recommended. I use it whenever possible. <br>

Installation on MSYS2:
1. X86: pacman -S mingw-w64-i686-ninja
2. X86_64: pacman -S mingw-w64-x86_64-ninja

Infos:
1. Documentation: https://ninja-build.org/manual.html
2. Download Source Archive or prebuilt Binaries directly: https://github.com/ninja-build/ninja/releases

Get the Source Code:
1. Clone Git Repository to local Drive: [NewNinjaGit.sh](MSYS2/Ninja/NewNinjaGit.sh)
2. Update local Git Repository: [UpdateNinjaGit.sh](MSYS2/Ninja/UpdateNinjaGit.sh)

Build it:
1. X86_64, Static, Release: [Ninjax64Release.sh](MSYS2/Ninja/Ninjax64Release.sh)

Attention: You need Python for the Bootstrapping Script!

### OpenSSL - Cryptography and SSL/TLS Toolkit
Status: Currently not used <br>

Infos:
1. Documentation: https://www.openssl.org/docs/
2. Download Source Archive or prebuilt Binaries directly: https://www.openssl.org/source/

Get the Source Code:
1. Clone Git Repository to local Drive: [NewOpenSSLGit.sh](MSYS2/OpenSSL/NewOpenSSLGit.sh)
2. Update local Git Repository: [UpdateOpenSSLGit.sh](MSYS2/OpenSSL/UpdateOpenSSLGit.sh)

Build it:
1. X86_64, Dynamic, Debug: [OpenSSLx64Debug.sh](MSYS2/OpenSSL/OpenSSLx64Debug.sh)
2. X86_64, Static, Debug: [OpenSSLx64DebugStatic.sh](MSYS2/OpenSSL/OpenSSLx64DebugStatic.sh)
3. X86_64, Dynamic, Release: [OpenSSLx64Release.sh](MSYS2/OpenSSL/OpenSSLx64Release.sh)
4. X86_64, Static, Release: [OpenSSLx64ReleaseStatic.sh](MSYS2/OpenSSL/OpenSSLx64ReleaseStatic.sh)
5. X86, Dynamic, Debug: [OpenSSLx86Debug.sh](MSYS2/OpenSSL/OpenSSLx86Debug.sh)
6. X86, Static, Debug: [OpenSSLx86DebugStatic.sh](MSYS2/OpenSSL/OpenSSLx86DebugStatic.sh)
7. X86, Dynamic, Release: [OpenSSLx86Release.sh](MSYS2/OpenSSL/OpenSSLx86Release.sh)
8. X86, Static, Release: [OpenSSLx86ReleaseStatic.sh](MSYS2/OpenSSL/OpenSSLx86ReleaseStatic.sh)

### Pirates-Little-Helper - (WIP NAME. PLACEHOLDER)
Status: Delayed indefinitely. Project will potentially be killed off. <br>

The Links to the Files have been removed while the Tool will be rewritten from Scratch in another Framework.

Info:
1. My personal Website (German): https://oliverniebuhr.de
2. FAQ on my Website (German): https://oliverniebuhr.de/

Get the Source Code:
1. Clone Git Repository to local Drive: [NewPiratesLittleHelper.sh](PiratesLittleHelper/NewPiratesLittleHelper.sh)
2. Update local Git Repository: [UpdatePiratesLittleHelper.sh](PiratesLittleHelper/UpdatePiratesLittleHelper.sh)

Build it: The real Build Scripts will be added when they are ready...

Build it: Cross-Compile Linux to Windows: The real Build Scripts will be added when they are ready...

Cross-Compile Limitations: <br>
Unknown yet

## Zig Programming Language - BROKEN MESS! ZIG DOCS ARE OUTDATED AND INCORRECT! DO NOT USE! PLACEHOLDER FOR LATER!
WORK - IN - PROGRESS! I WILL WORK ON THIS DURING THE NEXT 6 TO 12 MONTHS!

Building Zig from source is currently a Mess and I highly recommend against it, if you do not contribute to Zig itself or really need a specific Git Commit!<br>
Zig Nightly Binaries, based on the Master Branch, are available for your convenience: https://ziglang.org/download/

To build Zig from Source, you have different Options. At the time of writing (July 21st 2023):
Variant 1: Everything from Source:<br>
Requires: LLVM, LLD, CLANG, CMake 3.20.0 or later, Python 3.94 or later, MSVC++ 16 or later, Visual Studio C++ Build Tools, C++ ATL Build Tools. <br>

The LLVM Version must match the Version used in the Zig Master Branch! No Exception!

Variant 2.1.: Build Zig with the Zig DevKit: Requires: CMake 3.20.0 or later, Python 3.94 or later. This Variant also requires Ninja as the NMake in-place replacement.

Variant 2.2.: Similar as Variant 2.1 but it uses the provided Zig Binaries instead of CMake and Ninja. Use the "Vanilla" Script.

Variant 3.: Use Zig Bootstrap: https://github.com/ziglang/zig-bootstrap I do not provide Scripts for this Variant!

Infos:
1. Documentation: https://ziglang.org/documentation/master/
2. Download Source Archive or prebuilt Binaries directly: https://ziglang.org/download/

Get the Source Code:
1. Clone Git Repository to local Drive: [NewZigGit.sh](MSYS2/Zig/NewZigGit.sh)
2. Update local Git Repository: [UpdateZigGit.sh](MSYS2/Zig/UpdateZigGit.sh)

Build LLVM, LLD and Clang from Source with Flags specifically required for Zig - MSVC!
1. X86_64, Static, Debug and Release: [ZigLLVMMSVCx64.cmd](MSYS2/Zig/ZigLLVMMSVCx64.cmd)
2. X86, Static, Debug and Release: [ZigLLVMMSVCx86.cmd](MSYS2/Zig/ZigLLVMMSVCx86.cmd)

Build Zig with existing LLVM, MSVC++ etc. Toolchain:
1. Latest Build Infos - Windows MSVC: https://github.com/ziglang/zig/wiki/How-to-build-LLVM,-libclang,-and-liblld-from-source
2. X86_64, Static, Debug and Release: [Zigx64StaticMSVC.cmd](MSYS2/Zig/Zigx64StaticMSVC.cmd)
3. X86, Static, Debug and Release: [Zigx86StaticMSVC.cmd](MSYS2/Zig/Zigx86StaticMSVC.cmd)

Build Zig with Devkit - CMake and Ninja - Must be run from CMD or Powershell:
1. Compile with Devkit Build Info: https://github.com/ziglang/zig/wiki/Building-Zig-on-Windows#option-1a-cmake--ninja
2. X86_64, Static, Debug and Release: [Zigx64StaticDevkitCMake.cmd](MSYS2/Zig/Zigx64StaticDevkitCMake.cmd)
3. X86, Static, Debug and Release: [Zigx86StaticDevkitCMake.cmd](MSYS2/Zig/Zigx86StaticDevkitCMake.cmd)

Build Zig with Devkit - Vanilla - Must be run from CMD or Powershell:
1. Compile with Devkit Build Info: https://github.com/ziglang/zig/wiki/Building-Zig-on-Windows#option-1b-zig-build
2. X86_64, Static, Debug and Release: [Zigx64StaticDevkitVanilla.sh](MSYS2/Zig/Zigx64StaticDevkitVanilla.cmd)
3. X86, Static, Debug and Release: [Zigx86StaticDevkitVanilla.sh](MSYS2/Zig/Zigx86StaticDevkitVanilla.cmd)


-- NOT SUPPORTED! INCOMPLETE PLACEHOLDER! --
Build it: Zig itself:
1. Latest Build Infos - POSIX - Windows MSYS2 GNU: https://github.com/ziglang/zig/wiki/How-to-build-LLVM,-libclang,-and-liblld-from-source#posix

Build LLVM, LLD and Clang from Source with Flags specifically required for Zig - MSYS2 - GNU Compiler!
1. X86_64, Static, Debug and Release: [ZigLLVMMSYS2x64.sh](MSYS2/Zig/ZigLLVMMSYS2x64.sh)
2. X86, Static, Debug and Release: [ZigLLVMMSYS2x86.sh](MSYS2/Zig/ZigLLVMMSYS2x86.sh)


## Other Tools - Not provided as a Script
Hard Dependencies or recommended Libraries.

1. NASM - Netwide Assembler. For OpenSSL. Optional but highly recommended
    1. Download the latest prebuilt Binaries: https://www.nasm.us/pub/nasm/releasebuilds/
    2. Version: Always the latest

Installation on MSYS2:
- X86: pacman -S mingw-w64-i686-nasm
- X86_64: pacman -S mingw-w64-x86_64-nasm

2. Perl Programming Language
    1. Required as an Interpreter for all Projects using Perl Scripts
    2. Download prebuilt Binaries from strawberryperl.com: http://strawberryperl.com/releases.html
    3. If you do not have any specific needs, choose the latest Version
    4. I recommend the 'ZIP edition' - No installation necessary. Just unzip it and it is ready to use
    5. Version: Always the latest. Unless I need an older Version because of in example Compatibility Issues

Installation on MSYS2: Use the Default MSYS2 Perl unless you know what you are doing! But if you really need to:
- X86: pacman -S mingw-w64-i686-perl
- X86_64: pacman -S mingw-w64-x86_64-perl

3. Python 3.x Programming Language
    1. Required as an Interpreter for all Projects using Python Scripts
    2. Version: Always the latest. Unless I need an older Version because of in example Compatibility Issues

Installation on MSYS2:
- X86: pacman -S mingw-w64-i686-python
- X86_64: pacman -S mingw-w64-x86_64-python

## LinuxScripts
I also published my Linux Scripts Dual-Licensed under "The Unlicense" (Public Domain) OR under the "CC0-1.0 Universal License" (Public Domain with Fallback Mechanism):
1. LinuxScripts: [Repository at GitHub](https://github.com/MeerMusik/LinuxScripts)
