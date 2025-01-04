{ pkgs, inputs, ... }:
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
      ricty-nerdfont
      roboto
      roboto-serif
    ])
    ++ [
      inputs.gen-shin-gothic.packages.${pkgs.system}.default
      inputs.gen-jyuu-gothic.packages.${pkgs.system}.default
    ];
}
