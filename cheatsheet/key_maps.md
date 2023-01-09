# ---My Keymaps---

## WhichKey: checking conflicting keymaps

  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **" f"**

  - INFO: rhs: `:FSToggle<CR>`

  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **"sd"**

  - INFO: rhs: `<Plug>(sandwich-delete)`

  - WARNING: conflicting keymap exists for mode **"n"**, lhs: **"sr"**

  - INFO: rhs: `<Plug>(sandwich-replace)`

# nvim

`space="leader"`

## Normal mode

### Basic

`leader+e="Open netrw"`

`leader+u="Show Undotree"`

`leader+s="Spell Check"`

`leader+b="Toggle Bionic Reading"`

`leader+f="Format File`

### Telescope

`leader+ff="Find Files"`

`leader+fg="Live Grep"`

`leader+fb="Find Buffers"`

`leader+fh="Help Tags"`

### LSP

`K="Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover()."`

`gd="Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition()."`

`gD="Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration()."`

`gi="Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation()."`

`go="Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition()."`

`gr="Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references()."`

`ctrl+k="Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound."`

`F2="Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename()."`

`F4="Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action()."`

`gl="Show diagnostics in a floating window. See :help vim.diagnostic.open_float()."`

`[d="Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev()."`

`]d="Move to the next diagnostic. See :help vim.diagnostic.goto_next()."`

### CMP

`enter="confirms selection"`

`ctrl+y="confirms selection"`

`up="Navigate to previous item on the list."`

`down="Navigate to the next item on the list."`

`ctrl+p="Navigate to previous item on the list."`

`ctrl+n="Navigate to the next item on the list."`

`ctrl+u="Scroll up in the item's documentation."`

`ctrl+f="Scroll down in the item's documentation."`

`ctrl+e="Toggles the completion."`

`ctrl+d="Go to the next placeholder in the snippet."`

`ctrl+b="Go to the previous placeholder in the snippet."`

`tab="Enables completion when the cursor is inside a word. If the completion menu is visible it will navigate to the next item in the list."`

`shift+tab="When the completion menu is visible navigate to the previous item in the list."`

## Visual mode

## Insert mode

## Cut mode

# tmux

## Leader

`ctrl+space="leader"`

## Window Management

`leader+w="new window"`

`leader+n="rename window"`

`leader+f="find window"`

## Pane Management

`leader+v="Split vertically"`

`leader+h="Split horizontally"`

`leader+x="kill pane"`

## Pane Navigation

`alt+j="previous window"`

`alt+k="next window"`

### Pane Resizing

`leader+alt+arrows`

`leader+z="full screen"`

## Pane Navigation

`leader+h=move left`

`leader+j=move down`

`leader+k=move up`

`leader+l=move right`

# zsh

`'v' in normal mode to edit command in nvim`
