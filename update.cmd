REM This script is just a pointer to real script to update Cygwin content.
REM It is supposed to be run by user on host with Internet connectivity.
REM All pre-downloaded Cygwin content is supposed to be under `distrib`.

call scripts\download_setup.cmd
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    cd "%~dp0"
    EXIT /B 1
)

REM Switch to original directory (where the current script was called).
cd "%~dp0"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

call scripts\cygwin_distrib_update.cmd
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    cd "%~dp0"
    EXIT /B 1
)

REM Switch to original directory (where the current script was called).
cd "%~dp0"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)


