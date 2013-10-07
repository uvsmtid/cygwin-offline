@echo on
REM This updates Cygwin zip package.


REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call %~dp0common.cmd


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
%CYGWINROOTDIR%\bin\bash.exe -c "cd $(/usr/bin/cygpath -u $CYGWINDISTRIBDIR) ; tar -cvf repo.tar repo"

REM TODO: Archive package content


REM TODO: Upload base package automatically


REM Report
pause "Press any key..."



