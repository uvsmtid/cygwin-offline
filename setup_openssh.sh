#!/bin/sh

set -x
set -e
set -u

# First parameter is value of %USERPROFILE% (in cmd Windows)
USERPROFILE="$1"
UNIXCYGWINDISTRIBDIR="$(/usr/bin/cygpath -u "$CYGWINDISTRIBDIR")"
UNIXUSERPROFILE="$(/usr/bin/cygpath -u "$USERPROFILE")"

# Create directory for OpenSSH daemon configuration
mkdir -p "/home/sshd"

# Copy OpenSSH daemon configuration file
cp -arf "$UNIXCYGWINDISTRIBDIR"/"repo/installer/sshd/sshd_config"        "/home/sshd"

# Copy bat file to user's startup directory
cp -arf "$UNIXCYGWINDISTRIBDIR"/"repo/installer/sshd/sshd_start.cmd"     "$UNIXUNIXUSERPROFILE"/"AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

