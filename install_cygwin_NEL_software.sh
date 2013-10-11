#!/bin/sh
# This script is supposed to copy NEL software under Cygwin directories
# This normally applies to scripts which are expected to be on
# server and client side for convenience (i.e. NELdata).

set -x
set -e

UNIXCYGWINDISTRIBDIR="$(/usr/bin/cygpath -u "$CYGWINDISTRIBDIR")"

# Create user's directory
mkdir -p "/home/$USERNAME"

# Extract all files by tar to preserve permissions (especially executable)
cd "$UNIXCYGWINDISTRIBDIR"
/usr/bin/tar --overwrite -xvf repo.tar

# Copy generic files to Cygwin filesystem's root
/usr/bin/cp -arf "$UNIXCYGWINDISTRIBDIR/repo/sys/generic"/* /

# Overwrite what was generic by Cygwin-specific files
/usr/bin/cp -arf "$UNIXCYGWINDISTRIBDIR/repo/sys/cygwin"/* /


# Copy `.vimrc` file to user's home to fix default `vim` installation inconvenient configuration
/usr/bin/cp -arf "$UNIXCYGWINDISTRIBDIR/repo/installer"/.vimrc ~

# Copy `.bashrc` file to user's home to fix default `vim` installation inconvenient configuration
/usr/bin/cp -arf "$UNIXCYGWINDISTRIBDIR/repo/installer"/.bashrc ~


# Create directory for temporary files under home
# (needed at least to hide backup files of vim)
/usr/bin/mkdir -p ~/tmp


