# azure-cli-nix

Nixpkgs overlay for azure-cli 2.0 (i.e. the Python one).

This overlay has all the dependencies for `azure-cli` python module.  It aims
to not override packages of the main package tree, derivations the need updates
are kept internal to omit mass rebuilds.
