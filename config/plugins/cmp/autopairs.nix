{
  vim.autopairs.nvim-autopairs = {
    enable = true;
    setupOpts = {
      disable_filetype = ["TelescopePrompt" "spectre_panel"];
      fast_wrap = {
        map = "<M-e>";
        end_key = "$";
      };
    };
  };
}
