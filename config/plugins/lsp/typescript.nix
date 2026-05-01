# also doubles up as javascript
{
  vim.languages = {
    typescript = {
      enable = true;

      format = {
        enable = true;
        type = ["prettier"];
      };

      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
