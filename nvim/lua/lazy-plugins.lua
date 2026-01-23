-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--  To update plugins you can run
--    :Lazy update

-- NOTE: Here is where you install your plugins.
-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
require("lazy").setup({
	"christoomey/vim-tmux-navigator", -- tmux-vim integration
	"jez/vim-superman",
	-- 'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
	--

	-- modular approach: using `require 'path.name'` will
	-- include a plugin definition from file lua/path/name.lua

	require("plugins.base.autopairs"),
	require("plugins.base.blink-cmp"),
	require("plugins.base.conform"),
	require("plugins.base.gitsigns"),
	require("plugins.base.harpoon"),
	require("plugins.base.indent_line"),
	require("plugins.base.lint"),
	require("plugins.base.lspconfig"),
	require("plugins.base.mini"),
	require("plugins.base.obsidian"),
	require("plugins.base.sonokai"),
	require("plugins.base.telescope"),
	require("plugins.base.todo-comments"),
	require("plugins.base.treesitter"),
	require("plugins.base.twilight"),
	require("plugins.base.which-key"),
	require("plugins.base.zen"),

	-- require 'plugins.base.debug',
	-- require 'plugins.base.neo-tree',
	-- require 'plugins.base.tokyonight',

	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	-- { import = 'custom.plugins' },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
--
-- vim: ts=2 sts=2 sw=2 et
