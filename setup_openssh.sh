#!/bin/sh

set -x
set -e

UNIXCYGWINDISTRIBDIR="$(/usr/bin/cygpath -u "$CYGWINDISTRIBDIR")"
UNIXCYGWINROOTDIR="$(/usr/bin/cygpath -u "$CYGWINROOTDIR")"
UNIXUSERPROFILE="$(/usr/bin/cygpath -u "$USERPROFILE")"

# Create directory for OpenSSH daemon configuration
mkdir -p "$UNIXCYGWINROOTDIR/home/sshd"

# Copy OpenSSH daemon configuration file
cp -arf "$UNIXCYGWINDISTRIBDIR/repo/installer/sshd/sshd_config"        "$UNIXCYGWINROOTDIR/home/sshd"

# Copy bat file to user's startup directory
cp -arf "$UNIXCYGWINDISTRIBDIR/repo/installer/sshd/sshd_start.cmd"     "$UNIXCYGWINROOTDIR"/"AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

