#!/bin/sh

set -u
set -e

scripts/download_setup.sh

wine cmd.exe /C scripts/cygwin_distrib_update.cmd


