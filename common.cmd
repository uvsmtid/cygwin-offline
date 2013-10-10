@echo on

REM This script defines common variables

REM Cygwin distribution directory is two levels up from the directory of this script (.\repo\installer)
set CYGWINDISTRIBDIR=%~dp0..\..

REM Define drive where Cygwin is supposed to be installed
IF DEFINED CYGWIN_DRIVE (
	REM Use drive provieded by %CYGWIN_DRIVE%
) ELSE (
	set CYGWIN_DRIVE=C
)
echo CYGWIN_DRIVE=%CYGWIN_DRIVE%

REM Cygwin root directory is hardcoded/fixed (it's a convention)
IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
        set CYGWINSETUPEXE=setup-x86.exe
	set CYGWINROOTDIR=%CYGWIN_DRIVE%:\cygwin32
) ELSE (
	set CYGWINSETUPEXE=setup-x86_64.exe
	set CYGWINROOTDIR=%CYGWIN_DRIVE%:\cygwin64
)
echo CYGWINSETUPEXE=%CYGWINSETUPEXE%
echo CYGWINROOTDIR=%CYGWINROOTDIR%

set CYGWINBINDIR=%CYGWINROOTDIR%\bin
