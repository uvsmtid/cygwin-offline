@echo off
REM This script starts OpenSSH daemon for Cygwin

set ROOTDIR=C:\cygwin64

REM Show hint for user.
echo Specified installation directory: %ROOTDIR%

ipconfig

%ROOTDIR%\bin\bash.exe -C "/usr/sbin/sshd -f /home/sshd/sshd_config"

