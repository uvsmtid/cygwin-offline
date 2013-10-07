@echo on
REM This updates Cygwin zip package.


REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call "%~dp0common.cmd"


REM Show hint for user.
echo Specified installation directory: "%CYGWINROOTDIR%"
echo Specified distribution directory: "%CYGWINDISTRIBDIR%"

REM TODO: Download base package automatically


REM TODO: Unpack base package automatically


REM Switch into installer directory (to avoid creating logs in the current one)
cd "%CYGWINDISTRIBDIR%\installer"


REM Download Cygwin update
"%CYGWINDISTRIBDIR%\repo\installer\download_cygwin.cmd"

REM Update changes from SVN
"%CYGWINDISTRIBDIR%\repo\installer\update_package_offline.cmd"

REM TODO: Upload base package automatically


REM Switch to original directory (where the current script was called)
cd "%~dp0"

