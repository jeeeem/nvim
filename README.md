#### Documentation

This is my own neovim configuration, this may not work properly in your machine as it is
configured for my own personal use.

#### Configuration

##### Plugins

- These are all the plugins that have been use in this configuration

##### Keymaps

- These are all the default/custom keybindings use in this configuration

##### Autocommands & Commands

- These are all autocommands and custom commands use in this configuration

---

##### Rollback

- Breaking changes to a plugin that needs to rollback
  - null-ls
    - https://github.com/jose-elias-alvarez/null-ls.nvim/issues/344#issuecomment-1114036678
    - lsp api changes
  - DAPInstall
    - https://github.com/Pocco81/dap-buddy.nvim/issues/71#issue-1210471404
    - use this commit until dap-buddy.nvim is ready

##### Future Goals

- [ ] Installer Script for my own neovim config
- [ ] Convert remaining vim configs to lua
- [ ] Create a documentation for all keybindings, plugins and other utilities use in the config

---

##### TODO

- **Priority**

  - Migrate to new `lsp-installer` setup
    - https://github.com/williamboman/nvim-lsp-installer/pull/635
    - https://github.com/AstroNvim/AstroNvim/pull/376

- **General**

  - Keymaps
    - Create a module that can be imported from the other config
  - Log
    - Configure nvim notify or struct log

- **Plugins**

  - Alpha
    - Customize Dashboard
  - Alacritty
    - Shift key
  - Dial
    - Add more values
  - Legendary
    - Add more keymaps and commands
    - Bind default keybindings in keymaps.lua
  - Luasnip
    - Add more snippets make it usable
    - Keymap for choice nodes (luasnip-next-choice)
  - Signature
    - Float in the top
  - LSP Floating window
    - Adjust z index
  - Persistence
    - Try session management plugin
  - PrettyFold
    - Add more matchup patterns for other programming languagee syntax
  - Nvim-ts-rainbow
    - Use tokyonight colors to the table hex codes

- **Custom Plugin/Commands**

  - Cheatsheet Plugin (todo)
    - Viewing personal notes for how the function words by fuzzy searching
  - DeleteHiddenBuffers (fix)
    - Ignore terminal buffer

- **Snippets**

  - .justfile
    - create a snippet for running package json

- **Others**

  - Try Plugins

    - https://github.com/ThePrimeagen/refactoring.nvim
    - https://github.com/ziontee113/syntax-tree-surfer
    - https://github.com/napmn/react-extract.nvim
    - https://github.com/ray-x/navigator.lua
    - https://github.com/Shatur/neovim-session-manager
    - https://github.com/m-demare/attempt.nvim
    - https://github.com/ghillb/cybu.nvim
    - https://github.com/b0o/incline.nvim
    - https://github.com/smjonas/inc-rename.nvim
    - https://github.com/kylechui/nvim-surround
    - https://github.com/ziontee113/color-picker.nvim
    - https://github.com/tiagovla/scope.nvim
    - https://github.com/anuvyklack/hydra.nvim
    - https://github.com/nvim-treesitter/nvim-treesitter-context
    - https://github.com/nvim-neotest/neotest
    - https://github.com/lewis6991/spellsitter.nvim
    - https://github.com/ldelossa/buffertag
    - https://git.sr.ht/~whynothugo/lsp_lines.nvim
    - https://github.com/AckslD/nvim-FeMaco.lua
    - https://github.com/miversen33/import.nvim
    - https://github.com/zbirenbaum/copilot-cmp
    - https://github.com/charludo/projectmgr.nvim
    - https://github.com/tzachar/cmp-tabnine
    - https://github.com/glepnir/lspsaga.nvim

    - https://github.com/williamboman/mason.nvim
    - https://github.com/williamboman/mason-lspconfig.nvim

  - Lua Programming
    - create a function that will return only one table per method call
  - Built-in spell checker
    - learn how it works in vim
