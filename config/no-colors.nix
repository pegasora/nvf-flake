# Config without color scheme — used by homeManagerModule for NixOS+stylix.
# The package output (for non-nix systems) uses ./default.nix which includes colors.
{
  imports = [
    ./plugins/dashboards
    ./plugins/lsp
    ./plugins/explorer
    ./plugins/cmp
    ./plugins/ui
    ./plugins/git
    ./plugins/utils
    ./opts.nix
    ./keymaps.nix
  ];
}
