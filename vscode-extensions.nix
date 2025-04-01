# This file is generated automatically
{ pkgs, ... }:

{
  # programs.vscode.profiles.default.extensions =
  #   with pkgs.vscode-extensions;
  #   [ ]
  #   ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  #     {
  #       name = "path-intellisense";
  #       publisher = "christian-kohler";
  #       version = "2.10.0";
  #       sha256 = "06x9ksl4bghfpxh4n65d1d7dr11spl140p9ch4mc01nrdibgckbc";
  #     }
  #
  #     {
  #       name = "nix";
  #       publisher = "bbenoist";
  #       version = "1.0.1";
  #       sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
  #     }
  #
  #     {
  #       name = "catppuccin-vsc";
  #       publisher = "catppuccin";
  #       version = "3.16.0";
  #       sha256 = "1g4021qrsy67fw2b1lvazn58nvr64dkvpywqanbpz24dlgk2573r";
  #     }
  #
  #     {
  #       name = "prettier-vscode";
  #       publisher = "esbenp";
  #       version = "11.0.0";
  #       sha256 = "1fcz8f4jgnf24kblf8m8nwgzd5pxs2gmrv235cpdgmqz38kf9n54";
  #     }
  #
  #     {
  #       name = "remote-ssh";
  #       publisher = "ms-vscode-remote";
  #       version = "0.117.2025013120";
  #       sha256 = "0n6mf08b7d9swcd0iyk3bsr01rhinavjavdm7r0wdlc7c6b6fqdv";
  #     }
  #
  #     {
  #       name = "vscode-graphql-syntax";
  #       publisher = "graphql";
  #       version = "1.3.8";
  #       sha256 = "0dgd6d1a5hv61zf2ak66ic49vhnmyabkshv4njzv6ws6gy8pck6p";
  #     }
  #
  #     {
  #       name = "byesig";
  #       publisher = "itarato";
  #       version = "0.0.15";
  #       sha256 = "13cy8si22kjmr1yc125dqd1jyjsql5ms4qyfnkph1f8ijd7gpivr";
  #     }
  #
  #     {
  #       name = "vscode-github-actions";
  #       publisher = "github";
  #       version = "0.27.1";
  #       sha256 = "0pq97nl5h170r5cwsvps9z059lvj7a9aik2w84fnn3mjficrlwlq";
  #     }
  #
  #     {
  #       name = "vscode-rdbg";
  #       publisher = "koichisasada";
  #       version = "0.2.2";
  #       sha256 = "1dzbngaqw5fahhf0nyjljrk9k8ddn4iklclihwrc1a0yq9l339ca";
  #     }
  #
  #     {
  #       name = "nix-ide";
  #       publisher = "jnoortheen";
  #       version = "0.4.11";
  #       sha256 = "0z6fl9r124swz7d7231yylabbb967i7dh55j3fqzm96wwyrvirv7";
  #     }
  #
  #     {
  #       name = "nix-env-selector";
  #       publisher = "arrterian";
  #       version = "1.0.11";
  #       sha256 = "113zx78c3219knw4qa04242404n32vnk9rb6a3ynz41dgwh1mbbl";
  #     }
  #
  #     {
  #       name = "catppuccin-vsc-icons";
  #       publisher = "catppuccin";
  #       version = "1.17.0";
  #       sha256 = "1w4x7xnq8d4dkjbrgajpvd2imllzp39cwxfggx0ykbadaq70h809";
  #     }
  #
  #     {
  #       name = "codespaces";
  #       publisher = "github";
  #       version = "1.17.3";
  #       sha256 = "1g4b7gd24cifmh62v1dj1b79yp5z6jbffmwh2nlymjbqf9h4bll9";
  #     }
  #
  #     {
  #       name = "direnv";
  #       publisher = "mkhl";
  #       version = "0.17.0";
  #       sha256 = "1n2qdd1rspy6ar03yw7g7zy3yjg9j1xb5xa4v2q12b0y6dymrhgn";
  #     }
  #
  #     {
  #       name = "vscode-docker";
  #       publisher = "ms-azuretools";
  #       version = "1.29.4";
  #       sha256 = "1nhrp43gh4pwsdy0d8prndx2l0mrczf1kirjl1figrmhcp7h4q4g";
  #     }
  #
  #     {
  #       name = "rainbow-csv";
  #       publisher = "mechatroner";
  #       version = "3.16.0";
  #       sha256 = "1inxa4j46x0x6s1gws7slh887lib5z88l1qip55f40mcryvwq2ll";
  #     }
  #
  #     {
  #       name = "vscode-remote-extensionpack";
  #       publisher = "ms-vscode-remote";
  #       version = "0.26.0";
  #       sha256 = "0xjld7p1zg9zybcw47xzrikgyc3hp9lfk6vbrm0syba8n90k8jk1";
  #     }
  #
  #     {
  #       name = "remote-ssh";
  #       publisher = "ms-vscode-remote";
  #       version = "0.117.2025013120";
  #       sha256 = "0n6mf08b7d9swcd0iyk3bsr01rhinavjavdm7r0wdlc7c6b6fqdv";
  #     }
  #
  #     {
  #       name = "remote-wsl";
  #       publisher = "ms-vscode-remote";
  #       version = "0.88.5";
  #       sha256 = "01ajd3pg0a2nfdbfqfbzcix3alr8wpzymqgqlmqyv34fhr2hcc6d";
  #     }
  #
  #     {
  #       name = "remote-ssh-edit";
  #       publisher = "ms-vscode-remote";
  #       version = "0.87.0";
  #       sha256 = "1qqsnzn9z11jr72n7cl0ab6i9mv49c0ijcp699zbglv5092gmrf9";
  #     }
  #
  #     {
  #       name = "remote-explorer";
  #       publisher = "ms-vscode";
  #       version = "0.5.2025010909";
  #       sha256 = "07k0nc0a30s79m2qj5mxk285vzqad36fj1m9z376v2yqsj5mw360";
  #     }
  #
  #     {
  #       name = "hexeditor";
  #       publisher = "ms-vscode";
  #       version = "1.11.1";
  #       sha256 = "1dm3l23pwxr2bslwy6aik6lxfz101zna95vcrh2g7dglklx5h7j4";
  #     }
  #
  #     {
  #       name = "remote-server";
  #       publisher = "ms-vscode";
  #       version = "1.6.2025010809";
  #       sha256 = "07yl0hj94qbislqzpqlwh3wisb210ylpzy42zs2q3agparcgrlwv";
  #     }
  #
  #     {
  #       name = "python";
  #       publisher = "ms-python";
  #       version = "2024.23.2025012801";
  #       sha256 = "11jfyd4n2hjpl2sg4vfra5qakr9s5zd8cvvyrfllb0v819sm6vsn";
  #     }
  #
  #     {
  #       name = "nix-extension-pack";
  #       publisher = "pinage404";
  #       version = "3.0.0";
  #       sha256 = "1ndhz51p1fxf42ch1awf7cydi5jryff5v72zckl1mi3j17ldsrbi";
  #     }
  #
  #     {
  #       name = "remote-containers";
  #       publisher = "ms-vscode-remote";
  #       version = "0.396.0";
  #       sha256 = "157hfpjs2mhvd30cdikkfk9v60bxrax5s7fp0m4pxmi3p1y8h0z1";
  #     }
  #
  #     {
  #       name = "ruby-extensions-pack";
  #       publisher = "shopify";
  #       version = "0.1.12";
  #       sha256 = "0dh1hhh0lh6agafizgvqgpr4zfcaxwd4nglai4xlb18mgi0kd7yd";
  #     }
  #
  #     {
  #       name = "vscode-yaml";
  #       publisher = "redhat";
  #       version = "1.15.0";
  #       sha256 = "0hqbfqwszfwxia2flh92z70zd57azpl5i3zapy8s5j3bh8sln69n";
  #     }
  #
  #     {
  #       name = "ruby-lsp";
  #       publisher = "shopify";
  #       version = "0.9.0";
  #       sha256 = "0sn5q7p59wicl3f676l8cxsdrppx66qxmpmswzqahcvkkpbhwmpa";
  #     }
  #
  #     {
  #       name = "just";
  #       publisher = "skellock";
  #       version = "2.0.0";
  #       sha256 = "1ph869zl757a11f8iq643f79h8gry7650a9i03mlxyxlqmspzshl";
  #     }
  #
  #     {
  #       name = "sorbet-vscode-extension";
  #       publisher = "sorbet";
  #       version = "0.3.37";
  #       sha256 = "1j6cx49q56cdxr890pw30dryd0kd4lyhbl289jhiw6bmwndpaz2d";
  #     }
  #
  #     {
  #       name = "shellcheck";
  #       publisher = "timonwong";
  #       version = "0.37.6";
  #       sha256 = "xfVKI+xxA/8YUcCWpskxZLbBLPsYCF46iKJkrV2zODs=";
  #     }
  #
  #     {
  #       name = "vscode-lldb";
  #       publisher = "vadimcn";
  #       version = "1.11.3";
  #       sha256 = "16d8g7gv2y57klg5lixrik43g2nbzccjkkackws4iqf8in0c6yv7";
  #     }
  #
  #     {
  #       name = "theme-check-vscode";
  #       publisher = "shopify";
  #       version = "3.5.3";
  #       sha256 = "0varbh2n3102vpnh5d12i4mwsxd8mj1idxaxl1s0xdl3hr2anvdd";
  #     }
  #
  #     {
  #       name = "vim";
  #       publisher = "vscodevim";
  #       version = "1.29.0";
  #       sha256 = "1r29gd6na3gyc38v8ynmc2c46mi38zms1p87y65v9n2rj94pqx97";
  #     }
  #
  #     {
  #       name = "vscode-alternate-file";
  #       publisher = "will-wow";
  #       version = "0.3.1";
  #       sha256 = "1mz1m5gfhyqa66wza6xb4hmkwhgi48npwj34w2n2nalvf6k53w85";
  #     }
  #
  #     {
  #       name = "rust-analyzer";
  #       publisher = "rust-lang";
  #       version = "0.4.2289";
  #       sha256 = "0y6fix0nxrwcmjcybz37n2aqsqrchw3y41rga1mbkp1qwzxfagnn";
  #     }
  #
  #     {
  #       name = "even-better-toml";
  #       publisher = "tamasfe";
  #       version = "0.21.2";
  #       sha256 = "0208cms054yj2l8pz9jrv3ydydmb47wr4i0sw8qywpi8yimddf11";
  #     }
  #
  #     {
  #       name = "vscode-pylance";
  #       publisher = "ms-python";
  #       version = "2025.1.102";
  #       sha256 = "1k84lnqi4a95504fl5l4qlc62i1lr6bvq6yyapczhsyd4xbjdzpx";
  #     }
  #
  #     {
  #       name = "marp-vscode";
  #       publisher = "marp-team";
  #       version = "3.1.0";
  #       sha256 = "0qr5wwgw06dx6rma3mr2dwm8mzjd3ydv6jhdcmfw58gi2nqk0k3l";
  #     }
  #
  #     {
  #       name = "vscode-tailscale";
  #       publisher = "tailscale";
  #       version = "1.0.0";
  #       sha256 = "0j41xbz6zangq7i4mj4xgdpsswss3jnznyd9v3943yvfhmkq5a1h";
  #     }
  #
  #     {
  #       name = "Continue";
  #       publisher = "continue";
  #       version = "0.8.66";
  #       sha256 = "1jhkdpj4b6849hclvrhlzcxn44aa9dp2xb6mk4l7dvrxkxyqzhq6";
  #     }
  #   ];
}
