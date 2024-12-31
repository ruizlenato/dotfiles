return {
	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("config.copilot")
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		build = "make tiktoken",
		lazu = true,
		opts = {},
	},

	-- lsp and completions
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp")
		end,
		dependencies = {
			{
				"nvimtools/none-ls.nvim",
				config = function()
					require("config.null-ls")
				end,
			},
			{
				"j-hui/fidget.nvim",
				config = true,
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			-- snippets
			"dcampos/nvim-snippy",

			-- sources
			"FelipeLema/cmp-async-path",
			"SergioRibera/cmp-dotenv",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"dcampos/cmp-snippy",
			"hrsh7th/cmp-buffer",
			"mtoohey31/cmp-fish",
		},
		config = function()
			require("config.cmp")
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle" },

		config = function()
			require("trouble").setup({
				fold_open = "",
				fold_closed = "",
				indent_lines = false,
				signs = {
					error = "",
					warning = "",
					hint = "",
					information = "",
					other = "X",
				},
			})
			vim.api.nvim_set_hl(0, "TroubleText", {})
			vim.api.nvim_set_hl(0, "TroubleIndent", {})
			vim.api.nvim_set_hl(0, "TroubleLocation", {})
			vim.api.nvim_set_hl(0, "TroubleFoldIcon", {})
		end,
	},

	-- life quality
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{
				"AckslD/nvim-neoclip.lua",
				config = function()
					require("neoclip").setup({
						default_register = "+",
					})
				end,
			},
		},
		config = function()
			require("config.telescope")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{ "folke/which-key.nvim", lazy = true, config = true }, -- required in keybinds.lua

	-- Visual
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.indentscope").setup({
				symbol = "|",
			})
		end,
	},
	{
		"RRethy/nvim-base16",
		config = function()
			require("config.colorscheme")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = require("config.lualine"),
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			filetypes = {
				"*",
				"!lazy",
			},
			user_default_options = {
				names = false,
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "v4.*",
		opts = require("config.bufferline"),
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 25,
				},
				renderer = {
					indent_markers = {
						enable = true,
						inline_arrows = true,
						icons = {
							corner = "└",
							edge = "│",
							item = "│",
							bottom = "─",
							none = " ",
						},
					},
				},
			})
		end,
	},
	-- git
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			trouble = false,
			current_line_blame_opts = {
				delay = 100,
			},
			preview_config = {
				border = "double",
			},
		},
	},
	-- deps
	{
		"nvim-lua/plenary.nvim",
		branch = "master",
		lazy = true,
	},
}
