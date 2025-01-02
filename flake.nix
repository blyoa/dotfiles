{
  description = "Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mocword = {
      url = "github:blyoa/nix-mocword";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    gen-shin-gothic = {
      url = "github:blyoa/nix-font-gen-shin-gothic";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    gen-jyuu-gothic = {
      url = "github:blyoa/nix-font-gen-jyuu-gothic";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      home-manager,
      nix-darwin,
      ...
    }@inputs:
    let
      params = import ./nix/params { };
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        packages = {
          homeConfigurations.${params.userName} = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            extraSpecialArgs = {
              inherit self inputs params;
            };

            modules =
              if pkgs.stdenv.isDarwin then
                if pkgs.stdenv.isAarch64 then
                  [
                    ./nix/home-manager/home/darwin/aarch64
                  ]
                else
                  [
                    ./nix/home-manager/home/darwin/x86_64
                  ]
              else if pkgs.stdenv.isLinux then
                [
                  ./nix/home-manager/home/linux/common
                ]
              else
                [ ];
          };

          darwinConfigurations.${params.hostName} = nix-darwin.lib.darwinSystem {
            inherit pkgs;
            modules = [ ./nix/system/darwin ];
          };
        };
      }
    );
}
