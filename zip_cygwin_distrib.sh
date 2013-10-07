#!/bin/sh
# This script simply zips content of the entire
# cygwin.distrib directory into archive under user's home.

set -x

UNIXCYGWINDISTRIBDIR="$(/usr/bin/cygpath -u "$CYGWINDISTRIBDIR")"
UNIXCYGWINROOTDIR="$(/usr/bin/cygpath -u "$CYGWINROOTDIR")"

PACKAGE_NAME="$(/usr/bin/date '+%Y-%m-%d-T%H-%M-%S.%N').cygwin.distrib.zip"

# Create timestamped archive containing "cygwin.distrib" in home directory
/usr/bin/zip -r ~/"$PACKAGE_NAME" "$(/usr/bin/basename "$UNIXCYGWINDISTRIBDIR")"/ 1> /dev/null

# Communicate package name
echo "$PACKAGE_NAME"


