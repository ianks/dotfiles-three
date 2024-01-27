{ pkgs, misc, ... }: {
  home.username = "ianks";
  home.homeDirectory = "/Users/ianks";
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
      feature.manyFiles = true;
      init.defaultBranch = "main";
    };
    signing = {
      key = "CEFDD2E5BED4E122";
      signByDefault = true;
    };
    lfs.enable = true;
    ignores = [ ".direnv" "result" ];
  };
}
