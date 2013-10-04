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

REM Update each svn directory
cd %CYGWINDISTRIBDIR%\repo
svn update installer
svn update sys

REM Archive all files by tar to preserve permissions (especially executable)
%CYGWINROOTDIR%\bin\bash.exe -c "cd $UNIXCYGWINDISTRIBDIR ; tar -cvf repo.tar repo"

REM TODO: Archive package content


REM TODO: Upload base package automatically


REM Report
pause "Press any key..."



