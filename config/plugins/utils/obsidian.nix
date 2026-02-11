{
  vim.notes.obsidian = {
    enable = true;
    setupOpts = {
      legacy_commands = false;
      workspaces = [
        {
          name = "notes";
          path = "~/notes";
        }
      ];
    };
  };
}
