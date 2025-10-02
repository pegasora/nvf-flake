{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.vim;
in {
  # Add Kanagawa plugin (from nixpkgs.vimPlugins)
  vim.startPlugins = [pkgs.vimPlugins.kanagawa-nvim];

  # Enable and set the theme (nvf applies colorscheme automatically)
  vim.theme = {
    enable = true;
    name = "kanagawa"; # Default 'wave' variant; use "kanagawa-dragon" for alternative
  };

  # Lua setup via luaConfigRC (DAG entry for ordering; use entryAfter if needed for deps)
  vim.luaConfigRC = mkIf cfg.theme.enable (lib.nvim.dag.entryAnywhere ''
    -- Kanagawa setup (customize as needed)
    require('kanagawa').setup({
      compile = false,  -- Enable for performance (run :KanagawaCompile once in nvim)
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,  -- true for terminal transparency
      dimInactive = false,
      terminalColors = true,

      -- Optional: Theme selection (overrides vim.o.background)
      theme = "wave",  -- "wave" (default dark), "dragon" (alt dark), "lotus" (light)

      colors = {
        palette = {
          -- Optional overrides (see https://github.com/rebelot/kanagawa.nvim#palette)
        },
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },

      overrides = function(colors)
        return {
          -- Example: Custom highlights
          String = { fg = colors.palette.springYellow, italic = true },
          -- Add more here
        }
      end,
    })

    -- Optional: Toggle based on background (if not using config.theme above)
    -- vim.o.background = "dark"  -- or "light"
  '');
}
