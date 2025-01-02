{
  pkgs,
  inputs,
  params,
  ...
}:
{
  imports = [
    ../../common
  ];

  home.username = "${params.userName}";
  home.homeDirectory = "/home/${params.userName}";
  home.stateVersion = "24.11";

  home.packages = params.additionalPackages;
}
