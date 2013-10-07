@echo on
REM This script starts OpenSSH daemon for Cygwin


REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call %~dp0common.cmd


REM Show hint for user.
echo Specified installation directory: %CYGWINROOTDIR%

REM Show IP configuration
ipconfig

REM Create key if it does not exists
%CYGWINROOTDIR%\bin\bash.exe -c "if [ ! -e /home/sshd/ssh_host_dsa_key ] ; then /usr/bin/ssh-keygen -q -N '' -t dsa -f /home/sshd/ssh_host_dsa_key; fi"

REM Run OpenSSH
%CYGWINROOTDIR%\bin\bash.exe -c "/usr/sbin/sshd -f /home/sshd/sshd_config"

