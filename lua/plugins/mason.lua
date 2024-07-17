return {
	"williamboman/mason.nvim",
	opts = {
		-- 提前安装
		ensure_installed = {
			"stylua",
			"luacheck",
			"shellcheck",
			"shfmt",
			"tailwindcss-language-server",
			"css-lsp",
		},
	},
}
