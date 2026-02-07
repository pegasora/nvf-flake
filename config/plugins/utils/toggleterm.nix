{
  vim.terminal.toggleterm = {
    enable = true;
    setupOpts = {
      direction = "vertical";
      float_opts = {
        border = "curved";
        height = 30;
        width = 150;
      };
      close_on_exit = false;
      shell = "fish";
    };
    mappings = {
      open = "<leader>aa";
    };
  };

  vim.keymaps = [
    {
      key = "<Esc>";
      mode = "t";
      action = "<C-\\><C-n>";
      desc = "Exit terminal insert mode";
    }
  ];
}
