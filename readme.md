
This project allows
offline [Cygwin][1] installation on Windows
by pre-downloading it in advance on Linux (using [Wine][3]).

## Features ##

*   Ideal for those who wants to meet Windows only in virtual machines.

    *   Download on Linux.
    *   Deploy on Windows.

*   Simple straightforward workflow.

    *   Linux: `packages.sh` (optional)
    *   Linux: `update.sh`
    *   Linux: `archive.sh` (optional)
    *   Windows: `install.cmd`

*   No dependencies on software external to Windows during installation.
*   Support for unattended (non-interactive) installation.
*   Support only for 64 bit Linux/Windows versions.

## Configure list of selected Cygwin packages ##

Modify list of packages for download:

```
packages.conf
```

The names of available packages to select from can be found in `Packages`
column during selection of packages in Cygwin installer run with GUI.
Script `packages.sh` starts Cygwin installer with GUI exactly for
the purpose of reviewing available packages to list them in `packages.conf`:

```
packages.sh
```

NOTE:
Script `install.cmd` will install list of packages specified
_before_ `update.sh` is run rather than consulting `pakcages.conf` again
(the list used is cached in `distrib/packages.line.conf` file).
See also comments in [`packages.conf`][6].

## Update Cygwin content from Internet on Linux ##

```
update.sh
```

This command will pre-download Cygwin content under [`distrib`][2] directory.

The command starts Cygwin setup in _unattended_ mode (without GUI)
and downloads all packages (with their dependencies)
listed in [`packages.conf`][6] file.

It also automatically downloads official Cygwin installer
placed in the following path relative to the root of this repository:

```
distrib/setup-x86_64.exe
```

## Archive Cygwin content into single distributive file on Linux ##

```
archive.sh
```

This script will archive entire content of this directory
with root of the archive matching root of this repository.

## Install Cygwin without Internet connectivity on Windows ##

```
install.cmd
```

This command will use pre-downloaded Cygwin content from [`distrib`][2]
directory prepared by `update.sh` for offline installation.

The command is starts Cygwin setup in _unattendant_ mode
and installs everything (without GUI).

## Run commands on Linux using Wine ##

When run on Linux, [Wine][3] is used.

Install Wine, for example on Fedora 24:

```
sudo dnf install -y wine
```

## Pre-downloading packages via proxy ##

It is also possible to perform download via proxy server.
Make sure to use right credentials for authentication (if required) -
proxy setup may be selective about allowed content per user.

## Changelog ##

*   `v1.0.0`

    *   Make list of packages configurable in [`packages.conf`][6] file.

    *   Fixed hang (due to command line switch into interactive mode)
        at the end of the installation if `cmd /wait install.cmd` is used.

    *   Tag archived package using the following format:

        ```
        cygwin-offline.git-v[REPO_TAG]-[COMMITS_SINCE_TAG]-g[GIT_COMMIT_HASH]-[dirty].cygwin-v[CYGWIN_VERSION.zip
        ```

        For example:

        ```
        cygwin-offline.git-v0.0.0-11-g9127328-dirty.cygwin-v2.5.2.zip
        cygwin-offline.git-v0.0.0-11-g9127328.cygwin-v2.5.2.zip
        ```

    *   Split unattended and interactive mode of Cygwin setup
        into `packages.sh` and `update.sh` scripts.

    *   Clean up directories from obsolete and unsopported scripts.


*   `v0.0.0`

    Initial version after spin-off.

    It worked for download-install cycle.

    It was tested on clean Windows 2012 R2 in
    [`windows-server-2012-R2-gui`][4] Vagrant box.

---

[1]: https://www.cygwin.com/
[2]: /distrib
[3]: https://www.winehq.org/
[4]: https://github.com/uvsmtid/vagrant-boxes/tree/develop/windows-server-2012-R2-gui
[5]: /scripts/cygwin_distrib_update.cmd
[6]: /packages.conf


