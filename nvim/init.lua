require("dumbsterfire.set")
require("dumbsterfire.remap")
-- lsp setup
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

local wk = require("which-key")
wk.register(mappings, opts)

-- snippets
require("luasnip.loaders.from_vscode").lazy_load()

