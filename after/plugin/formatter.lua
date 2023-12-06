require("conform").setup({
	formatters_by_ft = {

		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "prettier" },
		typescript = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		rust = { "rustfmt" },
		vue = { "prettier" },
		typescriptreact = { "prettier" },
		javascriptreact = { "prettier" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
