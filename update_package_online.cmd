@echo on
REM This updates Cygwin zip package.

set CYGWINROOTDIR=C:\cygwin64
set CYGWINDISTRIBDIR=C:\cygwin.distrib

set UNIXCYGWINDISTRIBDIR=/cygdrive/c/cygwin.distrib
set UNIXCYGWINROOTDIR=/cygdrive/c/cygwin64


REM Show hint for user.
echo Specified installation directory: %CYGWINROOTDIR%
echo Specified distribution directory: %CYGWINDISTRIBDIR%

REM TODO: Download base package automatically

REM Download Cygwin update
%CYGWINDISTRIBDIR%\repo\installer\download_cygwin.cmd

REM Download Cygwin update
%CYGWINDISTRIBDIR%\repo\installer\update_package_offline.cmd

REM TODO: Upload base package automatically

