{
  pkgs,
  lib,
  ...
}: {
  vim.startPlugins = [pkgs.vimPlugins.kanagawa-nvim];

  vim.luaConfigRC.kanagawa = lib.nvim.dag.entryAnywhere ''
    require('kanagawa').setup({
      compile = true,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      theme = "wave",
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
    })
    vim.cmd.colorscheme("kanagawa-wave")
  '';
}
