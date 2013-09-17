REM This script provides automatic installation of Cygwin and its components
REM for Interface with ACES (IACES).

REM Show hint for user.
echo Specified distribution directory: %1

REM Run the setup providing list of all required components.
%1\setup.exe --packages ^
unzip,^
zip,^
subversion,^
autoconf,^
automake,^
libtool,^
gcc4,^
gcc4-g++,^
gcc,^
gcc-g++,^
gdb,^
libboost,^
make,^
libboost-devel,^
libintl2,^
vim,^
openssh,^
netcat,^
cpio,^
rpm,^
rpm-build,^
rpm-doc,^
wget^
 -q -L -l %1\http%%3a%%2f%%2fmirrors.xmission.com%%2fcygwin%%2f

