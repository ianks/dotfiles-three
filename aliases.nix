{ pkgs, misc, ... }: {
  home.shellAliases = {
    "apply-macbook" = "nix run --impure home-manager/master -- -b bak switch --flake .#ianks@macbook";
    "gpsh" = "git push";
    "be" = "bundle exec";
    "gri" = "git rebase -i";
    "v" = "nvim";
    "df" = "df -h";
    "gch" = "git checkout \"$(git recent-branches | fzf | tr -d '[:space:]')\"";
  };
}