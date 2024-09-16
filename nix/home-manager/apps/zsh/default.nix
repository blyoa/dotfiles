{
  pkgs,
  config,
  params,
  ...
}:
{
  home.packages = [
    pkgs.zsh
  ];

  home.file.".zshrc" = {
    source = config.lib.file.mkOutOfStoreSymlink "${params.appsAbsPath}/zsh/.zshrc";
  };
}
