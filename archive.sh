#!/bin/sh
###############################################################################
# Archive entire directory to create offline Cygwin installer.
###############################################################################

# Fail on undefined variable.
set -u
# Fail on non-zero exit code.
set -e

# Get absolute path to the script.
# See: http://stackoverflow.com/q/4774054/441652
SCRIPT_DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# NOTE: The rest of the code assumes it is running in the directory
#       where this script resides within repository.
cd "${SCRIPT_DIR_PATH}"

# When run under Wine, Cygwin installer does not create directory
# under the same name as expected by the same Cygwin installer run in Windows.
WRONG_DOWNLOAD_DIR_NAME="distrib/http%"
CORRECT_DOWNLOAD_DIR_NAME="distrib/http%3a%2f%2fmirrors.kernel.org%2fsourceware%2fcygwin%2f"

PROJECT_NAME="cygwin-offline.git"
CURRENT_DIR_NAME="$(basename "${SCRIPT_DIR_PATH}")"

# Get version of Cygwin.
# See: http://stackoverflow.com/q/38675362/441652
CYGWIN_FILE_NAME="$(ls "${WRONG_DOWNLOAD_DIR_NAME}/x86_64/release/cygwin/"cygwin-*.tar.xz)"
CYGWIN_VERSION="$(echo "${CYGWIN_FILE_NAME}" | sed "s|^${WRONG_DOWNLOAD_DIR_NAME}/x86_64/release/cygwin/cygwin-\([[:digit:].]*\)-[[:digit:]]*\.tar\.xz$|\1|g")"

# Fail if `CYGWIN_VERSION` does not represent list of numbers and dots.
echo "${CYGWIN_VERSION}" | grep '^[[:digit:].][[:digit:].]*$'

REPO_VERSION="$(git describe --long --dirty)"

# Fix directory name before archiving.
mv "${WRONG_DOWNLOAD_DIR_NAME}" "${CORRECT_DOWNLOAD_DIR_NAME}"

# NOTE: The archived content will be in the parent directory
#       (level up outside the sources for this project).
cd ..
zip -r "${PROJECT_NAME}-${REPO_VERSION}.cygwin-v${CYGWIN_VERSION}.zip" "${CURRENT_DIR_NAME}"
cd -

# Fix directory name back after archiving.
mv "${CORRECT_DOWNLOAD_DIR_NAME}" "${WRONG_DOWNLOAD_DIR_NAME}"

###############################################################################
# EOF
###############################################################################

