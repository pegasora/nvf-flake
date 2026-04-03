# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A Nix flake that configures Neovim using [NotAShelf/nvf](https://github.com/NotAShelf/nvf) — a Nix-native Neovim configuration framework. The output is a single `packages.default` derivation (the Neovim binary).

## Common Commands

```bash
# Build the neovim package
nix build .#default

# Run neovim directly from the flake
nix run .#default

# Update flake inputs
nix flake update

# Update a single input
nix flake update nvf
```

There are no lint or test commands — correctness is checked at build time by `nix build`.

## Architecture

```
flake.nix              # Inputs: nixpkgs, flake-parts, nvf. Outputs: packages.default
config/
  default.nix          # Imports opts, keymaps, plugins/
  opts.nix             # Vim options (tabstop, clipboard, etc.)
  keymaps.nix          # Keybindings (leader = Space)
  plugins/
    default.nix        # Selectively imports plugin categories
    colors/            # Colorschemes (kanagawa active)
    lsp/               # Language servers + conform formatter
    cmp/               # Completion (blink-cmp active)
    ui/                # lualine, bufferline, noice, which-key, etc.
    explorer/          # File explorers (nvim-tree active; oil, yazi, superfile available)
    git/               # gitsigns, jjsigns (currently disabled)
    utils/             # telescope, toggleterm, flash, tree-sitter, etc.
    dashboards/        # dashboard-nvim, startify
```

### Key Pattern: Enabling/Disabling Plugins

Each category folder has a `default.nix` that imports individual plugin files. To toggle a plugin, comment/uncomment its import line in the category's `default.nix`.

### Key Pattern: Plugin Configuration

Plugins use nvf's attribute set API under `vim.*`:

```nix
# nvf managed plugins:
vim.languages.python = { enable = true; lsp.enable = true; treesitter.enable = true; };
vim.autocomplete.blink-cmp.enable = true;

# Raw plugins not in nvf:
vim.startPlugins = [pkgs.vimPlugins.kanagawa-nvim];
vim.luaConfigRC.kanagawa = lib.nvim.dag.entryAnywhere ''
  require('kanagawa').setup({ ... })
'';
```

The `lib.nvim.dag.entryAnywhere` / `entryAfter` / `entryBefore` functions control Lua load order via a DAG.

### Supported Systems

x86_64-linux, aarch64-linux, x86_64-darwin, aarch64-darwin

## Known Issues

### yazi-nvim: "find next" dialog loop (open bug)

**Symptom:** While in yazi (inside Neovim), yazi's native find dialog (top-center of yazi UI) opens spontaneously. Pressing `Esc` closes it for a split second and it immediately reopens. Nothing closes it; usually requires killing the process.

**Key facts established:**
- Does NOT happen in standalone yazi (fish `y` function) — confirmed Neovim integration issue
- Happens with both `openYazi` and `yaziToggle` mappings — not a state-persistence problem
- The dialog is yazi's own find UI, not Neovim's search (noice)
- Something is continuously sending the find trigger to yazi's stdin from within the yazi-nvim integration

**Changes made so far:**
- Switched mapping from `yaziToggle` → `openYazi` (kept, even though it doesn't fix the bug)
- Trial in progress: `floating_window_scaling_factor = 0.9` (was 1.0) to see if full-screen coverage contributes

**Leading hypothesis:** yazi-nvim's internal event loop is repeatedly sending input to the yazi terminal process, triggered by some specific navigation action. The exact trigger action is unknown — intermittent and hard to reproduce on demand.

**Next steps if it recurs:** Note exactly what you were doing in yazi right before it started, and whether a specific key or action consistently precedes it. Also consider checking the yazi-nvim GitHub issues for similar reports.
