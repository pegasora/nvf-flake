{
  vim.assistant.supermaven-nvim = {
    enable = true;

    setupOpts = {
      ignore_file = {
        cpp = true;
        markdown = true;
      };

      log_level = "info";
      disable_incline_complete = false;
      color = {
        suggested_color = "#ffffff";
        cterm = 244;
      };

      keymaps = {
        accept_suggestion = "<Tab>";
        clear_suggestion = "<C-<Tab>>";
        accept_word = "<C-j>";
      };
    };
  };
}
