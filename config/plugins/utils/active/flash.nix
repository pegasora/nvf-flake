{
  vim.utility.motion.flash-nvim = {
    enable = true;
    setupOpts = {
      modes = {
        search = {
          enabled = true;
        };
      };
    };
  };

  vim.luaConfigRC = {
    flash-setup = {
      after = ["pluginConfigs"]; # This ensures it runs after other plugin setups
      before = [];
      data = ''
        require("flash").setup({
          modes = {
            search = {
              enabled = true
            }
          }
        })
      '';
    };
  };
}
