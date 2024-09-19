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

  xdg.configFile."latexmk/latexmkrc" = {
    source = config.lib.file.mkOutOfStoreSymlink "${params.appsAbsPath}/latexmk/.latexmkrc";
  };
}
