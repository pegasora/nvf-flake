{
  vim.languages = {
    go = {
      enable = true;

      format = {
        enable = true;
        type = "gofmt";
      };

      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
