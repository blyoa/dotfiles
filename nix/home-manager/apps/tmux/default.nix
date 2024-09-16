{
  pkgs,
  config,
  params,
  ...
}:
{
  home.packages = [
    pkgs.tmux
  ];

  xdg.configFile."tmux/tmux.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink "${params.appsAbsPath}/tmux/.tmux.conf";
  };
}
