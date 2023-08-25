require("dumbsterfire.packer")
require("dumbsterfire.set")
require("dumbsterfire.remap")


--  which-key setup
local wk = require("which-key")
wk.register(mappings, opts)

-- snippets
require("luasnip.loaders.from_vscode").lazy_load()

