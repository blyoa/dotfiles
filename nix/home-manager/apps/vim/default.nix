{
  pkgs,
  config,
  params,
  ...
}:
{
  home.file.".vimrc" = {
    source = config.lib.file.mkOutOfStoreSymlink "${params.appsAbsPath}/vim/.vimrc";
  };

  home.file.".vim/bundle/vim-plug/autoload/" = {
    source = pkgs.fetchFromGitHub {
      owner = "junegunn";
      repo = "vim-plug";
      rev = "0.14.0";
      hash = "sha256-d8LZYiJzAOtWGIXUJ7788SnJj44nhdZB0mT5QW3itAY=";
    };
  };
}
