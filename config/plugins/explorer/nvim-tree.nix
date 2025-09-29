{
  vim.startPlugins = ["nvim-web-devicons"];

  vim.filetree.nvimTree = {
    enable = true;

    setupOpts = {
      disable_netrw = true;

      view = {
        width = 35;
        relativenumber = true;
      };
      renderer = {
        indent_markers.enable = true;
        icons = {
          glyphs = {
            folder = {
              arrow_closed = ""; # -- arrow when folder is closed
              arrow_open = ""; # -- arrow when folder is open
            };
          };
        };
      };
      actions = {
        open_file = {
          window_picker = {
            enable = true;
          };
        };
      };
      git = {
        ignore = false;
      };
    };

    mappings = {
      toggle = "<leader>e";
      refresh = "<Nop>";
      findFile = "<Nop>";
      focus = "<Nop>";
    };
  };
}
