@echo on
REM This script sets up OpenSSH daemon for Cygwin

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

"%CYGWINROOTDIR%\bin\bash.exe" -c "\"$^(/usr/bin/cygpath -u \"$CYGWINDISTRIBDIR\"^)\"/repo/installer/setup_openssh.sh \"%USERPROFILE%\""
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)
