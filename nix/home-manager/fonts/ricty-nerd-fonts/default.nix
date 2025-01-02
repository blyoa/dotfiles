{ pkgs, ... }:
let
  ricty = import ../ricty { inherit pkgs; };
in
pkgs.stdenvNoCC.mkDerivation rec {
  pname = "ricty-nerd-fonts";
  version = "3.2.1";

  src = pkgs.fetchzip {
    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/FontPatcher.zip";
    hash = "sha256-3s0vcRiNA/pQrViYMwU2nnkLUNUcqXja/jTWO49x3BU=";
    stripRoot = false;
  };

  nativeBuildInputs = with pkgs; [
    fontforge
    python3
    python312Packages.fontforge
    python312Packages.fonttools
  ];

  patchPhase = ''
    patchShebangs --build ./font-patcher
  '';

  buildPhase = ''
    cp ${ricty}/share/fonts/truetype/ricty/Ricty-*.ttf .

    for f in Ricty-*.ttf; do
      ./font-patcher -c "$f" -out dist/
    done;

    pushd dist/

    ttx -t 'OS/2' Ricty*.ttf
    for f in Ricty*.ttx; do
      sed -i 's/^\(\s\+<xAvgCharWidth\s\+value="\)[0-9]\+\(".*\)$/\1500\2/g' "$f"
      mv "''${f%.ttx}.ttf" "''${f%.ttx}-orig.ttf"
      ttx -m "''${f%.ttx}-orig.ttf" "$f" -o "''${f%.ttx}.ttf" 
    done
    rm *-orig.ttf

    popd
  '';

  installPhase = ''
    runHook preInstall

    install -m644 -D --target $out/share/fonts/truetype/ricty-nerd dist/*.ttf

    runHook postInstall
  '';
}
