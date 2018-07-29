{
  pkgs ? (import <nixpkgs> {}),
}:

pkgs.callPackage ./nix-top.nix {}
