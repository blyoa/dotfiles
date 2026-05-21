{
  config,
  params,
  pkgs,
  ...
}:
{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      dark = true;
      navigate = true;
      line-numbers = true;

      minus-style = "syntax \"#511010\"";
      minus-emph-style = "syntax \"#97423d\"";
      plus-style = "syntax \"#043408\"";
      plus-emph-style = "syntax \"#386c30\"";

      map-styles = "bold purple => \"#8f8f8f\" \"#2e1500\", bold cyan => \"#8f8f8f\" \"#002018\", bold blue => \"#8f8f8f\" \"#2e1500\", bold yellow => \"#8f8f8f\" \"#002018\"";

      file-added-label = "[+]";
      file-copied-label = "[=]";
      file-modified-label = "[*]";
      file-removed-label = "[-]";
      file-renamed-label = "[>]";

      file-style = "yellow";
      file-decoration-style = "blue ol";
      hunk-header-style = "syntax bold";
      hunk-header-decoration-style = "blue ol";
      commit-style = "yellow";
      commit-decoration-style = "ol \"#342300\"";
    };
  };
}
