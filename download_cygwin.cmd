@echo off
REM This script provides automatic installation of Cygwin and its components
REM for Interface with ACES (IACES).

REM Hard-code distribution directory instead of making it depend on the 1st param
REM DISTRIBDIR=%1
set DISTRIBDIR=C:\cygwin.distrib

set ROOTDIR=C:\cygwin64

set SITEURL="http://mirrors.kernel.org/sourceware/cygwin/"

REM Show hint for user.
echo Specified distribution directory: %DISTRIBDIR%

echo Specified installation directory: %ROOTDIR%

REM Run the setup providing list of all required components.
REM Note: the `^` character makes `cmd` interpreter concatenate lines.
REM Note: are used as a mere separator.
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
 --download -l %DISTRIBDIR% -R %ROOTDIR% --only-site --site %SITEURL% 

