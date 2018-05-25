{ stdenv, config, pkgs }:

stdenv.mkDerivation rec {

  name = "xmonad-config-0.1.0";

  src = ./.;

  buildInputs = [ pkgs.haskellPackages.xmobar
                  pkgs.haskellPackages.xmonad
                ];

  installPhase = ''
    mkdir -p $out/tmp
    config_dir=/home/andrewmcveigh/.xmonad
    mkdir -p $config_dir
    cp $config_dir/xmonad.hs $out/tmp/xmonad.hs
    cp xmonad.hs $config_dir/
    if ! xmonad --recompile
      cp $out/tmp/xmonad.hs $config_dir/xmonad.hs
      exit 1
    fi
  '';
}
