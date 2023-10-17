local Remap = require("dumbsterfire.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap
local builtin = require("telescope.builtin")

nnoremap("<leader>ex", ":Ex<CR>", { desc = "Open netrw" })
nnoremap("<leader>u", ":UndotreeShow<Cr>", { desc = "Show Undotree" })
nnoremap("<leader>s", "z=", { desc = "Spell Check" })
nnoremap("<leader>b", ":FSToggle<Cr>", { desc = "Toggle Bionic Reading" })
nnoremap("<leader>q", "@q", { desc = "Call 'q' macro one time" })

-- restart LSP 
nnoremap("<leader>r", ":LspRestart<CR>", { desc = "Restart LSP"})

-- telescope
nnoremap('<leader>ff', builtin.find_files, { desc = "Find Files" })
nnoremap('<leader>fg', builtin.live_grep, { desc = "Live Grep" })
nnoremap('<leader>fb', builtin.buffers, { desc = "Find Buffers" })
nnoremap('<leader>fh', builtin.help_tags, { desc = "Help Tags" })
-- nnoremap('<leader>ft', builtin.current_buffer_fuzzy_find, { desc = "Buffer FZF" })

nnoremap("<leader>f", function()
    vim.lsp.buf.format()
end, { desc = "Format Buffer" })
