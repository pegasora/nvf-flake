{
  vim.languages = {
    nix = {
      enable = true;

      format = {
        enable = true;
        # default is alejandra
        #type = "nixfmt";
        type = ["alejandra"];
      };

      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
