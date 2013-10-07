@echo on
REM This updates Cygwin zip package.


REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call %~dp0common.cmd


REM Show hint for user.
echo Specified installation directory: %CYGWINROOTDIR%
echo Specified distribution directory: %CYGWINDISTRIBDIR%

REM Switch into installer directory (to avoid creating logs in the current one)
cd %CYGWINDISTRIBDIR%\installer

REM TODO: Download base package automatically

REM Download Cygwin update
%CYGWINDISTRIBDIR%\repo\installer\download_cygwin.cmd

REM Download Cygwin update
%CYGWINDISTRIBDIR%\repo\installer\update_package_offline.cmd

REM TODO: Upload base package automatically

