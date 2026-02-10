{
  imports = [
    ./python.nix
    ./nix.nix
    ./typescript.nix
    ./c-and-cpp.nix
    ./rust.nix
    ./lua.nix
    ./zig.nix
    ./conform.nix
    ./typst.nix
    ./just.nix
    ./json.nix
  ];
  vim.lsp = {
    enable = true;
    formatOnSave = true;
    inlayHints.enable = true;
  };
}
