@echo on
REM This updates Cygwin zip package.


REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call "%~dp0common.cmd"


REM Show hint for user.
echo Specified installation directory: "%CYGWINROOTDIR%"
echo Specified distribution directory: "%CYGWINDISTRIBDIR%"

REM Update each svn directory
cd "%CYGWINDISTRIBDIR%\repo"
svn update installer
svn update sys

REM Archive all files by tar to preserve permissions (especially executable)
"%CYGWINROOTDIR%\bin\bash.exe" -c "cd \"$^(/usr/bin/cygpath -u \"$CYGWINDISTRIBDIR\"^)\" ; /usr/bin/tar -cvf repo.tar repo"

REM Archive package content into user's home:
cd "%CYGWINDISTRIBDIR%\.."
"%CYGWINROOTDIR%\bin\bash.exe" -c "\"$^(/usr/bin/cygpath -u \"$CYGWINDISTRIBDIR\"^)\"/repo/installer/zip_cygwin_distrib.sh"

REM Switch to original directory (where the current script was called)
cd "%~dp0"

