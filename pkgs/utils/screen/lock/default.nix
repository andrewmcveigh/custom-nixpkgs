{ stdenv, lib, pkgs }:

with lib;

stdenv.mkDerivation {
  name = "lock-0.1.0";

  src = ./.;

  buildInputs = [ pkgs.slock pkgs.psmisc ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src/lock.sh $out/bin/lock
  '';

  fixupPhase = ''
    chmod +x $out/bin/lock
  '';
}
