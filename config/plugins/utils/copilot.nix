{
  vim.assistant.copilot = {
    enable = true;
    # cmp.enable is for nvim-cmp — leave false so inline suggestions are active
    mappings.suggestion = {
      accept = "<S-Tab>";
      acceptWord = "<C-j>";
      dismiss = "<C-]>";
    };
  };
}
