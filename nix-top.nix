{ stdenv
, lib
, ruby
, makeWrapper
, procps               # ps
, ncurses              # tput
, binutils-unwrapped   # strings
, findutils
}:

# No gems used, so mkDerivation is fine.
stdenv.mkDerivation rec {
  name = "nix-top-${version}";
  version = "0.1.0";

  src = ./nix-top;
  unpackCmd = "mkdir -p src; cp $curSrc src/nix-top";

  buildInputs = [
    ruby
    makeWrapper
  ];

  ADDITIONAL_PATH = lib.makeBinPath [ncurses procps binutils-unwrapped findutils];
  
  installPhase = ''
    mkdir -p $out/bin/
    cp ./nix-top $out/bin/nix-top
    chmod +x $out/bin/nix-top
    wrapProgram $out/bin/nix-top \
      --prefix PATH : "${ADDITIONAL_PATH}"
  '';
}
