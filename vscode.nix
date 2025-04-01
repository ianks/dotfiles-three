{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      # enable = true;  <-- Not needed, as mentioned before

      extensions = with pkgs.vscode-extensions; [
        # ms-vscode-remote
        ms-vscode-remote.remote-ssh
        # ms-vscode-remote.remote-ssh-edit
        # ms-vscode-remote.remote-wsl
        # ms-vscode-remote.vscode-remote-extensionpack
        # ms-vscode-remote.remote-containers
        # ms-vscode.remote-explorer
        # ms-vscode.remote-server
        # arrterian
        arrterian.nix-env-selector
        bbenoist.nix
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        christian-kohler.path-intellisense
        esbenp.prettier-vscode
        github.codespaces
        github.vscode-github-actions
        graphql.vscode-graphql-syntax
        # itarato.byesig
        jnoortheen.nix-ide
        # koichisasada.vscode-rdbg
        marp-team.marp-vscode
        mechatroner.rainbow-csv
        mkhl.direnv
        ms-azuretools.vscode-docker
        ms-vscode.hexeditor
        # pinage404.nix-extension-pack
        redhat.vscode-yaml
        rust-lang.rust-analyzer
        # shopify.ruby-extensions-pack
        shopify.ruby-lsp
        # shopify.theme-check-vscode
        skellock.just
        # sorbet.sorbet-vscode-extension
        continue.continue
        tailscale.vscode-tailscale
        tamasfe.even-better-toml
        timonwong.shellcheck
        vadimcn.vscode-lldb
        vscodevim.vim
        # will-wow.vscode-alternate-file
      ];

      keybindings = [
        {
          key = "cmd+t";
          command = "-workbench.action.showAllSymbols";
        }
        {
          key = "ctrl+shift+alt+j";
          command = "commandId";
          when = "editorTextFocus";
        }
        {
          key = "cmd+; c";
          command = "-testing.runAtCursor";
          when = "editorTextFocus";
        }
        {
          key = "ctrl+shift+alt+j";
          command = "workbench.action.terminal.focus";
        }
        {
          key = "ctrl+shift+alt+k";
          command = "workbench.action.focusActiveEditorGroup";
        }
      ];

      userSettings = {
        breadcrumbs.enabled = true;
        diffEditor.ignoreTrimWhitespace = false;
        editor.cursorStyle = "line";
        editor.fontFamily =
          "'JetBrainsMono Nerd Font Mono', 'FiraCode Nerd Font Mono', monospace";
        editor.fontLigatures = true;
        editor.inlayHints.enabled = "off";
        editor.inlineSuggest.enabled = true;
        editor.insertSpaces = true;
        editor.lineNumbers = "on";
        editor.minimap.enabled = false;
        editor.tabSize = 2;
        editor.wordSeparators = ''/\()"':;.;<>~!@#$%^&*|+=[]{}`?-'';
        editor.wordWrap = "off";
        explorer.confirmDragAndDrop = false;
        files.trimTrailingWhitespace = true;
        files.insertFinalNewline = true;
        git.openDiffOnClick = false;
        hexeditor.columnWidth = 16;
        hexeditor.defaultEndianness = "little";
        hexeditor.inspectorType = "aside";
        hexeditor.showDecodedText = true;
        "rust-analyzer.check.command" = "clippy";
        "rust-analyzer.server.path" = "rust-analyzer";
        scm.showActionButton = false;
        search.searchOnType = false;
        "terminal.integrated.shell.linux" = "${pkgs.zsh}/bin/zsh";
        "terminal.integrated.shell.osx" = "${pkgs.zsh}/bin/zsh";
        "terminal.integrated.tabs.enabled" = true;
        "update.mode" = "none"; # This is important for the default profile
        "window.zoomLevel" = 1;

        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-frappe";

        "[json]" = {
          editor.defaultFormatter = "vscode.json-language-features";
          editor.tabSize = 2;
        };
        "[ruby]" = {
          editor.tabSize = 2;
          editor.defaultFormatter = "Shopify.ruby-lsp";
          editor.formatOnSave = true;
          editor.insertSpaces = true;
          editor.semanticHighlighting.enabled = true;
        };
        "[rust]" = {
          editor.defaultFormatter = "rust-lang.rust-analyzer";
          editor.semanticHighlighting.enabled = true;
          editor.formatOnSave = true;
        };
        "[nix]" = {
          editor.defaultFormatter = "brettm12345.nixfmt-vscode";
          editor.formatOnSave = true;
        };
        "[javascript]" = {
          editor.defaultFormatter = "esbenp.prettier-vscode";
          editor.formatOnSave = true;
        };
        "[typescript]" = {
          editor.defaultFormatter = "esbenp.prettier-vscode";
          editor.formatOnSave = true;
        };

        # Vim settings are now also part of userSettings directly.
        "vim.leader" = "<space>";
        "vim.handleKeys" = {
          "<C-a>" = false;
          "<C-f>" = false;
        };
        "vim.easymotion" = false;
        "vim.incsearch" = true;
        "vim.useSystemClipboard" = true;
        "vim.useCtrlKeys" = true;
        "vim.hlsearch" = true;
        "vim.insertModeKeyBindings" = [{
          before = [ "j" "k" ];
          after = [ "<Esc>" ];
        }];
        "vim.normalModeKeyBindingsNonRecursive" = [
          {
            before = [ "<leader>" "f" "s" ];
            commands = [ "workbench.action.findInFiles" ];
          }
          {
            before = [ "<leader>" "f" "f" ];
            commands = [ "workbench.action.quickOpen" ];
          }
          {
            before = [ "<leader>" "d" ];
            after = [ "d" "d" ];
          }
          {
            before = [ "<C-n>" ];
            commands = [ ":nohl" ];
          }
        ];
        "vim.files.exclude" = {
          "**/.git" = true;
          "**/.svn" = true;
          "**/.hg" = true;
          "**/CVS" = true;
          "**/.DS_Store" = true;
          "**/Thumbs.db" = true;
        };
      };
      
      enableUpdateCheck = false; # This has to be in the default profile only
      enableExtensionUpdateCheck = false; # This has to be in the default profile only.
    };
  };
}
