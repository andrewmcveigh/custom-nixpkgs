 { system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // self);

  self = {
    spotify        = callPackage ./pkgs/applications/audio/spotify { };
    riot           = callPackage ./pkgs/applications/messaging/riot-electron-nix { };
    xmonadConfig   = callPackage ./pkgs/config/desktop/xmonad { };
    lock           = callPackage ./pkgs/utils/screen/lock { };
    kbdbacklight   = callPackage ./pkgs/utils/hardware/kbd-backlight { };
    xrandrAuto     = callPackage ./pkgs/utils/hardware/xrandr-auto { };
    keyboardioUdev = callPackage ./pkgs/utils/hardware/keyboardio-udev { };
  };
in self
