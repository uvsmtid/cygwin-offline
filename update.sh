#!/bin/sh
###############################################################################
# Run Cygwin installer in quiet mode to download configured packages.
###############################################################################

# Fail on undefined variable.
set -u
# Fail on non-zero exit code.
set -e

# Get absolute path to the script.
# See: http://stackoverflow.com/q/4774054/441652
SCRIPT_DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

"${SCRIPT_DIR_PATH}/scripts/download_setup.sh"

# Compose package list into a single line accepted by `cmd`:
# - Remove comments.
# - Remove empty lines.
# - Remove spaces in non-empty lines (leaving only package name).
# - Convert all newlines into `,`.
# - Remove last `,`.
# NOTE: At the moment it is assumed that package names have no whitespaces.
PACKAGES="$( \
    cat "${SCRIPT_DIR_PATH}/packages.conf" |\
    sed '/^[[:space:]]*#/d' |\
    sed '/^[[:space:]]*$/d' |\
    sed 's/[[:space:]]//g' |\
    tr '\n' ',' |\
    sed 's/,*$//g' \
)"
echo "$PACKAGES" > "${SCRIPT_DIR_PATH}/distrib/packages.line.conf"

# NOTE: We have to jump into the `SCRIPT_DIR_PATH` because
#       `cmd.exe` won't understand leading forward slash `/`
#       as absolute path (it treats it as start of command option).
cd "${SCRIPT_DIR_PATH}"

# NOTE: It's not easy to look at forward slashes `/` in paths
#       when it is supposed to be interpreted by Windows-related software,
#       but it works perfectly here to specify the sript file.
wine cmd.exe /C start /b /i /wait scripts/cygwin_distrib_update.cmd

###############################################################################
# EOF
###############################################################################

