{
  pkgs,
  inputs,
  params,
  ...
}@args:
{

  imports = [
    ../../common
    ../../../fonts
    ../../../apps/karabiner-elements
  ];

  home.username = "${params.userName}";
  home.homeDirectory = "/Users/${params.userName}";
  home.stateVersion = "24.11";

  targets.darwin = {
    defaults = {
      NSGlobalDomain = {
        InitialKeyRepeat = 25;
        KeyRepeat = 2;
        NSAutomaticPeriodSubstitutionEnabled = false;
      };

      "com.apple.dock" = {
        autohide = true;
        show-recents = false;
        tilesize = 16;

        wvous-bl-corner = 2;
        wvous-br-corner = 14;
      };

      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };

      "com.apple.finder" = {
        AppleShowAllExtensions = true;
        ShowPathBar = true;
      };
    };
  };

  home.packages =
    (with pkgs; [
      darwin.trash
    ])
    ++ params.additionalPackages;
}
