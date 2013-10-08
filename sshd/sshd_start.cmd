@echo on
REM This script starts OpenSSH daemon for Cygwin


REM Define drive where Cygwin is supposed to be installed
IF DEFINED CYGWIN_DRIVE (
	REM Use drive provieded by %CYGWIN_DRIVE%
) ELSE (
	set CYGWIN_DRIVE=C
)

REM Cygwin root directory is hardcoded/fixed (it's a convention)
IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
        set CYGWINSETUPEXE=setup-x86.exe
	set CYGWINROOTDIR=%CYGWIN_DRIVE%:\cygwin32
) ELSE (
	set CYGWINSETUPEXE=setup-x86_64.exe
	set CYGWINROOTDIR=%CYGWIN_DRIVE%:\cygwin64
)


REM Show hint for user.
echo Specified installation directory: "%CYGWINROOTDIR%"

REM Show IP configuration
ipconfig

REM Create key if it does not exists
"%CYGWINROOTDIR%\bin\bash.exe" -c "if [ ! -e /home/sshd/ssh_host_dsa_key ] ; then /usr/bin/ssh-keygen -q -N '' -t dsa -f /home/sshd/ssh_host_dsa_key; fi"

REM Run OpenSSH
"%CYGWINROOTDIR%\bin\bash.exe" -c "/usr/sbin/sshd -f /home/sshd/sshd_config"

