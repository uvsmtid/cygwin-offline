#!/bin/sh

set -e
set -u

WRONG_DOWNLOAD_DIR_NAME="distrib/http%"
CORRECT_DOWNLOAD_DIR_NAME="distrib/http%3a%2f%2fmirrors.kernel.org%2fsourceware%2fcygwin%2f"

# Fix directory name before archiving.
mv "${WRONG_DOWNLOAD_DIR_NAME}" "${CORRECT_DOWNLOAD_DIR_NAME}"

cd ..

zip -r cygwin-offline.git.zip cygwin-offline.git

cd -

# Fix directory name back after archiving.
mv "${CORRECT_DOWNLOAD_DIR_NAME}" "${WRONG_DOWNLOAD_DIR_NAME}"

