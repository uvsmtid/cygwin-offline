@echo on
REM This updates Cygwin distributive directory including both changes: NEL (needs connection to Subversion) and Cygwin (needs connection to Internet)


REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call "%~dp0common.cmd"


REM Show hint for user.
echo Specified installation directory: "%CYGWINROOTDIR%"
echo Specified distribution directory: "%CYGWINDISTRIBDIR%"


REM Switch into installer directory (to avoid creating logs in the current one)
cd "%CYGWINDISTRIBDIR%\installer"


REM Download Cygwin update
"%CYGWINDISTRIBDIR%\repo\installer\update_cygwin_distribution_dir_cygwin_only.cmd"

REM Update changes from SVN
"%CYGWINDISTRIBDIR%\repo\installer\update_cygwin_distribution_dir_repo_only.cmd"


REM Switch to original directory (where the current script was called)
cd "%~dp0"

