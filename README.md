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
    - Refactor
    - https://github.com/ziontee113/syntax-tree-surfer
    - https://github.com/napmn/react-extract.nvim
    - https://github.com/ray-x/navigator.lua
  - Lua Programming
    - create a function that will return only one table per method call
  - Built-in spell checker
    - learn how it works in vim
