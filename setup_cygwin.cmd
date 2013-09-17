@echo off
REM This script provides automatic installation of Cygwin and its components
REM for Interface with ACES (IACES).

REM Hard-code distribution directory instead of making it depend on the 1st param
REM DISTRIBDIR=%1
set DISTRIBDIR=C:\cygwin.distrib

set MIRRORDIR=http%%3a%%2f%%2fmirrors.kernel.org%%2fsourceware%%2fcygwin%%2f

set ROOTDIR=C:\cygwin64

REM Show hint for user.
echo Specified distribution directory: %DISTRIBDIR%

echo Specified local packages directory: %DISTRIBDIR%\%MIRRORDIR%

REM Run the setup providing list of all required components.
REM Note: the `^` character makes `cmd` interpreter concatenate lines.
%DISTRIBDIR%\setup-x86_64.exe --packages ^
unzip,^
zip,^
subversion,^
gcc,^
gcc-g++,^
gdb,^
make,^
libboost-devel,^
vim,^
openssh,^
nc,^
cpio,^
wget^
 -q -L -l %DISTRIBDIR%\%MIRRORDIR% -R %ROOTDIR%

