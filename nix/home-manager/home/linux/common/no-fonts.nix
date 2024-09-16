{
  pkgs,
  inputs,
  params,
  ...
}:
let
  common = import ../../common { inherit pkgs inputs; };
in
{
  home.username = "${params.userName}";
  home.homeDirectory = "/home/${params.userName}";
  home.stateVersion = "24.11";

  programs = common.programs;

  home.packages = common.home.packages ++ params.additionalPackages;
}
