{ pkgs, myPkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";
    initExtra = ''
      bindkey -M viins 'jk' vi-cmd-mode
    '';
    profileExtra = ''
      [ -r ~/.nix-profile/etc/profile.d/nix.sh ] && source  ~/.nix-profile/etc/profile.d/nix.sh
      export XCURSOR_PATH=$XCURSOR_PATH:/usr/share/icons:~/.local/share/icons:~/.icons:~/.nix-profile/share/icons
    '';
    envExtra = ''
      # Use homebrew if there to ease the pain
      if [ -x /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi

      if [ -f "$HOME/.env" ]; then
        source "$HOME/.env"
      fi

      source ${myPkgs.chruby}/share/chruby/chruby.sh
    '';
  };
}
