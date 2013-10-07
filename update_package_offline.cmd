@echo on
REM This updates Cygwin zip package.

set CYGWINROOTDIR=C:\cygwin64
set CYGWINDISTRIBDIR=C:\cygwin.distrib

set UNIXCYGWINDISTRIBDIR=/cygdrive/c/cygwin.distrib
set UNIXCYGWINROOTDIR=/cygdrive/c/cygwin64


REM Show hint for user.
echo Specified installation directory: %CYGWINROOTDIR%
echo Specified distribution directory: %CYGWINDISTRIBDIR%

REM Update each svn directory
cd %CYGWINDISTRIBDIR%\repo
svn update installer
svn update sys

REM Archive all files by tar to preserve permissions (especially executable)
%CYGWINROOTDIR%\bin\bash.exe -c "cd $UNIXCYGWINDISTRIBDIR ; /usr/bin/tar -cvf repo.tar repo"

REM Archive package content into user's home:
%CYGWINROOTDIR%\bin\bash.exe -c "$UNIXCYGWINDISTRIBDIR/repo/installer/zip_cygwin_distrib.sh"

