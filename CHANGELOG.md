Changelog
=========

v0.2.0
------

> *2018-07-29*

Through a contribution from @LnL7, misc. fixes for Darwin support, and a bit
more correctness in some parts.

 * Use `getent` instead of relying on `/etc/passwd`.
 * Read `env-vars` from build directories instead of requiring elevated privileges.
 * Adds workaround for `stty` on Darwin.


v0.1.0
------

> *2018-07-29*

First release.

Not many features, works with and without privileges.

Quits using q, or ctrl+c. Both cleanly.
