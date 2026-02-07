{
  pkgs,
  lib,
  ...
}:
let
  jjsigns-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "jjsigns.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "evanphx";
      repo = "jjsigns.nvim";
      rev = "f5f5cefef0945cc00ba914584275f9cef8c2e792";
      sha256 = "sha256-nZu61pIkd85nISneMBy82ZZPB7Wj85Uy2LsOoWo99CE=";
    };
  };
in
{
  vim.startPlugins = [ jjsigns-nvim ];

  vim.luaConfigRC.jjsigns = lib.nvim.dag.entryAnywhere ''
    require('jjsigns').setup({
      enabled = true,
      
      attach = {
        auto = true,  -- Auto-attach to JJ repository files
      },
      
      signs = {
        add = { text = '┃', numhl = 'JjSignsAddNr', linehl = 'JjSignsAddLn' },
        change = { text = '┃', numhl = 'JjSignsChangeNr', linehl = 'JjSignsChangeLn' },
        delete = { text = '▁', numhl = 'JjSignsDeleteNr', linehl = 'JjSignsDeleteLn' },
        topdelete = { text = '▔', numhl = 'JjSignsDeleteNr', linehl = 'JjSignsDeleteLn' },
        changedelete = { text = '~', numhl = 'JjSignsChangeNr', linehl = 'JjSignsChangeLn' },
      },
      
      sign_priority = 6,
      signcolumn = true,
      numhl = false,
      linehl = false,
      
      -- JJ specific options
      base = '@-',  -- Base revision to compare against (default: parent revision)
      
      -- Performance options
      update_debounce = 100,  -- Debounce time for updates in milliseconds
    })
  '';
}
