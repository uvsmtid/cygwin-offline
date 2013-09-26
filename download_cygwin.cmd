@echo off
REM This script downloads Cygwin and its components.

set CYGWINDISTRIBDIR=C:\cygwin.distrib
set CYGWINROOTDIR=C:\cygwin64

set SITEURL="http://mirrors.kernel.org/sourceware/cygwin/"

REM Show hint for user.
echo Specified distribution directory: %CYGWINDISTRIBDIR%
echo Specified installation directory: %CYGWINROOTDIR%

REM Run the setup providing list of all required components.
REM Note: the `^` character makes `cmd` interpreter concatenate lines.
%CYGWINDISTRIBDIR%\installer\setup-x86_64.exe --packages ^
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
 --download ^
 --local-package-dir %CYGWINDISTRIBDIR%\installer -R %CYGWINROOTDIR% --only-site --site %SITEURL%

