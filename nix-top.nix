{ stdenv
, lib
, ruby
, makeWrapper
, getent               # /etc/passwd
, ncurses              # tput
, procps               # ps
, binutils-unwrapped   # strings
, coreutils
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

  ADDITIONAL_PATH = lib.makeBinPath [ getent ncurses binutils-unwrapped coreutils findutils ];

  installPhase = ''
    mkdir -p $out/bin $out/libexec/nix-top
    cp ./nix-top $out/bin/nix-top
    chmod +x $out/bin/nix-top
    wrapProgram $out/bin/nix-top \
      --prefix PATH : "$out/libexec/nix-top:${ADDITIONAL_PATH}"
  '' + stdenv.lib.optionalString stdenv.isDarwin ''
    ln -s /bin/stty $out/libexec/nix-top
  '';
}
