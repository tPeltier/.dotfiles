return {
	"ThePrimeagen/harpoon",
	keys = {
		{
			"<leader>m",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Harpoon: add file",
		},
		{
			"<C-e>",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Harpoon: menu",
		},
		{
			"<leader>j",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Harpoon: file 1",
		},
		{
			"<leader>k",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Harpoon: file 2",
		},
		{
			"<leader>l",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Harpoon: file 3",
		},
		{
			"<leader>;",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Harpoon: file 4",
		},
	},
}
