{
  config,
  params,
  pkgs,
  ...
}:
let
  fzf-git-switch = pkgs.writeShellApplication {
    name = "fzf-git-switch";
    runtimeInputs = with pkgs; [
      coreutils
      fzf
      gawk
      gnugrep
      gnused
    ];

    text = ''
      branch_exists() {
        local ref="$1"
        git show-ref --quiet --verify "$ref"
      }

      is_remote_branch() {
        local branch="$1"
        branch_exists "refs/remotes/$branch"
      }

      parse_remote_branch() {
        local branch="$1"
        local remotes
        mapfile -t remotes < <(git remote | awk '{print length, $0}' | sort -rn | cut -d' ' -f2-)

        for remote in "''${remotes[@]}"; do
          local prefix="''${remote}/"
          if [[ "$branch" == "$prefix"* ]]; then
            local candidate="''${branch#"$prefix"}"
            if branch_exists "refs/remotes/$remote/$candidate"; then
              echo "$candidate"
              return 0
            fi
          fi
        done

        echo "$branch"
      }

      switch_to_branch() {
        local target="$1"
        shift

        if is_remote_branch "$target"; then
          echo "Switching to ''${target} in DETACHED mode"
          git switch --detach "$target" "$@"
        else
          git switch "$target" "$@"
        fi
      }

      select_branch_with_fzf() {
        local excluded_branches
        mapfile -t excluded_branches < <(
          git worktree list --porcelain \
            | grep "^branch " \
            | sed "s/^branch //" || true
        )

        local selected_branch
        selected_branch=$(
          git for-each-ref --format="%(refname)" refs/heads/ refs/remotes/ \
            | grep -v -E "^refs/remotes/.*/HEAD$" \
            | grep -v -F -x -f <(printf "%s\n" "''${excluded_branches[@]}") \
            | sed -E "s#^refs/(heads|remotes)/##" \
            | fzf --reverse --height 20% --exit-0 \
                --preview "git log --oneline --graph --color=always --decorate {1}" \
                --preview-window=right:50%
        )

        echo "$selected_branch"
      }

      switch_with_fzf() {
        local selected_branch
        selected_branch=$(select_branch_with_fzf)

        if [ -z "''${selected_branch:-}" ]; then
          exit 0
        fi

        local branch_name
        branch_name=$(parse_remote_branch "$selected_branch")

        if is_remote_branch "$selected_branch"; then
          echo "Switching to ''${selected_branch} in DETACHED mode"
          git switch --detach "$selected_branch" "$@"
        else
          git switch "$branch_name" "$@"
        fi
      }

      main() {
        if [ $# -gt 0 ]; then
          switch_to_branch "$@"
        else
          switch_with_fzf "$@"
        fi
      }

      main "$@"
    '';
  };
  fzf-git-rebase-branch = pkgs.writeShellApplication {
    name = "fzf-git-rebase-branch";
    runtimeInputs = with pkgs; [
      fzf
      gnugrep
      gnused
    ];
    text = ''
      if [ $# -gt 0 ]; then
        exec git rebase "$@"
      fi

      current_branch=$(git branch --show-current)
      selected_branch=$(git for-each-ref --format="%(refname)" refs/heads/ refs/remotes/ \
        | grep -v -E "^refs/remotes/.*/HEAD$" \
        | grep -v -E "^$current_branch$" \
        | sed -E "s#refs/(heads|remotes)/##" \
        | fzf --reverse --height 20% --exit-0 --preview "git log --oneline --graph --color=always --decorate {1}" --preview-window=right:50%)
      if [ -n "$selected_branch" ]; then
        git rebase "$selected_branch" "$@"
      fi
    '';
  };
  rm-merged-branches = pkgs.writeShellApplication {
    name = "rm-merged-branches";
    runtimeInputs = with pkgs; [
      findutils
      gnugrep
      gnused
    ];
    text = ''
      branches_to_remove=$(git branch --merged | grep -v -E '^(\*|\+)' || true)
      if [ -z "$branches_to_remove" ]; then
        echo "No merged branches to remove."
      else
        xargs git branch -d <<< "$branches_to_remove"
      fi
    '';
  };
in
{
  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user = {
        name = params.git.userName;
        email = params.git.userEmail;
      };

      init = {
        defaultBranch = "main";
      };

      core = {
        autocrlf = false;
        editor = "vim";
        excludesFile = "${./.gitignore_global}";
        ignorecase = false;
        precomposeunicode = true;
        quotePath = false;
      };

      commit = {
        verbose = true;
      };

      diff = {
        algorithm = "histogram";
      };

      fetch = {
        prune = true;
      };

      pull = {
        rebase = true;
      };

      push = {
        useForceIfIncludes = true;
      };

      rebase = {
        autoSquash = true;
        autoStash = true;
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

      extensions = {
        worktreeConfig = true;
      };

      alias = {
        "sw" = "!${fzf-git-switch}/bin/fzf-git-switch";
        "rbb" = "!${fzf-git-rebase-branch}/bin/fzf-git-rebase-branch";
        "rm-merged" = "!${rm-merged-branches}/bin/rm-merged-branches";
      };
    };
  };
}
