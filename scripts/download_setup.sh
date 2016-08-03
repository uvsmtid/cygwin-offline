#!/bin/sh
###############################################################################
# Download Cygwin's `setup*.exe` installer, if it does not exists.
###############################################################################

set -e
set -u

# Get absolute path to the script.
# See: http://stackoverflow.com/q/4774054/441652
SCRIPT_DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${SCRIPT_DIR_PATH}/../distrib"

if [ ! -f "setup-x86_64.exe" ]
then
    # NOTE: Checking SSL certificates may fail behind messy proxy.
    wget --no-check-certificate http://www.cygwin.com/setup-x86_64.exe
fi

###############################################################################
# EOF
###############################################################################

