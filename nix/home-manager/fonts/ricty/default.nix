{ pkgs, ... }:
(pkgs.ricty.overrideAttrs (
  final: prev: {

    patches = [ ./default.nix ];
    patchPhase =
      ''
        patch ./ricty_generator.sh < ${./disable-ricty-discord-generation.patch}
      ''
      + prev.patchPhase;
  }
))
