{pkgs, ...}: {
  vim.globals = {
    mapleader = " ";
    maplocalleader = "\\";
  };

  vim.lineNumberMode = "relative";

  vim.clipboard = {
    enable = true;
    #providers = "unnamedplus";
  };

  vim.options = {
    tabstop = 2;
    shiftwidth = 2;
    autoindent = true;

    termguicolors = true;
  };

  vim.visuals.nvim-cursorline = {
    enable = true;
    setupOpts = {
      cursorline.enable = true;
    };
  };
}
