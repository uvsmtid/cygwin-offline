@echo on
REM This script compresses entire Cygwin distributive directory and puts it into Cygwin user's home directory.


REM Call script which defines common variables.
REM "~dp0" is directory of the currently called script.
call "%~dp0common.cmd"


REM Show hint for user.
echo Specified installation directory: "%CYGWINROOTDIR%"
echo Specified distribution directory: "%CYGWINDISTRIBDIR%"

REM Archive package content into user's home:
cd "%CYGWINDISTRIBDIR%\.."
"%CYGWINROOTDIR%\bin\bash.exe" -c "\"$^(/usr/bin/cygpath -u \"$CYGWINDISTRIBDIR\"^)\"/repo/installer/zip_cygwin_distrib.sh"


