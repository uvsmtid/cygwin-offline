@echo on

REM This script defines common variables

REM Cygwin distribution directory is two levels up from the directory of this script (.\repo\installer)
set CYGWINDISTRIBDIR=%~dp0..\..

REM Cygwin root directory is hardcoded/fixed (it's a convention)
set CYGWINROOTDIR=C:\cygwin64

set CYGWINBINDIR=%CYGWINROOTDIR%\bin
