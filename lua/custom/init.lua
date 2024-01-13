require("custom.remap")
require("custom.packer")
require("custom.set")
require("refactoring").setup()
require("nvim-jest").setup({
	-- Jest executable
	-- By default finds jest in the relative project directory
	-- To override with an npm script, provide 'npm test --' or similar
	jest_cmd = "npm test",

	-- Prevents tests from printing messages
	silent = true,
})
