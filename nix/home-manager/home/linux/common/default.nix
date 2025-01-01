{ pkgs, ... }@args:
{
  imports = [
    ./no-fonts.nix
    ../../../fonts
  ];
}
