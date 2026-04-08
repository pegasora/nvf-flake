{ pkgs, ... }:
{
  vim.autocomplete.blink-cmp = {
    enable = true;
    friendly-snippets.enable = true;
    mappings = {
      close = "<C-e>";
      confirm = "<CR>";
      next = "<C-j>";
      previous = "<C-k>";
      scrollDocsUp = "<c-u>";
      scrollDocsDown = "<c-d>";
    };
    setupOpts.sources.default = ["lsp" "path" "snippets" "buffer" "copilot"];
    sourcePlugins.copilot = {
      enable = true;
      package = pkgs.vimPlugins.blink-cmp-copilot;
      module = "blink-cmp-copilot";
    };
  };
}
