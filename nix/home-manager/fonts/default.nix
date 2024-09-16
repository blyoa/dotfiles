{ pkgs, ... }:
let
  ricty = import ./ricty { inherit pkgs; };
in
{
  home.packages = with pkgs; [
    inconsolata
    (noto-fonts.override {
      variants = [
        "NotoSans"
        "NotoSerif"
      ];
    })
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    ricty
    roboto
    roboto-serif
  ];
}
