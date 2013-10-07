@echo on
REM This updates Cygwin distributive directory including NEL changes only.


REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call "%~dp0common.cmd"


REM Show hint for user.
echo Specified installation directory: "%CYGWINROOTDIR%"
echo Specified distribution directory: "%CYGWINDISTRIBDIR%"

REM Update each svn directory under repo
cd "%CYGWINDISTRIBDIR%\repo"
svn update installer
svn update sys

REM Update package root directory
cd "%CYGWINDISTRIBDIR%
svn update .

REM Archive all files by tar to preserve permissions (especially executable)
"%CYGWINROOTDIR%\bin\bash.exe" -c "cd \"$^(/usr/bin/cygpath -u \"$CYGWINDISTRIBDIR\"^)\" ; /usr/bin/tar -cvf repo.tar repo"

REM Switch to original directory (where the current script was called)
cd "%~dp0"

