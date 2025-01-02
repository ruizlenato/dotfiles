vim.g.mapleader = ","
vim.g.maplocalleader = ","

local mappings = {
	-- comment
	{ "n", "<A-S-a>", "gcc", { desc = "Toggle comment", remap = true } },
	{ "v", "<A-S-a>", "gc", { desc = "Toggle comment", remap = true } },

	-- telescope
	{ "n", "<leader>tt", ":Telescope<cr>", { desc = "Telescope" } },
	{ "n", "<leader>tf", ":Telescope find_files<cr>", { desc = "Find files" } },
	{ "n", "<leader>tg", ":Telescope live_grep<cr>", { desc = "Live grep" } },
	{ "n", "<leader>tb", ":Telescope buffers<cr>", { desc = "Buffers" } },
	{ "n", "<leader>th", ":Telescope help_tags<cr>", { desc = "Help tags" } },
	{ "n", "<leader>tu", ":Telescope undo<cr>", { desc = "Undo tree" } },
	{ "n", "<leader>tc", ":Telescope neoclip<cr>", { desc = "Open neoclip" } },

	-- lazy
	{ "n", "<leader>ll", ":Lazy<cr>", { desc = "Lazy home" } },
	{ "n", "<leader>ls", ":Lazy sync<cr>", { desc = "Lazy sync" } },
	{ "n", "<leader>lc", ":Lazy clear<cr>", { desc = "Lazy clear" } },
	{ "n", "<leader>lu", ":Lazy update<cr>", { desc = "Lazy update" } },
	{ "n", "<leader>lp", ":Lazy profile<cr>", { desc = "Lazy profile" } },
	{ "n", "<leader>li", ":Lazy install<cr>", { desc = "Lazy install" } },

	-- lsp
	{ "n", "gD", vim.lsp.buf.declaration, { desc = "Jumps to the declaration" } },
	{ "n", "gd", vim.lsp.buf.definition, { desc = "Jumps to the definition" } },
	{ "n", "gi", vim.lsp.buf.implementation, { desc = "Lists all the implementations" } },
	{ "n", "<space>h", vim.lsp.buf.hover, { desc = "Displays hover information" } },
	{ "n", "<space>D", vim.lsp.buf.type_definition, { desc = "Jumps to the definition of the type" } },
	{ "n", "<space>rn", vim.lsp.buf.rename, { desc = "Renames all references" } },
	{ "n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code actions" } },
	{ "n", "gr", vim.lsp.buf.references, { desc = "Lists all the references" } },
	{ "n", "<space>f", vim.lsp.buf.format, { desc = "Formats a buffer" } },
	{ "n", "<space>e", vim.diagnostic.open_float, { desc = "Show diagnostics in a floating window" } },
	{ "n", "[d", vim.diagnostic.goto_prev, { desc = "Move to the previous diagnostic" } },
	{ "n", "]d", vim.diagnostic.goto_next, { desc = "Move to the next diagnostic" } },
	{ "n", "<space>q", vim.diagnostic.setloclist, { desc = "Add buffer diagnostics to the location list" } },

	-- trouble
	{ "n", "<space>t", ":Trouble diagnostics toggle<cr>", { desc = "Open Trouble" } },

	-- nvimtree
	{ "n", "<C-b>", ":NvimTreeToggle<cr>", { desc = "nvimtree toggle window" } },

	-- bufferline
	{ "n", "<A-,>", ":BufferLineCyclePrev<cr>" },
	{ "n", "<A-.>", ":BufferLineCycleNext<cr>" },

	-- persistence
	{ "n", "<leader>wr", ":lua require('persistence').select()<cr>", { desc = "Select a session to load" } },
	{ "n", "<leader>wd", ":lua require('persistence').load()<cr>", { desc = "Load last session for current dir" } },
	{ "n", "<leader>we", ":lua require('persistence').load({ last = true })<cr>", { desc = "Load last session" } },
	{ "n", "<leader>wc", ":lua require('persistence').stop()<cr>", { desc = "Stop persistence" } },

	-- copilot
	{ { "n", "v" }, "<A-'>", ":CopilotChatToggle<cr>", desc = "Toggle" },
	{ { "n", "v" }, "<leader>av", ":CopilotChatToggle<cr>", desc = "Toggle" },
	{ { "n", "v" }, "<leader>al", ":CopilotChatReset<cr>", desc = "Clear buffer and chat history" },
	{ { "n", "v" }, "<leader>a?", ":CopilotChatModels<cr>", desc = "Select Models" },
	{ { "n", "v" }, "<leader>aa", ":CopilotChatAgents<cr>", desc = "Select Agents" },
	{
		{ "n", "v" },
		"<leader>ap",
		function()
			local actions = require("CopilotChat.actions")
			require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
		end,
		desc = "Prompt actions",
	},
}

-- Which key registers
local wk = require("which-key")
wk.add({
	{ "<leader>l", group = "lazy" },
	{ "<leader>t", group = "telescope" },
	{ "<leader>w", group = "persistence" },
	{ "<leader>a", group = "copilot" },
})

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

for _, maps in pairs(mappings) do
	map(unpack(maps))
end
