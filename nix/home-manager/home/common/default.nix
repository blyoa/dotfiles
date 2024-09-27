{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../apps/gh
    ../../apps/git
    ../../apps/latexmk
    ../../apps/tig
    ../../apps/tmux
    ../../apps/vim
    ../../apps/wezterm
    ../../apps/zsh
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
      fzf
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
      age
      gnupg
      gopass
      jwt-cli
      openssl
      sops

      # compression and archiving
      p7zip
      unar

      # terminal and system utils
      bottom

      # docker and kubernetes
      hadolint
      kubectl
      kubectx

      # dev services
      aws-sam-cli
      awscli2
      circleci-cli
      (google-cloud-sdk.withExtraComponents (
        with google-cloud-sdk.components;
        [
          gke-gcloud-auth-plugin
          pubsub-emulator
        ]
      ))

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
