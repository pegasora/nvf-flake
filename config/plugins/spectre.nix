{pkgs, ...}: {
  config.vim.lazy.plugins = {
    "nvim-spectre" = {
      package = pkgs.vimPlugins.nvim-spectre;
      setupModule = "spectre";
      setupOpts = {
        option_name = true;
      };
      after = ''
        printf("spectre loaded")
      '';

      lazy = true;
      keys = [
        {
          key = "<leader>rs";
          action = ":Telescope spectre<CR>";
        }
      ];
    };
  };
}
