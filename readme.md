
## Workflow ##

The commands below allow
offline [Cygwin][1] installation
by pre-packaging it in advance.

The workflow is simple:

*   Linux: `update.sh`
*   Linux: `archive.sh`
*   Windows: `install.cmd`

## Features ##

*   Ideal for those who meet Windows only in virtual machines.
*   Download on Linux (using [Wine][3]), deploy on Windows.
*   Simple straightforward workflow.
*   No dependencies on software external to Windows during installation.
*   Support for unattended (automated) installation.
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

It relies on availability of official Cygwin installers
(depending on the platform architecture used)
placed in the following paths relative to the root of this repository:

```
distrib/setup-x86.exe
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
directory prepared by `update.sh` (below) for offline installation.

The command is starts Cygwin setup in _unattendant_ mode (without GUI).

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

---

[1]: https://www.cygwin.com/
[2]: /distrib
[3]: https://www.winehq.org/
[5]: /scripts/cygwin_distrib_update.cmd

