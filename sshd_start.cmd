@echo off
REM This script starts OpenSSH daemon for Cygwin

set ROOTDIR=C:\cygwin64

REM Show hint for user.
echo Specified installation directory: %ROOTDIR%

REM Show IP configuration
ipconfig

REM Create key if it does not exists
%ROOTDIR%\bin\bash.exe -c "if [ ! -e /home/sshd/ssh_host_dsa_key ] ; then /usr/bin/ssh-keygen -q -N '' -t dsa -f /home/sshd/ssh_host_dsa_key; fi"

REM Run OpenSSH
%ROOTDIR%\bin\bash.exe -c "/usr/sbin/sshd -f /home/sshd/sshd_config"

