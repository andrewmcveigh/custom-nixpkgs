 { system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // self);


  self = {
    spotify = callPackage ./pkgs/applications/audio/spotify { };
  };
in self
