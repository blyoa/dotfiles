{ config, params, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = params.git.userName;
    userEmail = params.git.userEmail;

    extraConfig = {
      init = {
        defaultBranch = "main";
      };

      core = {
        autocrlf = false;
        editor = "vim";
        excludesFile = "${./.gitignore_global}";
        precomposeunicode = true;
      };

      commit = {
        verbose = true;
      };

      diff = {
        algorithm = "histogram";
      };

      push = {
        useForceIfIncludes = true;
      };

      url = {
        "git@github.com:".insteadOf = "https://github.com/";
      };

      ghq = {
        root = [
          "~/Dropbox/sync/github"
          "~/develop/repos"
        ];
      };
    };
  };
}