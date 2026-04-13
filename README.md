# nvf-flake

A Nix flake that configures Neovim using [NotAShelf/nvf](https://github.com/NotAShelf/nvf) — a Nix-native Neovim configuration framework. The output is a single `packages.default` derivation (a fully configured Neovim binary).

## Usage

### Standalone (any system)

```bash
# Build
nix build .#default

# Run directly
nix run .#default
```

### As a flake input (NixOS / home-manager)

```nix
inputs.nvf-flake.url = "github:pegasora/nvf-flake";
```

Then pass `inputs.nvf-flake.packages.${system}.default` to wherever you want the Neovim binary.

### Updating

```bash
# Update all inputs
nix flake update

# Update only nvf
nix flake update nvf
```

## Supported Systems

- `x86_64-linux`
- `aarch64-linux`
- `x86_64-darwin`
- `aarch64-darwin`

---

## Active Plugins

### Colorscheme
| Plugin | Status |
|--------|--------|
| kanagawa-nvim | **active** |
| catppuccin | available |
| gruvbox | available |
| tokyonight | available |

### Completion & Pairs
| Plugin | Status |
|--------|--------|
| blink-cmp | **active** |
| nvim-autopairs | **active** |

### Dashboard
| Plugin | Status |
|--------|--------|
| dashboard-nvim | **active** |
| startify | available |

### Explorer
| Plugin | Status |
|--------|--------|
| yazi-nvim | **active** |
| nvim-tree | available |
| oil.nvim | available |
| superfile | available |

### Git
| Plugin | Status |
|--------|--------|
| gitsigns | available (disabled — upstream errors) |
| jjsigns | available (disabled — upstream errors) |

### LSP & Formatting
| Language | LSP | Formatter |
|----------|-----|-----------|
| Python | ✓ | conform |
| Nix | ✓ | conform |
| TypeScript/JS | ✓ | conform |
| C / C++ | ✓ | conform |
| Rust | ✓ | conform |
| Lua | ✓ | conform |
| Zig | ✓ | conform |
| Typst | ✓ | conform |
| Justfile | ✓ | — |
| JSON | ✓ | conform |

LSP global settings: format on save, inlay hints enabled.

### UI
| Plugin | Status |
|--------|--------|
| bufferline | **active** |
| lualine | **active** (theme: auto) |
| noice.nvim | **active** |
| nvim-navbuddy | **active** |
| reactive.nvim | **active** |
| which-key | **active** |
| nvim-web-devicons | **active** |
| rainbow-delimiters | **active** |
| nvim-cursorline | **active** |
| indent-blankline | available |

### Utils
| Plugin | Status |
|--------|--------|
| flash.nvim | **active** (search mode enabled) |
| obsidian.nvim | **active** |
| GitHub Copilot | **active** (inline suggestions) |
| telescope.nvim | **active** |
| todo-comments | **active** |
| nvim-treesitter | **active** |
| trouble.nvim | **active** |
| toggleterm | **active** (fish shell, vertical) |
| spectre | available |
| smear-cursor | available |
| supermaven | available |

---

## Options

| Option | Value |
|--------|-------|
| Leader | `<Space>` |
| Local leader | `\` |
| Line numbers | relative |
| Tab / shift width | 2 |
| Clipboard | `unnamedplus` via `wl-copy` |
| Undo file | enabled |
| Mouse | enabled |
| Wrap | off |
| Folds | disabled |
| Sign column | always shown |
| Split direction | right |
| `vim` / `vi` aliases | enabled |

---

## Keymaps

### General

| Key | Mode | Action |
|-----|------|--------|
| `<leader>qq` | n | Force quit |
| `<leader>fn` | n | New file |
| `<leader>-` | n | Split window below |
| `<leader>\|` | n | Split window right |
| `<leader>wd` | n | Close window |
| `<C-h/j/k/l>` | n | Navigate windows |
| `<` / `>` | v | Indent (stay in visual) |
| `gco` / `gcO` | n | Add comment below / above |
| `q:` | n | Disabled (mapped to `<Nop>`) |

### Noice

| Key | Action |
|-----|--------|
| `<leader>nl` | Last message |
| `<leader>nh` | History |
| `<leader>na` | All messages |
| `<leader>nd` | Dismiss |
| `<leader>nf` | Telescope picker |

### Explorer (yazi)

| Key | Action |
|-----|--------|
| `<leader>e` | Open yazi |

### Oil

| Key | Action |
|-----|--------|
| `<leader>o` | Open Oil |

### Terminal (toggleterm)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>aa` | n | Toggle terminal |
| `<Esc>` | t | Exit terminal insert mode |

### Copilot

| Key | Action |
|-----|--------|
| `<S-Tab>` | Accept suggestion |
| `<C-j>` | Accept next word |
| `<C-]>` | Dismiss suggestion |

---

## Architecture

```
flake.nix              # inputs: nixpkgs, flake-parts, nvf
config/
  default.nix          # imports opts, keymaps, plugins/
  opts.nix             # vim options, globals, visuals
  keymaps.nix          # global keybindings
  plugins/
    default.nix        # imports all plugin categories
    colors/            # colorschemes
    cmp/               # completion + autopairs
    dashboards/        # start screen
    explorer/          # file explorers
    git/               # git integration
    lsp/               # language servers + conform
    ui/                # statusline, bufferline, noice, etc.
    utils/             # telescope, treesitter, copilot, etc.
```

### Enabling / Disabling Plugins

Each category has a `default.nix` with import lines. Comment/uncomment to toggle:

```nix
# config/plugins/explorer/default.nix
{
  imports = [
    #./nvim-tree.nix
    ./yazi.nix      # active
    #./oil.nix
  ];
}
```

### Raw Plugins (not in nvf)

```nix
vim.startPlugins = [ pkgs.vimPlugins.some-plugin ];
vim.luaConfigRC.some-plugin = lib.nvim.dag.entryAnywhere ''
  require('some-plugin').setup({ ... })
'';
```

`entryAnywhere` / `entryAfter` / `entryBefore` control Lua load order via a DAG.

---

## Known Issues

### yazi-nvim: find dialog loop

**Symptom:** Inside Neovim, yazi's find dialog opens spontaneously and immediately reopens after `<Esc>`. Requires killing the process.

**Notes:**
- Does not happen in standalone yazi
- Affects both `openYazi` and `yaziToggle` mappings
- Something in yazi-nvim's event loop continuously sends the find trigger to yazi's stdin

**Workaround:** None confirmed. If it recurs, note what action preceded it and check [yazi-nvim issues](https://github.com/mikavilpas/yazi.nvim/issues).
