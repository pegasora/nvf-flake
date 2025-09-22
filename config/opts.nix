{pkgs, ...}: {
  vim.viAlias = true;
  vim.vimAlias = true;

  vim.globals = {
    mapleader = " ";
    maplocalleader = "\\";
  };

  vim.lineNumberMode = "relative";

  vim.clipboard = {
    enable = true;
    registers = "unnamedplus";
    providers.wl-copy.enable = true;
  };

  vim.undoFile.enable = true;
  vim.options = {
    tabstop = 2;
    shiftwidth = 2;
    autoindent = true;

    termguicolors = true;
    mouse = "a";
    signcolumn = "yes";
    splitright = true;
    wrap = false;
    updatetime = 50;
  };

  vim.visuals = {
    nvim-web-devicons = {
      enable = true;
    };

    rainbow-delimiters = {
      enable = true;
    };

    nvim-cursorline = {
      enable = true;
      setupOpts = {
        cursorline = {
          enable = true;
          timeout = 10;
        };
      };
    };
  };
}
