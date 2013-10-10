@echo on
REM This updates Cygwin distributive directory including NEL changes only.


REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call "%~dp0common.cmd"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)


REM Show hint for user.
echo Specified installation directory: "%CYGWINROOTDIR%"
echo Specified distribution directory: "%CYGWINDISTRIBDIR%"

REM Update each svn directory under repo
cd "%CYGWINDISTRIBDIR%\repo"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)
"%CYGWINROOTDIR%\bin\bash.exe" -c "/usr/bin/svn update installer"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)
"%CYGWINROOTDIR%\bin\bash.exe" -c "/usr/bin/svn update sys"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

REM Update package root directory
cd "%CYGWINDISTRIBDIR%
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)
"%CYGWINROOTDIR%\bin\bash.exe" -c "/usr/bin/svn update ."
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

REM Archive all files by tar to preserve permissions (especially executable)
"%CYGWINROOTDIR%\bin\bash.exe" -c "cd \"$^(/usr/bin/cygpath -u \"$CYGWINDISTRIBDIR\"^)\" ; /usr/bin/tar -cvf repo.tar repo"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

REM Switch to original directory (where the current script was called)
cd "%~dp0"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

