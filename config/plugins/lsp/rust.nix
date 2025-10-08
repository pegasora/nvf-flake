{
  vim.languages = {
    rust = {
      enable = true;

      format = {
        enable = true;
        type = "rustfmt";
      };

      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
