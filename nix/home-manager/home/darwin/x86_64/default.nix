{ pkgs, ... }:
{
  imports = [ ../common ];

  nixpkgs.overlays = [
    (final: prev: rec {
      python3 = prev.python3.override {
        packageOverrides = self: super: {
          watchdog = super.watchdog.overridePythonAttrs (oldAttrs: {
            # Enable watchdog.observers.fsevents, which prevents UserWarning by fallback to
            # kqueue from causing aws-sam-cli tests to fail
            patches = [ ];
            stdenv = prev.overrideSDK prev.stdenv "11.0";
          });
        };
      };
      python3Packages = python3.pkgs;
    })
  ];
}
