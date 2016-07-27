#!/bin/sh

set -e
set -u

cd distrib

if [ ! -f "setup-x86_64.exe" ]
then
    wget https://www.cygwin.com/setup-x86_64.exe
fi

