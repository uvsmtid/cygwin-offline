#!/bin/sh

set -u
set -e

scripts/download_setup.sh

# Compose package list into a single line accepted by `cmd`:
# - Remove comments.
# - Remove empty lines.
# - Remove spaces in non-empty lines (leaving only package name).
# - Convert all newlines into `,`.
# - Remove last `,`.
# NOTE: At the moment it is assumed that package names have no whitespaces.
PACKAGES="$( \
    cat packages.conf |\
    sed '/^[[:space:]]*#/d' |\
    sed '/^[[:space:]]*$/d' |\
    sed 's/[[:space:]]//g' |\
    tr '\n' ',' |\
    sed 's/,*$//g' \
)"
echo "$PACKAGES" > distrib/packages.line.conf

wine cmd.exe /C start /b /i /wait scripts/cygwin_distrib_update.cmd


