{
  vim.startPlugins = [ "nui-nvim" "nvim-notify" ];

  vim.ui.noice = {
    enable = true;

    setupOpts = {
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
      };
    };
  };
}
