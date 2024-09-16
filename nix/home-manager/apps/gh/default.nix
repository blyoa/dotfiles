{ pkgs, ... }:
{
  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "ssh";
      editor = "vim";
      aliases = {
        co = "pr checkout";
      };
    };

    extensions = with pkgs; [
      gh-poi
    ];
  };

  programs.gh-dash = {
    enable = true;
  };
}
