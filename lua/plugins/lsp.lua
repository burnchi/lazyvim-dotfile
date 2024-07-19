local lsp = require("lspconfig")
-- other config https://github.com/olrtg/emmet-language-server
lsp.emmet_language_server.setup({})
return {
	-- lsp servers
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = true },
		servers = {
			cssls = {},
			tailwindcss = {},
			prismals = {},
			html = {},
			lua_ls = {},
		},
		-- 禁止用lspconfi setup rust_analyzer
		setup = {
			rust_analyzer = function()
				return true
			end,
		},
	},
}
