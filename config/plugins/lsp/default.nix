{
  imports = [
    ./python.nix
    ./nix.nix
  ];
  vim.lsp.enable = true;
  vim.lsp.formatOnSave = true;
  vim.lsp.inlayHints.enable = true;
}
