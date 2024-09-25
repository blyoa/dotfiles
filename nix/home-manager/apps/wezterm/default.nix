{
  config,
  params,
  ...
}:
{
  home.file.".wezterm.lua" = {
    source = config.lib.file.mkOutOfStoreSymlink "${params.appsAbsPath}/wezterm/.wezterm.lua";
  };
}
