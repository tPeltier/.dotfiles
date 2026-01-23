-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

require("opts") -- set options
require("keymaps") -- set keymaps
require("autocommands") -- set autocommands
require("lazy-bootstrap") -- bootstrap package manager lazy.nvim
require("lazy-plugins") -- install & configure plugins

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
