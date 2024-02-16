{ pkgs, misc, ... }: {
  home.shellAliases = {
    "gpsh" = ''git push -u origin "$(git rev-parse --abbrev-ref HEAD)"'';
    "be" = "bundle exec";
    "gri" = "git rebase -i";
    "v" = "nvim";
    "df" = "df -h";
    "gch" = ''git checkout "$(git recent-branches | fzf | tr -d '[:space:]')"'';
    "gc" = "git commit";
    "fdbg" = "lldb -p $(ps aux | fzf | awk '{print $2}')";
    "fkill" = "kill $(ps aux | fzf | awk '{print $2}')";
    "gco" = "git checkout";
  };
}
