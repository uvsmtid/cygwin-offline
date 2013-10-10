@echo on
REM This script downloads Cygwin and its components.


REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call "%~dp0common.cmd"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)


REM Show hint for user.
echo Specified distribution directory: "%CYGWINDISTRIBDIR%"
echo Specified installation directory: "%CYGWINROOTDIR%"

REM Set URL to Cygwin online distributive
set SITEURL="http://mirrors.kernel.org/sourceware/cygwin/"

REM Switch into installer directory (to avoid creating logs in the current one)
cd "%CYGWINDISTRIBDIR%\installer"
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

REM Run the setup providing list of all required components.
REM Note: the `^` character makes `cmd` interpreter concatenate lines.
"%CYGWINDISTRIBDIR%\installer\%CYGWINSETUPEXE%" --packages ^
mintty,^
bzip2,^
unzip,^
zip,^
cpio,^
subversion,^
gcc,^
gcc-g++,^
gdb,^
make,^
libboost,^
libboost-devel,^
openssh,^
rsh,^
vim,^
nc,^
wget,^
git,^
git-svn,^
gitk,^
git-gui,^
perl,^
python,^
tcl-tk,^
xinit,^
xorg-server,^
xhost,^
xeyes,^
xterm,^
rsync,^
nano,^
libintl8,^
libiconv2,^
libncursesw10,^
tree,^
 --download ^
 --local-package-dir "%CYGWINDISTRIBDIR%\installer" ^
 -R "%CYGWINROOTDIR%" ^
 --only-site ^
 --site %SITEURL%
IF NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)


REM Switch to original directory (where the current script was called)
cd "%~dp0"
F NOT %errorlevel%==0 (
    echo "Command returned: " %errorlevel%
    EXIT /B 1
)

