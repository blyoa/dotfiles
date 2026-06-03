{
  pkgs,
  config,
  params,
  ...
}:
{
  xdg.configFile."lazygit/config.yml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${params.appsAbsPath}/lazygit/config.yml";
  };
}
