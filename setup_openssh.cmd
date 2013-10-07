@echo on
REM This script sets up OpenSSH daemon for Cygwin

set CYGWINROOTDIR=C:\cygwin64
set CYGWINDISTRIBDIR=C:\cygwin.distrib


set UNIXCYGWINDISTRIBDIR=/cygdrive/c/cygwin.distrib
set UNIXCYGWINROOTDIR=/cygdrive/c/cygwin64

REM Show hint for user.
echo Specified installation directory: %CYGWINROOTDIR%
echo Specified distribution directory: %CYGWINDISTRIBDIR%

REM Create directory for OpenSSH daemon configuration
mkdir %CYGWINROOTDIR%\home\sshd

REM Copy OpenSSH daemon configuration file
copy %CYGWINDISTRIBDIR%\repo\installer\sshd_config        %CYGWINROOTDIR%\home\sshd

REM Copy bat file to user's startup directory
copy %CYGWINDISTRIBDIR%\repo\installer\sshd_start.cmd     %USERPROFILE%\"AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"


