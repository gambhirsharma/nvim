# My Neovim config

Release name: Eagle v1.0.0

Neovim version: 0.12.1

## Overview

Personal Neovim configuration based on Kickstart.nvim with lazy.nvim as the plugin manager. Designed for development with support for multiple languages including TypeScript, Elixir, and more.

## Directory Structure

```
.
├── after/                    # Filetype-specific configurations
│   ├── ftdetect/            # File type detection
│   ├── ftplugin/            # Filetype plugins (markdown, yaml, http, sql, etc.)
│   └── queries/             # Tree-sitter queries
├── lua/
│   ├── custom/              # Custom configuration
│   │   ├── config/          # Plugin configurations
│   │   ├── plugins/         # Plugin specifications
│   │   └── init.lua         # Custom init
│   └── kickstart/           # Kickstart health checks and plugins
├── plugin/                  # General plugins (autosave, keymaps, terminal, etc.)
├── snippets/                # Snippets (markdown, js, ts, css, http, elixir, etc.)
├── mcphub/                  # MCP server configurations
├── init.lua                 # Main entry point
└── stylua.toml             # Code formatter config
```

## Key Features

- **Plugin Manager**: lazy.nvim
- **UI**: Mini.statusline with icons support
- **Treesitter**: Syntax highlighting for bash, lua, html, markdown, vim, typescript, elixir, heex
- **Keymaps**:
  - Leader: `<space>`
  - Local leader: `,`
  - Window navigation: `<C-h/j/k/l>`
  - Diagnostic navigation: `[d` / `]d`
- **Editor Settings**:
  - Nerd Font enabled
  - Line numbers with relative numbers
  - Spell checking (en_us)
  - Tab: 4 spaces, expandtab enabled
  - Clipboard sync enabled

## Installed Plugins

| Category | Plugins |
|----------|---------|
| UI | which-key.nvim, todo-comments.nvim, nvim-colorizer.lua, mini.nvim |
| Git | gitsigns.nvim |
| Treesitter | nvim-treesitter |
| LSP | lsp.lua (custom) |
| Telescope | telescope.lua (custom) |
| AI/Assistants | avante.nvim, copilot.lua, opencode.lua, mcphub.lua |
| Completion | completion.lua |
| Colorscheme | colorscheme.lua |
| Snippets | Multiple in snippets/ folder |
| Database | dadbod.lua |
| DevOps | k8s.lua |
| Notes | obsidian.lua |
| Utils | harpoon.lua, venv-selector.lua |

## Supported Languages

- TypeScript / JavaScript
- TypeScriptReact
- Elixir / Heex
- Markdown
- YAML
- HTTP
- SQL
- Astro
- CSS

## Dependencies

- Node.js (for LSP and formatters)
- Git (for plugin management)
- Nerd Font (recommended for icons)

## Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Manage plugins |
| `:checkhealth` | Check health |
| `:Tutor` | Learn Neovim basics |
