{
  vim.languages = {
    typst = {
      enable = true;
      lsp.enable = true;
      treesitter.enable = true;
      format.enable = true;
      extensions = {
        typst-preview-nvim.enable = true;
      };
    };
  };
}
