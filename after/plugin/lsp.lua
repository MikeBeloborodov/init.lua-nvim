local lsp = require("lsp-zero").preset({})
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local ls = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

require("luasnip.loaders.from_lua").load({ paths = "~./config/nvim/snippets" })
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextCHangedI",
	enable_autosnippets = true,
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {
		"tsserver",
		"emmet_language_server",
		"pylsp",
		"html",
		"jsonls",
		"cssls",
		"rust_analyzer",
		"prismals",
		"lua_ls",
	},
	handlers = {
		lsp.default_setup,
	},
})

lsp.setup()
