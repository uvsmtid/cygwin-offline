@echo on
REM This script starts OpenSSH daemon for Cygwin


REM Define drive where Cygwin is supposed to be installed
IF DEFINED CYGWIN_DRIVE (
	REM Use drive provieded by %CYGWIN_DRIVE%
) ELSE (
	set CYGWIN_DRIVE=C
)
echo CYGWIN_DRIVE=%CYGWIN_DRIVE%

REM Cygwin root directory is hardcoded/fixed (it's a convention)
IF DEFINED PROGRAMFILES(x86) (
    echo "64 bit"
    set CYGWINSETUPEXE=setup-x86_64.exe
    set CYGWINROOTDIR=%CYGWIN_DRIVE%:\cygwin64
) ELSE (
    echo "32 bit"
    set CYGWINSETUPEXE=setup-x86.exe
    set CYGWINROOTDIR=%CYGWIN_DRIVE%:\cygwin32
    echo "32 bit is not supported"
    EXIT /B 1
)
echo CYGWINSETUPEXE=%CYGWINSETUPEXE%
echo CYGWINROOTDIR=%CYGWINROOTDIR%


REM Show hint for user.
echo Specified installation directory: "%CYGWINROOTDIR%"

REM Show IP configuration
ipconfig

REM Create key if it does not exists
"%CYGWINROOTDIR%\bin\bash.exe" -c "if [ ! -e /home/sshd/ssh_host_dsa_key ] ; then /usr/bin/ssh-keygen -q -N '' -t dsa -f /home/sshd/ssh_host_dsa_key; fi"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

REM Run OpenSSH
"%CYGWINROOTDIR%\bin\bash.exe" -c "/usr/sbin/sshd -f /home/sshd/sshd_config"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

