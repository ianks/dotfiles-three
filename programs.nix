{ pkgs, misc, ... }:
let
  catppuccinIterm2 = builtins.fetchGit {
    url = "https://github.com/catppuccin/iterm";
    ref = "main";
    rev = "c51f1815f49e43a26b335dcc70ddd667a87671a6";
  };
  astroNvimConf = builtins.fetchGit {
    url = "https://github.com/AstroNvim/AstroNvim";
    ref = "refs/tags/v3.43.3";
  };
  neovimConfRepo = builtins.fetchGit {
    url = "https://github.com/ianks/astronvim_config.git";
    ref = "main";
    rev = "d3d084c94dca581cb9986121631b10686441c80f";
  };
in {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      container.disabled = true;
      package.disabled = true;
      python.disabled = true;
      docker_context.disabled = true;
    };
  };
  programs.jq = { enable = true; };
  programs.zoxide = { enable = true; };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";
    initExtra = ''
      bindkey -M viins 'jk' vi-cmd-mode
    '';
  };
  programs.direnv.enable = true;
  programs.dircolors.enable = true;
  programs.fzf.enable = true;
  programs.ripgrep.enable = true;
  programs.bat.enable = true;
  programs.gh.enable = true;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  home.file.".config/nvim" = {
    source = astroNvimConf;
    recursive = true;
  };
  home.file.".config/nvim/lua/user" = {
    source = neovimConfRepo;
    recursive = true;
  };
  home.file.".config/iterm2/colors" = {
    source = catppuccinIterm2;
    recursive = true;
  };
  home.file.".editrc" = {
    text = ''
      bind -v
      bind "^R" em-inc-search-prev
      bind \\t rl_complete
      lldb:bind \\t lldb_complete
    '';
  };
  home.file.".lldbinit" = {
    text = ''
      settings set target.x86-disassembly-flavor intel
      settings set use-color 1
      settings set stop-line-count-after 20
      settings set stop-line-count-before 20
    '';
  };
  home.file.".gdbinit" = {
    text = ''
      set disassembly-flavor intel
      set follow-fork-mode child
      set history save on
      set history size unlimited
      set history filename ~/.gdb_history
      set listsize 20
      set print pretty
    '';
  };
  programs.htop.enable = true;
  programs.gh.settings = { enableNotifications = false; };
  programs.git = {
    enable = true;
    aliases = {
      pushall = "!git remote | xargs -L1 git push --all";
      graph = "log --decorate --oneline --graph";
      add-nowhitespace =
        "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
      recent-branches =
        "!git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'";
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
    delta = { enable = true; };
  };
}
