-- other config https://github.com/olrtg/emmet-language-server
require("lspconfig").emmet_language_server.setup({})
return {
	-- lsp servers
	"neovim/nvim-lspconfig",
	init = function()
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		keys[#keys + 1] = { "<leader>ca", false }
	end,
	opts = {
		inlay_hints = { enabled = true },
		servers = {
			cssls = {},
			tailwindcss = {},
			prismals = {},
			html = {},
			lua_ls = {},
		},
		setup = {
			rust_analyzer = function()
				return true
			end,
		},
	},
}
