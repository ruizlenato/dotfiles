local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- formatters
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.biome,

		-- code actions
		null_ls.builtins.code_actions.gitsigns,

		-- diagnostics
		null_ls.builtins.diagnostics.fish,

		-- hover
		null_ls.builtins.hover.dictionary,
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
})
