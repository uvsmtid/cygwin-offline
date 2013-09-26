@echo off
REM This script automatically installs Cygwin and its components.

set DISTRIBDIR=C:\cygwin.distrib

set ROOTDIR=C:\cygwin64

set SITEURL="http://mirrors.kernel.org/sourceware/cygwin/"

REM Show hint for user.
echo Specified distribution directory: %DISTRIBDIR%
echo Specified installation directory: %ROOTDIR%

REM Run the setup providing list of all required components.
REM Note: the `^` character makes `cmd` interpreter concatenate lines.
%DISTRIBDIR%\setup-x86_64.exe --packages ^
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
 --quiet-mode --local-install ^
 --local-package-dir %DISTRIBDIR% -R %ROOTDIR% --only-site --site %SITEURL% 


REM Add Cygwin's bin directory to PATH (to make DLL search successful)
setx PATH "%PATH%;%ROOTDIR%\bin;"


REM Run OpenSSH server installation script
%DISTRIBDIR%\setup_openssh.cmd
