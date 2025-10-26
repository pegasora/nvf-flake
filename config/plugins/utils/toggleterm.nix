{
  vim.terminal.toggleterm = {
    enable = true;
    setupOpts = {
      direction = "float";
      float_opts = {
        border = "curved";
        height = 50;
        width = 200;
      };
      close_on_exit = true;
      shell = "fish";
    };
    mappings = {
      open = "<leader>aa";
    };
  };
}
