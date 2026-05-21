-- lua/plugins/diffview.lua
return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewFileHistory",
		"DiffviewRefresh",
	},
	keys = {
		{
			"<leader>gd",
			function()
				if next(require("diffview.lib").views) == nil then
					vim.cmd("DiffviewOpen")
				else
					vim.cmd("DiffviewClose")
				end
			end,
			desc = "Toggle Diffview",
		},
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History (current)" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "File History (repo)" },
	},
	opts = {
		enhanced_diff_hl = true, -- better syntax highlighting in diffs
		view = {
			merge_tool = {
				layout = "diff3_mixed", -- 3-way merge layout for conflict resolution
			},
		},
	},
}
