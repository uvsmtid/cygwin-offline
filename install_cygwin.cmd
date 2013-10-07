@echo on
REM This script automatically installs Cygwin and its components.

set CYGWINDISTRIBDIR=C:\cygwin.distrib
set CYGWINROOTDIR=C:\cygwin64
set CYGWINBINDIR=%CYGWINROOTDIR%\bin

set UNIXCYGWINDISTRIBDIR=/cygdrive/c/cygwin.distrib
set UNIXCYGWINROOTDIR=/cygdrive/c/cygwin64

REM Switch into installer directory (to avoid creating logs in the current one)
cd %CYGWINDISTRIBDIR%\installer

set SITEURL="http://mirrors.kernel.org/sourceware/cygwin/"

REM Show hint for user.
echo Specified distribution directory: %CYGWINDISTRIBDIR%
echo Specified installation directory: %CYGWINROOTDIR%

REM Add Cygwin's bin directory to current user's PATH (to make DLL search successful) permanently
REM Try to find if it has already been added before.
echo %PATH% | findstr /I /C:";%CYGWINBINDIR%;" > nul || setx PATH "%PATH%;%CYGWINBINDIR%;"

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
rsync,^
nano,^
 --quiet-mode --local-install ^
 --local-package-dir %CYGWINDISTRIBDIR%\installer -R %CYGWINROOTDIR% --only-site --site %SITEURL%

REM Copy `.vimrc` file to user's home to fix default `vim` installation inconvenient configuration
%CYGWINROOTDIR%\bin\bash.exe -c "/usr/bin/cp -af $UNIXCYGWINDISTRIBDIR/repo/installer/.vimrc ~"

REM Copy `.bashrc` file to user's home to fix default `vim` installation inconvenient configuration
%CYGWINROOTDIR%\bin\bash.exe -c "/usr/bin/cp -af $UNIXCYGWINDISTRIBDIR/repo/installer/.bashrc ~"

REM Install NEL-specific software
%CYGWINROOTDIR%\bin\bash.exe -c "$UNIXCYGWINDISTRIBDIR/repo/installer/install_cygwin_NEL_software.sh"

REM Run OpenSSH server installation script
%CYGWINDISTRIBDIR%\repo\installer\setup_openssh.cmd


