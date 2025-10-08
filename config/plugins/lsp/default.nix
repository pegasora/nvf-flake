{
  imports = [
    ./python.nix
    ./nix.nix
    ./typescript.nix
    ./c-and-cpp.nix
    ./rust.nix
    ./lua.nix
    ./zig.nix
  ];
  vim.lsp.enable = true;
  vim.lsp.formatOnSave = true;
  vim.lsp.inlayHints.enable = true;
}
