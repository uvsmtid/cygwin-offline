#!/bin/sh
# This script simply zips content of the entire
# cygwin.distrib directory into archive under user's home.

UNIXCYGWINDISTRIBDIR="$(/usr/bin/cygpath -u $CYGWINDISTRIBDIR)"
UNIXCYGWINROOTDIR="$(/usr/bin/cygpath -u $CYGWINROOTDIR)"

# Create timestamped archive containing "cygwin.distrib" in home directory
/usr/bin/zip -r ~/"$(/usr/bin/date '+%Y-%m-%d-T%H-%M-%S.%N').cygwin.distrib.zip" "$(/usr/bin/basename $UNIXCYGWINDISTRIBDIR)/"


