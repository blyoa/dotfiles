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
  ];

  patchPhase = ''
    patchShebangs --build ./font-patcher
  '';

  buildPhase = ''
    cp ${ricty}/share/fonts/truetype/ricty/Ricty-*.ttf .

    for f in Ricty-*.ttf; do
      echo 'patch to' $f
      ./font-patcher -c $f -out dist/;
    done;
  '';

  installPhase = ''
    runHook preInstall

    install -m644 -D --target $out/share/fonts/truetype/ricty-nerd dist/*.ttf

    runHook postInstall
  '';
}
