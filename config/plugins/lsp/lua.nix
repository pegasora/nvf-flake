{
  vim.languages = {
    lua = {
      enable = true;

      format = {
        enable = true;
        type = "stylua";
      };

      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
