{ pkgs, ... }:
(pkgs.ricty.overrideAttrs (
  final: prev: {

    patches = [ ./default.nix ];
    patchPhase =
      ''
        patch ./ricty_generator.sh < ${./disable-ricty-discord-generation.patch}
      ''
      + prev.patchPhase;

    buildInputs = prev.buildInputs ++ [
      pkgs.python312Packages.fonttools
    ];

    buildPhase =
      prev.buildPhase
      + ''
        ttx -t 'OS/2' Ricty-*.ttf
        for f in Ricty-*.ttx; do
          sed -i 's/^\(\s\+<xAvgCharWidth\s\+value="\)[0-9]\+\(".*\)$/\1500\2/g' "$f"
          mv "''${f%.ttx}.ttf" "''${f%.ttx}-orig.ttf"
          ttx -m "''${f%.ttx}-orig.ttf" "$f" -o "''${f%.ttx}.ttf" 
        done
        rm *-orig.ttf
      '';
  }
))
