
The commands below allow
offline [Cygwin][1] installation
by pre-packaging it in advance.

## Features ##

*   Simple straightforward workflow.
*   TODO: Automatic setup of SSH service.
*   No dependencies on software external to Windows.
*   Package selection to slim down the distributive. 
*   Support for unattended (automated) installation.
*   Tested using [Wine][3] on Linux. 
*   Automatic detection of 32/64 bit architectures.

## Configure list of selected Cygwin packages ##

NOTE:
The project aims at providing specially built Cygwin distribution.
Currently list of packages is hardcoded inside
[`scripts/cygwin_distrib_update.cmd`][5] script.
For now, it is expected that this repository can be forked and
the script modified (instead of doing nearly the same to modify
example configuration file).

TODO:
Implement support for external configuration file
providing list of selected packages.


## Update Cygwin from Internet ##

```
update.cmd
```

This command will pre-download Cygwin content into [`distrib`][2] directory
and create a zip archive for offline installation by `install.cmd` (above).

The command starts Cygwin setup in _interactive_ mode (with GUI).

TODO:
Add support to run this command in _unattended_ mode as well.

It relies on availability of official Cygwin installers
(depending on the platform architecture used)
placed in the following paths relative to the root of this repository:

```
distrib/setup-x86.exe
distrib/setup-x86_64.exe
```

TODO:
These files can be downloaded automatically by implementing
[`scripts/download_setup.cmd`][4] script.

TODO:
Split `update.cmd` from archiving resposibility - use separate script instead.

## (optional) Archive content into single distributive file ##

```
archive.cmd
```

TODO:
Implement archiving downloaded content. It is currently not done.
See [`scripts/zip_package.cmd`][6] for more info.

## Install Cygwin without Internet connectivity ##

```
install.cmd
```

This command will use pre-downloaded Cygwin content from [`distrib`][2]
directory prepared by `update.cmd` (below) for offline installation.

The command is starts Cygwin setup in _unattendant_ mode (without GUI).

## Run commands using Wine ##

When run on Linux using [Wine][3], use the following commands correspondingly:

```
wine cmd.exe /C update.cmd
wine cmd.exe /C install.cmd
```

---

[1]: https://www.cygwin.com/
[2]: /distrib
[3]: https://www.winehq.org/
[4]: /scripts/download_setup.cmd
[5]: /scripts/cygwin_distrib_update.cmd
[6]: /scripts/zip_package.cmd

