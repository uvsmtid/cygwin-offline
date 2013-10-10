REM This script is just a pointer to real installation script
call repo\installer\install_cygwin.cmd
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    cd "%~dp0"
    EXIT /B 1
)
REM Switch to original directory (where the current script was called)
cd "%~dp0"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)


