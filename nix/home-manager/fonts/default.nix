{ pkgs, inputs, ... }:
let
  ricty = import ./ricty { inherit pkgs; };
  ricty-nerd-fonts = import ./ricty-nerd-fonts { inherit pkgs; };
in
{
  home.packages =
    (with pkgs; [
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
      ricty-nerd-fonts
      roboto
      roboto-serif
    ])
    ++ [
      inputs.gen-shin-gothic.packages.${pkgs.system}.default
    ];
}
