{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../apps/git
    ../../apps/tig
  ];

  programs = {
    home-manager.enable = true;
  };

  home.packages =
    (with pkgs; [
      # nix
      nixfmt-rfc-style

      # file operations and search
      bat
      fd
      ripgrep
      tree

      # text processing and data manipulation
      jq
      peco
      yq

      # network
      curl
      httpie
      lftp
      ngrok
      rsync
      socat
      wget

      # git
      gh
      ghq

      # image and media processing, and diagram generation
      exiftool
      ffmpeg
      graphviz
      imagemagick
      librsvg
      libsixel
      plantuml
      qrencode

      # security and encryption
      gnupg
      gopass
      jwt-cli
      openssl

      # compression and archiving
      p7zip
      unar

      # terminal and system utils
      bottom
      tmux
      zsh

      # docker and kubernetes
      hadolint
      kubectl
      kubectx

      # dev services
      aws-sam-cli
      awscli2
      circleci-cli
      google-cloud-sdk

      # AI uools
      ollama
      openai-whisper-cpp

      # other tools
      cmake
      hwatch
      hyperfine
      watchexec
    ])
    ++ [
      inputs.mocword.packages.${pkgs.system}.default
    ];
}
