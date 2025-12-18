# also doubles up as javascript
{
  vim.languages = {
    ts = {
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
