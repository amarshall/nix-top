`nix-top`
=========

This is a WIP script to help users figure out what's building.

Usage:

```
 nix-env -if .
 sudo nix-top
```

This script needs enough privileges to read the `nixbld` user's processes
informations under `/proc/`, which is why `sudo` may be required.

