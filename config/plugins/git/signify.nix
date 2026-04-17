{
  pkgs,
  lib,
  ...
}: {
  vim.startPlugins = [pkgs.vimPlugins.vim-signify];

  # vim.luaConfigRC.signify = lib.nvim.dag.entryAnywhere ''
  #   vim.g.signify_sign_add               = '▎'
  #   vim.g.signify_sign_change            = '▎'
  #   vim.g.signify_sign_delete            = '▎'
  #   vim.g.signify_sign_delete_first_line = '▎'
  # '';
}
