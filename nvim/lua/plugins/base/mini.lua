return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- When editing via `sudoedit`/`sudo -e`, sudo sets $SUDO_USER in the
		-- editor's environment even though nvim itself runs as us, not root.
		-- Recolor the statusline mode badge as a loud warning so it's obvious
		-- this buffer is a privileged temp file that gets copied back on save.
		if vim.env.SUDO_USER then
			local sudo_hl = { bg = "#e33232", fg = "#000000", bold = true }
			for _, mode in ipairs({ "Normal", "Insert", "Visual", "Replace", "Command", "Other" }) do
				vim.api.nvim_set_hl(0, "MiniStatuslineMode" .. mode, sudo_hl)
			end
		end

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
