#!/bin/sh
###############################################################################
# Run Cygwin installer in GUI mode to browse available packages.
###############################################################################

# Fail on undefined variable.
set -u
# Fail on non-zero exit code.
set -e

# Get absolute path to the script.
# See: http://stackoverflow.com/q/4774054/441652
SCRIPT_DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

"${SCRIPT_DIR_PATH}/scripts/download_setup.sh"

# NOTE: We have to jump into the `SCRIPT_DIR_PATH` because
#       `cmd.exe` won't understand leading forward slash `/`
#       as absolute path (it treats it as start of command option).
cd "${SCRIPT_DIR_PATH}"

# NOTE: It's not easy to look at forward slashes `/` in paths
#       when it is supposed to be interpreted by Windows-related software,
#       but it works perfectly here to specify the sript file.
wine cmd.exe /C "scripts/cygwin_distrib_packages.cmd"

###############################################################################
# EOF
###############################################################################

