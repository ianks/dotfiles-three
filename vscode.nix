{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions;
      [
        vscodevim.vim
        github.copilot
        brettm12345.nixfmt-vscode
        rust-lang.rust-analyzer
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        # vadimcn.vscode-lldb
        mkhl.direnv
        github.copilot-chat
        github.vscode-pull-request-github
        eamodio.gitlens
        ms-vscode.hexeditor
        bbenoist.nix
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
        name = "ruby-lsp";
        publisher = "shopify";
        version = "0.6.7";
        sha256 = "19zlx3v1fikqml7264fzrgbr2m4sqg3zh63450piy6fgjh350n6d";
      }];

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
      update.mode = "none";
      terminal.integrated.shell.linux = "${pkgs.zsh}/bin/zsh";

      editor.fontFamily =
        "FiraCode, 'FiraCode NFM', 'JetbrainsMono Nerd Font', 'monospace', monospace, 'Droid Sans Fallback'";
      editor.cursorStyle = "line";
      editor.lineNumbers = "on";
      editor.wordWrap = "off";
      editor.fontLigatures = true;
      editor.inlineSuggest.enabled = true;
      editor.tabSize = 2;
      editor.insertSpaces = true;

      # make it faster
      editor.minimap.enabled = false;
      search.searchOnType = false;
      breadcrumbs.enabled = true;
      editor.wordSeparators = ''/\()"':;.;<>~!@#$%^&*|+=[]{}`?-'';
      terminal.integrated.tabs.enabled = true;
      editor.inlayHints.enabled = "off";

      workbench = {
        colorTheme = "Catppuccin Mocha";
        iconTheme = "catppuccin-frappe";
      };

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

      vim = {
        leader = "<space>";
        handleKeys = {
          "<C-a>" = false;
          "<C-f>" = false;
        };
        easymotion = false;
        incsearch = true;
        useSystemClipboard = true;
        useCtrlKeys = true;
        hlsearch = true;
        insertModeKeyBindings = [{
          "before" = [ "j" "k" ];
          "after" = [ "<Esc>" ];
        }];
        normalModeKeyBindingsNonRecursive = [
          {
            "before" = [ "<leader>" "f" "s" ];
            "commands" = [ "workbench.action.findInFiles" ];
          }
          {
            "before" = [ "<leader>" "f" "f" ];
            "commands" = [ "workbench.action.quickOpen" ];
          }
          {
            "before" = [ "<leader>" "d" ];
            "after" = [ "d" "d" ];
          }
          {
            "before" = [ "<C-n>" ];
            "commands" = [ ":nohl" ];
          }
        ];
      };

      # nixfmt.path = "${pkgs.nixfmt}/bin/nixfmt";
      # rust-client.rustupPath = "${pkgs.rustup}/bin/rustup";

      rust-analyzer.check.command = "clippy";
      diffEditor.ignoreTrimWhitespace = false;
      files.trimTrailingWhitespace = true;
      files.exclude = {
        "**/.git" = true;
        "**/.svn" = true;
        "**/.hg" = true;
        "**/CVS" = true;
        "**/.DS_Store" = true;
        "**/Thumbs.db" = true;
      };
    };
  };
}
