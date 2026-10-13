# NB: this is a light version, used on shared computers
# The real one is at https://github.com/nim65s/dotfiles/tree/main/home/nim
{
  config,
  lib,
  pkgs,
  inputs,
  flake,
  ...
}:
{
  imports = [
    flake.modules.home.lirmm
    inputs.nvim-wrapper-arnaud.homeModules.neovim
  ];
  config = {
    # wrappers.neovim.enable = true;
    home = {
      stateVersion = "26.11";
      keyboard = {
        layout = "fr";
        variant = "azerty";
      };

      packages = with pkgs; [
        gh # github cli
        gh-f # gh cli fzf extension
        deadnix
        jq
        nerd-fonts.iosevka
        ninja
        prek
        ccache
      ];

      sessionVariables = {
        CMAKE_BUILD_TYPE = "RelWithDebInfo";
        CMAKE_C_COMPILER_LAUNCHER = "ccache";
        CMAKE_CXX_COMPILER_LAUNCHER = "ccache";
        CMAKE_COLOR_DIAGNOSTICS = "ON";
        CMAKE_EXPORT_COMPILE_COMMANDS = "ON";
        CMAKE_GENERATOR = "Ninja";
        CMEEL_LOG_LEVEL = "DEBUG";
        CTEST_OUTPUT_ON_FAILURE = "ON";
        CTEST_PROGRESS_OUTPUT = "ON";
        DELTA_PAGER = "less -FR";
        POETRY_VIRTUALENVS_IN_PROJECT = "true";
        RUSTC_WRAPPER = lib.getExe pkgs.ccache;
      };

    };

    wrappers.neovim.enable = true;

    programs = {
      lazygit = {
        enable = true;
      };
      kitty = {
        enable = true;

        keybindings = {
          "kitty_mod+a" = "kitty_scrollback_nvim --config ksb_builtin_last_cmd_output";
          "kitty_mod+k" = "launch --location=vsplit --cwd=current";
          "kitty_mod+." = "launch --location=hsplit --cwd=current";
          "kitty_mod+r" = "previous_window";
          "kitty_mod+t" = "next_window";
          "kitty_mod+," = "new_tab_with_cwd";
          "kitty_mod+h" = "previous_tab";
          "kitty_mod+g" = "next_tab";
          # "kitty_mod+p" = "show_scrollback";
          "kitty_mod+p" = "kitty_scrollback_nvim";
        };

        settings = {
          cursor_trail = "1";
          enable_audio_bell = false;
          enabled_layouts = "splits,fat,tall,grid,horizontal,vertical,stack";
          focus_follows_mouse = true;
          scrollback_pager_history_size = 2;
          shell = lib.getExe config.programs.fish.package;
          tab_bar_style = "powerline";
        };
        shellIntegration.mode = "enabled";
      };
      ripgrep.arguments = [
        "--hyperlink-format=kitty"
      ];

      fish = {
        enable = true;
        shellAbbrs = {
          "-" = "cd -";
          ".." = "cd ..";
          "..." = "cd ../..";
          "...." = "cd ../../..";
          "....." = "cd ../../../..";
          "......" = "cd ../../../../..";
          bn = "cmake -B build";
          bnb = "cmake -B build && cmake --build build";
          bb = "cmake --build build";
          bt = "cmake --build build -t test";
          bi = "cmake --build build -t install";
          da = "direnv allow";
          db = "direnv block";
          gc = {
            expansion = "git commit -am '%'";
            setCursor = true;
          };
          gd = "git difftool";
          gst = "git status";
          gp = "git push";
          gf = "git fetch --all --prune";
          gcaf = "git commit -a --fixup";
          gcan = "git commit -a --amend --no-edit";
          gch = "git checkout";
          v = "hx";
        };

        shellAliases = {
          "+" = "echo";
          cp = "cp -r";
          mv = "mv -v";
          rm = "rm -Iv";
          watch = "watch --color -d";
        };
        preferAbbrs = true;
      };
      starship = {
        enable = true;
        presets = [
          "nerd-font-symbols"
        ];
        settings = {
          format = "┬─ $all$time$line_break╰─ $jobs$battery$status$container$os$shell$character";
          time.disabled = false;
          status.disabled = false;
          package.disabled = true;
          os.disabled = false;
        };
      };
      zoxide = {
        enable = true;
        options = [
          "--cmd"
          "cd"
        ];
      };
      git.settings = {
        branch = {
          autoSetupRebase = "always";
          sort = "-committerdate";
        };
        diff = {
          algorithm = "histogram";
          colorMoved = true;
          colorMovedWS = "allow-indentation-change";
          renames = "true";
        };
        help.autocorrect = 1;
        rerere = {
          autoupdate = true;
          enabled = true;
        };
        user =
          let
            me = [
              "Arnaud"
              "Tanguy"
            ];
          in
          {
            name = lib.concatStringsSep " " me;
            email = "arn.tanguy@gmail.com";
          };
      };
    };
  };
}
