{ pkgs, ... }:

{
  home.packages = with pkgs; [ cargo-expand cargo-outdated rustup ];

  home.file = {
    ".cargo/config.toml".text = ''
      [registries.crates-io]
      protocol = "sparse"

      [build]
      rustc-wrapper = "${pkgs.sccache}/bin/sccache"
    '';
  };

  home.sessionPath = [ "$HOME/.cargo/bin" ];
}
