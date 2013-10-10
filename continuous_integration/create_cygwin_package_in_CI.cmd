@echo on
REM This script updates Cygwin zip package (NEL updates only) inside continuous integration platform (CI).
REM It relies on installed Cygwin on the machine where it is called.
REM It also relies on password-less (public key) authentication with server for uploading/downloading packages.

REM Directory where this script is located
set WORKING_DIR=%~dp0

REM Server's IP address
set NELARCHIVER=10.216.1.30

REM SSH address
set SSH_ADDRESS=package@%NELARCHIVER%

REM File server directory
set REMOTE_DIR=nosync/cygwin

REM Set paths to remote and local base backages
set BASE_REMOTE_PACKAGE=%SSH_ADDRESS%:%REMOTE_DIR%/base.cygwin.distrib.zip
set BASE_LOCAL_PACKAGE=base.cygwin.distrib.zip

REM Define drive where Cygwin is supposed to be installed
IF DEFINED CYGWIN_DRIVE (
	REM Use drive provieded by %CYGWIN_DRIVE%
) ELSE (
	set CYGWIN_DRIVE=C
)
echo CYGWIN_DRIVE=%CYGWIN_DRIVE%

REM Cygwin root directory is hardcoded/fixed (it's a convention)
IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
        set CYGWINSETUPEXE=setup-x86.exe
	set CYGWINROOTDIR=%CYGWIN_DRIVE%:\cygwin32
) ELSE (
	set CYGWINSETUPEXE=setup-x86_64.exe
	set CYGWINROOTDIR=%CYGWIN_DRIVE%:\cygwin64
)
echo CYGWINSETUPEXE=%CYGWINSETUPEXE%
echo CYGWINROOTDIR=%CYGWINROOTDIR%

REM Set Cygwin distributive directory
set CYGWINDISTRIBDIR=%WORKING_DIR%cygwin.distrib

REM Remove existing (possibly residual) Cygwin distributive directory
rmdir /s /q "%CYGWINDISTRIBDIR%"

REM Download base package
"%CYGWINROOTDIR%\bin\bash.exe" -c "cd \"$^(/usr/bin/cygpath -u \"$WORKING_DIR\"^)\" ; /usr/bin/scp \"$BASE_REMOTE_PACKAGE\" \"$BASE_LOCAL_PACKAGE\""

REM Unpack base package
"%CYGWINROOTDIR%\bin\bash.exe" -c "cd \"$^(/usr/bin/cygpath -u \"$WORKING_DIR\"^)\" ; /usr/bin/unzip \"$BASE_LOCAL_PACKAGE\""

REM Run offline updates inside the package
call "%CYGWINDISTRIBDIR%\repo\installer\update_cygwin_distribution_dir_repo_only.cmd"

REM Pack updates and capture the single-line output with archive name
for /f %%i in ('"%CYGWINDISTRIBDIR%\repo\installer\zip_package.cmd"') do set UPDATED_LOCAL_PACKAGE=%%i
echo %UPDATED_LOCAL_PACKAGE%

REM Set remote path for updated package
set UPDATED_REMOTE_PACKAGE=%SSH_ADDRESS%:%REMOTE_DIR%/%UPDATED_LOCAL_PACKAGE%

REM Switch to original directory (where the current script was called)
cd "%WORKING_DIR%"

REM Upload base package automatically and set its permissions to be readable
"%CYGWINROOTDIR%\bin\bash.exe" -c "cd \"$^(/usr/bin/cygpath -u \"$WORKING_DIR\"^)\" ; /usr/bin/scp \"$UPDATED_LOCAL_PACKAGE\" \"$UPDATED_REMOTE_PACKAGE\""

REM Switch to original directory (where the current script was called)
cd "%WORKING_DIR%"


REM Remove base package, updated package and Cygwin distributive directory
del /f /q "%BASE_LOCAL_PACKAGE%"
del /f /q "%UPDATED_LOCAL_PACKAGE%"
rmdir /s /q "%CYGWINDISTRIBDIR%"





