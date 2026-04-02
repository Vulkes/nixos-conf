{
  config,
  lib,
  pkgs,
  stylix,
  ...
}: {
  stylix.targets.nvf.enable = false;

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        augroups = [{name = "UserSetup";}];
        autocmds = [
          {
            event = ["FileType"];
            pattern = ["markdown"];
            group = "UserSetup";
            desc = "Set spellcheck for Markdown";
            command = "setlocal spell";
          }
        ];

        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
        };

        viAlias = false;
        vimAlias = false;

        options = {
          shiftwidth = 4;
          tabstop = 4;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        treesitter = {
          enable = true;
        };

        autocomplete.nvim-cmp = {
          enable = true;
          mappings = {
            confirm = "<C-y>";
            next = "<C-n>";
            previous = "<C-p>";
          };
        };

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        autopairs.nvim-autopairs.enable = true;

        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
        };

        languages = {
          enableExtraDiagnostics = true;
          enableFormat = true;
          enableDAP = true;

          nix = {
            enable = true;
          };

          rust = {
            enable = true;
            treesitter.enable = true;
            extensions.crates-nvim = {
              enable = true;
            };
          };

          markdown = {
            enable = true;
            extensions.markview-nvim.enable = true;
          };

          clang = {
            enable = true;
            cHeader = true;
          };

          html = {
            enable = true;
            treesitter.enable = true;
          };

          lua = {
            enable = true;
          };

          ts = {
            enable = true;
          };
        };
      };
    };
  };
}
