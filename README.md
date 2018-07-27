`nix-top`
=========

This is a script to help users figure out what's building.

Usage:

```
 $ nix-env -if .
 $ nix-top --help
Usage: nix-top [options]
   -d, --delay [seconds]            In seconds (default: 0.5)
   -1, --once                       Only run once (generates one screen)

```

### Privilege

If this script has enough privileges to read the `nixbld` user's processes
informations under `/proc/`, it will show the out path.

If it doesn't, it will make assumptions based on the contents of `/tmp`.
