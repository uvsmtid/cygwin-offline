#!/bin/sh

set -e
set -u
set -x

WRONG_DOWNLOAD_DIR_NAME="distrib/http%"
CORRECT_DOWNLOAD_DIR_NAME="distrib/http%3a%2f%2fmirrors.kernel.org%2fsourceware%2fcygwin%2f"

CURRENT_DIR_NAME="cygwin-offline.git"

# Get version of Cygwin.
# See: http://stackoverflow.com/q/38675362/441652
CYGWIN_FILE_NAME="$(ls "${WRONG_DOWNLOAD_DIR_NAME}/x86_64/release/cygwin/"cygwin-*.tar.xz)"
CYGWIN_VERSION="$(echo "${CYGWIN_FILE_NAME}" | sed "s|^${WRONG_DOWNLOAD_DIR_NAME}/x86_64/release/cygwin/cygwin-\([[:digit:].]*\)-[[:digit:]]*\.tar\.xz$|\1|g")"

# Fail if `CYGWIN_VERSION` does not represent list of numbers and dots.
echo "${CYGWIN_VERSION}" | grep '^[[:digit:].][[:digit:].]*$'

REPO_VERSION="$(git describe --long --dirty)"

# Fix directory name before archiving.
mv "${WRONG_DOWNLOAD_DIR_NAME}" "${CORRECT_DOWNLOAD_DIR_NAME}"

cd ..

zip -r "${CURRENT_DIR_NAME}-${REPO_VERSION}.cygwin-v${CYGWIN_VERSION}.zip" "${CURRENT_DIR_NAME}"

cd -

# Fix directory name back after archiving.
mv "${CORRECT_DOWNLOAD_DIR_NAME}" "${WRONG_DOWNLOAD_DIR_NAME}"

