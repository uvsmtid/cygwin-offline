@echo on
REM This script sets up OpenSSH daemon for Cygwin

REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call "%~dp0common.cmd"

REM Show hint for user.
echo Specified installation directory: "%CYGWINROOTDIR%"
echo Specified distribution directory: "%CYGWINDISTRIBDIR%"

REM Create directory for OpenSSH daemon configuration
mkdir "%CYGWINROOTDIR%\home\sshd"

REM Copy OpenSSH daemon configuration file
copy "%CYGWINDISTRIBDIR%\repo\installer\sshd\sshd_config"        "%CYGWINROOTDIR%\home\sshd"

REM Copy bat file to user's startup directory
copy "%CYGWINDISTRIBDIR%\repo\installer\sshd\sshd_start.cmd"     "%USERPROFILE%"\"AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"


