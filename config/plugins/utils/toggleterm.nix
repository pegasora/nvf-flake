{
  vim.terminal.toggleterm = {
    enable = true;
    setupOpts = {
      direction = "float";
      float_opts = {
        border = "curved";
        height = 30;
        width = 150;
      };
      close_on_exit = true;
      shell = "fish";
    };
    mappings = {
      open = "<leader>aa";
    };
  };
}
