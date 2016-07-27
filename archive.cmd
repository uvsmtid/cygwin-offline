REM This script is just a pointer to real script to archive Cygwin content.
REM All pre-downloaded Cygwin content is supposed to be under `distrib`.

call scripts\zip_archive.cmd
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


