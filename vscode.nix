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
        esbenp.prettier-vscode
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
      rust-analyzer.check.command = "clippy";
      scm.showActionButton = false;
      search.searchOnType = false;
      terminal.integrated.shell.linux = "${pkgs.zsh}/bin/zsh";
      terminal.integrated.shell.osx = "${pkgs.zsh}/bin/zsh";
      terminal.integrated.tabs.enabled = true;
      update.mode = "none";
      window.zoomLevel = 1;

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
      "[javascript]" = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
        editor.formatOnSave = true;
      };
      "[typescript]" = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
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
          before = [ "j" "k" ];
          after = [ "<Esc>" ];
        }];
        normalModeKeyBindingsNonRecursive = [
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
      };

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
