{ stdenv, lib, pkgs }:

with lib;

stdenv.mkDerivation {
  name = "xrandr-auto-0.1.0";

  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    cp $src/xrandr-auto $out/bin/xrandr-auto
  '';

  fixupPhase = ''
    chmod 0700 $out/bin/xrandr-auto
  '';
}
