-- Persistence pre save
vim.api.nvim_create_autocmd("User", {
	pattern = "PersistenceSavePre",
	callback = function()
		local api = require("nvim-tree.api")
		local view = require("nvim-tree.view")

		if view.is_visible() then
			api.tree.close()
		end
	end,
})

-- Persistence post load
vim.api.nvim_create_autocmd("User", {
	pattern = "PersistenceLoadPost",
	callback = function()
		local api = require("nvim-tree.api")
		local view = require("nvim-tree.view")

		if not view.is_visible() then
			api.tree.toggle()
			api.tree.open()
		end
	end,
})

-- -- Workaround for nvim-tree not opening on BufEnter
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
-- 	pattern = "NvimTree*",
-- 	callback = function()
-- 		local api = require("nvim-tree.api")
-- 		local view = require("nvim-tree.view")
--
-- 		if not view.is_visible() then
-- 			api.tree.open()
-- 		end
-- 	end,
-- })

local disabled_filetypes = { "NvimTree", "help" }
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("MiniIndentScopeDisable", { clear = true }),
	callback = function(opts)
		local ftype = vim.bo[opts.buf].filetype
		if vim.tbl_contains(disabled_filetypes, ftype) then
			vim.b.miniindentscope_disable = true
		end
	end,
})
