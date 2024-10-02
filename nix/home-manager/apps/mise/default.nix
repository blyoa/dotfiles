{
  config,
  params,
  ...
}:
{
  xdg.configFile."mise/config.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${params.appsAbsPath}/mise/config.toml";
  };
}
