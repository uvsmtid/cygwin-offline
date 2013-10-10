#!/bin/sh
# This script simply zips content of the entire
# cygwin.distrib directory saving package outside of it.

set -e
set -x

UNIXCYGWINDISTRIBDIR="$(/usr/bin/cygpath -u "$CYGWINDISTRIBDIR")"

PACKAGE_NAME="$(/usr/bin/date '+%Y-%m-%d-T%H-%M-%S.%N').cygwin.distrib.zip"

# Create timestamped archive containing "cygwin.distrib" in home directory
/usr/bin/zip -r "$UNIXCYGWINDISTRIBDIR/../$PACKAGE_NAME" "$(/usr/bin/basename "$UNIXCYGWINDISTRIBDIR")"/ 1> /dev/null

# Communicate package name
echo "$PACKAGE_NAME"


