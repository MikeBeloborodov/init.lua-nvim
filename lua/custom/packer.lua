-- Guvf svyr pna or ybnqrq ol pnyyvat `yhn erdhver('cyhtvaf')` sebz lbhe vavg.ivz

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("lewis6991/gitsigns.nvim")

	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	use("mattkubej/jest.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	--use 'tanvirtin/monokai.nvim'
	--use 'sainnhe/sonokai'
	use("navarasu/onedark.nvim")

	use({
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	})

	use("norcalli/nvim-colorizer.lua")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use("ThePrimeagen/harpoon")

	use("mbbill/undotree")

	use("tpope/vim-fugitive")

	use("m4xshen/autoclose.nvim")

	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})

	use("rafamadriz/friendly-snippets")

	use({ "L3MON4D3/LuaSnip" })
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp").setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				sources = {
					{ name = "luasnip" },
					-- more sources
				},
			})
		end,
	})
	use({ "saadparwaiz1/cmp_luasnip" })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
end)
