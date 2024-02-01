{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions =
      with pkgs.vscode-extensions; [
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
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "ruby-lsp";
          publisher = "Shopify";
          version = "0.5.9";
          sha256 = "113w2iis4zi4z3sqc3vd2apyrh52hbh2gvmxjr5yvjpmrsksclbd";
        }
      ];


    userSettings = {
      update.mode = "none";
      terminal.integrated.shell.linux = "${pkgs.zsh}/bin/zsh";
      editor = {
        fontFamily = "FiraCode, 'JetbrainsMono Nerd Font', 'monospace', monospace, 'Droid Sans Fallback'";
        formatOnSave = true;
        cursorStyle = "line";
        lineNumbers = "on";
        wordWrap = "off";
        fontLigatures = true;
        inlineSuggest.enabled = true;
        tabSize = 2;
        insertSpaces = true;
      };

      # make it faster
      "editor.minimap.enabled" = false;
      "search.searchOnType" = false;
      "breadcrumbs.enabled" = true;
      "editor.wordSeparators" = "/\\()\"':;.;<>~!@#$%^&*|+=[]{}`?-";
      "terminal.integrated.tabs.enabled" = true;
      "editor.inlayHints.enabled" = "off";

      workbench = {
        colorTheme = "Catppuccin Mocha";
        iconTheme = "catppuccin-frappe";
      };

      "[json]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
        "editor.tabSize" = 2;
      };
      "[ruby]" = {
        "editor.tabSize" = 2;
        "editor.defaultFormatter" = "Shopify.ruby-lsp";
        "editor.formatOnSave" = true;
        "editor.insertSpaces" = true;
        "editor.semanticHighlighting.enabled" = true;
      };
      "[rust]" = {
        "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        "editor.semanticHighlighting.enabled" = true;
        "editor.formatOnSave" = true;
      };

      vscode.vim = {
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
        insertModeKeyBindings = [
          {
            "before" = [ "j" "k" ];
            "after" = [ "<Esc>" ];
          }
        ];
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
          {
            "before" = [ "<leader>" "t" "l" ];
            "commands" = [ "DevTestRunner.runTestCase" ];
            "when" = "editorTextFocus && resourceExtname == '.rb' && resourceFilename =~ /_(test|spec).rb/ || editorTextFocus && resourceExtname =~ /[.]tsx?/ && resourceFilename =~ /[.](test|[ui]spec)[.]tsx?/";
          }
          {
            "before" = [ "<leader>" "t" "f" ];
            "commands" = [ "DevTestRunner.runAllTests" ];
            "when" = "editorTextFocus && resourceExtname == '.rb' && resourceFilename =~ /_(test|spec).rb/ || editorTextFocus && resourceExtname =~ /[.]tsx?/ && resourceFilename =~ /[.](test|[ui]spec)[.]tsx?/";
          }
        ];
      };

      rust-analyzer.check.command = "clippy";
      rust-client.rustupPath = "${pkgs.rustup}/bin/rustup";
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
