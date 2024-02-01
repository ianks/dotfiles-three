{ pkgs, misc, ... }: {
  programs.direnv.enable = true;
  programs.starship.enable = true;
  programs.dircolors.enable = true;
  programs.fzf.enable = true;
  programs.starship.settings = {
    container.disabled = true;
    package.disabled = true;
    python.disabled = true;
    docker_context.disabled = true;
  };
  programs.gpg.enable = true;
  programs.zsh.enable = true;
  programs.ripgrep.enable = true;
  programs.bat.enable = true;
  programs.exa.enable = true;
  programs.gh.enable = true;
  programs.neovim.enable = true;
  programs.htop.enable = true;
  programs.gh.settings = {
    enableNotifications = false;
  };
  programs.git = {
    enable = true;
    aliases = {
      pushall = "!git remote | xargs -L1 git push --all";
      graph = "log --decorate --oneline --graph";
      add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
      recent-branches = "!git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'";
      s = "status";
    };
    userName = "Ian Ker-Seymer";
    userEmail = "hello@ianks.com";
    extraConfig = {
      # feature.manyFiles = true;
      init.defaultBranch = "main";
      commit.gpgsign = true;
      gpg.format = "ssh";
      push.autoSetRemote = true;
      pull.rebase = true;
      # You'll need to generate a key and add it to your GitHub account:
      # $ ssh-keygen -t ed25519
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
    lfs.enable = true;
    ignores = [ ".direnv" "result" ];
  };
}
