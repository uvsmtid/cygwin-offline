@echo off
REM This script sets up OpenSSH daemon for Cygwin

set ROOTDIR=C:\cygwin64
set DISTRIBDIR=C:\cygwin.distrib

REM Show hint for user.
echo Specified installation directory: %ROOTDIR%
echo Specified distribution directory: %DISTRIBDIR%

REM Create directory for OpenSSH daemon configuration
mkdir %ROOTDIR%\home\sshd

REM Copy OpenSSH daemon configuration file
copy %DISTRIBDIR%\sshd_config       %ROOTDIR%\home\sshd

REM Copy bat file to user's startup directory
copy %DISTRIBDIR%\sshd_start.cmd    %USERPROFILE%\"AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"


