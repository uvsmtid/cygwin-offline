#!/bin/sh
# This script is supposed to copy NEL software under Cygwin directories
# This normally applies to scripts which are expected to by on
# server and client side for convenience (i.e. NELdata).

UNIXCYGWINDISTRIBDIR="/cygdrive/c/cygwin.distrib"
UNIXCYGWINROOTDIR="/cygdrive/c/cygwin64"


# Extract all files by tar to preserve permissions (especially executable)
cd $UNIXCYGWINDISTRIBDIR
/usr/bin/tar -xvf repo.tar

# Copy generic files to Cygwin filesystem's root
/usr/bin/cp -arf "$UNIXCYGWINDISTRIBDIR/repo/sys/generic"/* /

# Overwrite what was generic by Cygwin-specific files
/usr/bin/cp -arf "$UNIXCYGWINDISTRIBDIR/repo/sys/cygwin"/* /


