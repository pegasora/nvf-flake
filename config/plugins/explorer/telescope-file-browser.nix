{
  pkgs,
  lib,
  ...
}: {
  vim.startPlugins = [pkgs.vimPlugins.telescope-file-browser-nvim];

  vim.luaConfigRC.telescope-file-browser = lib.nvim.dag.entryAnywhere ''
    require("telescope").load_extension("file_browser")
  '';

  vim.keymaps = [
    {
      key = "<leader>fb";
      action = "<cmd>Telescope file_browser<CR>";
      mode = "n";
      desc = "File Browser";
    }
  ];
}
