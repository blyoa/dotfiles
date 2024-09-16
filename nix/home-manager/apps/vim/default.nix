{ config, params, ... }:
{
  home.file.".vimrc" = {
    source = config.lib.file.mkOutOfStoreSymlink "${params.appsAbsPath}/vim/.vimrc";
  };
}
