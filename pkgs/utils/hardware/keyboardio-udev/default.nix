{ stdenv, config, lib, pkgs }:

with lib;

stdenv.mkDerivation rec {
  name = "keyboardio-udev-0.1.0";

  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    cp keyboardio-udev $out/bin/keyboardio-udev
  '';

}
