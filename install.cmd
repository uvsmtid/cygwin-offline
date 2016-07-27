REM This script is just a pointer to real script to install Cygwin package.
REM It is supposed to be run by user on target host (possibly without Internet connectivity).
REM All pre-downloaded Cygwin content is supposed to be under `distrib`.

REM Switch to original directory (where the current script was called).
cd "%~dp0"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

call scripts\cygwin_distrib_install.cmd
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


