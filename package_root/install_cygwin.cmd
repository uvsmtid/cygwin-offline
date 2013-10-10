REM This script is just a pointer to real installation script
call repo\installer\install_cygwin.cmd
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)
