{ stdenv, config, lib, pkgs }:

with lib;

stdenv.mkDerivation rec {
  name = "kbd-backlight-0.1.0";

  src = ./.;

  buildInputs = [ pkgs.rustc ];

  buildPhase = ''
    rustc kbdlight.rs -o kbdlight
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp kbdlight $out/bin/kbdlight
  '';

}
