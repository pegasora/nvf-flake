{pkgs, ...}: {
  config = {
    vim.startPlugins = ["plenary-nvim"];
    vim.lazy.plugins = {
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
            key = "<leader>sr";
            action = "<cmd>lua require('spectre').toggle()<CR>";
            mode = "n";
          }
        ];
      };
    };
  };
}
