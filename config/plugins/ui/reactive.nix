{
  pkgs,
  lib,
  ...
}:
let
  reactive-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "reactive.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "rasulomaroff";
      repo = "reactive.nvim";
      rev = "0588b5c2b0cf49bd2232fe4366b3516c32edee44";
      sha256 = "sha256-F2H1hH4MxNUFMKDtkrTbF8PwZW6SzXsbQidVWX/2N+M=";
    };
  };
in
{
  vim.startPlugins = [ reactive-nvim ];

  vim.luaConfigRC.reactive = lib.nvim.dag.entryAnywhere ''
    require('reactive').setup({
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true
      }
    })
  '';
}
