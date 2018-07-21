{
  pkgs ? (import <nixpkgs> {}),
}:

let
  inherit (pkgs)
    stdenv lib
    makeWrapper
    procps               # ps
    ncurses              # tput
    binutils-unwrapped   # strings
  ;
in
  stdenv.mkDerivation {
    name = "nix-top";
    buildInputs = [
      makeWrapper
    ];
    buildCommand = ''
      mkdir -p $out/bin/
      cp ${./nix-top} $out/bin/nix-top
      chmod +x $out/bin/nix-top
      wrapProgram $out/bin/nix-top \
        --prefix PATH : ${
          lib.makeBinPath [ncurses procps binutils-unwrapped]
        }
    '';
  }
