@echo on
REM This script compresses all required content into singe package.
REM TODO: Implement.

REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call "%~dp0header.cmd"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

REM Show hint for user.
echo Specified installation directory: "%CYGWIN_ROOT_DIR%"
echo Specified distribution directory: "%CYGWIN_DISTRIB_DIR%"

REM Archive package content into user's home:
cd "%CYGWIN_DISTRIB_DIR%\.."
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

REM TODO: Instead of relying on Cygwin, use these answers:
REM     - Get current timestamp:
REM         http://stackoverflow.com/questions/1064557/creating-a-file-name-as-a-timestamp-in-a-batch-job
REM     - Zip using command line only:
REM         http://superuser.com/questions/110991/can-you-zip-a-file-from-the-command-prompt-using-only-windows-built-in-capabili 

REM Switch to original directory (where the current script was called)
cd "%~dp0"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)


