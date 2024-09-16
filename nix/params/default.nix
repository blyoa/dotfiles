{ ... }:
rec {
  userName = ""; # whoami
  hostName = ""; # scutil --get LocalHostName
  additionalPackages = [ ];

  projectAbsPath = "";
  appsAbsPath = "${projectAbsPath}/nix/home-manager/apps";

  git = {
    userName = "blyoa";
    userEmail = "blyoa@users.noreply.github.com";
  };
}
