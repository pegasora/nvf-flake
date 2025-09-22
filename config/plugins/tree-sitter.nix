{ pkgs, ... }: {
  vim.treesitter = {
    enable = true;
    grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      c
      comment
      css
      dockerfile
      go
      html
      javascript
      json
      jsonc
      lua
      make
      markdown
      nix
      python
      regex
      rust
      toml
      typescript
      yaml
      zig
    ];

    highlight.enable = true;
    fold = true;
    #indent.enable = true;
  };
}
