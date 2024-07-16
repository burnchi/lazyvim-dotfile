return {
	-- tools
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
				"css-lsp",
			})
		end,
	},

	-- lsp servers
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
			---@type lspconfig.options
			servers = {
				cssls = {},
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},
				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				prismals = {},
				html = {},
				lua_ls = {
					-- mason = false, -- set to false if you don't want this server to be installed with mason
					-- Use this to add any additional keymaps
					-- for specific lsp servers
					-- ---@type LazyKeysSpec[]
					-- keys = {},
					-- settings = {
					-- 	Lua = {
					-- 		workspace = {
					-- 			checkThirdParty = false,
					-- 		},
					-- 		codeLens = {
					-- 			enable = true,
					-- 		},
					-- 		completion = {
					-- 			callSnippet = "Replace",
					-- 		},
					-- 		doc = {
					-- 			privateName = { "^_" },
					-- 		},
					-- 		hint = {
					-- 			enable = true,
					-- 			setType = false,
					-- 			paramType = true,
					-- 			paramName = "Disable",
					-- 			semicolon = "Disable",
					-- 			arrayIndex = "Disable",
					-- 		},
					-- 	},
					-- },
				},
			},
			setup = {
				rust_analyzer = function()
					return true
				end,
			},
		},
	},
	-- {
	-- 	"nvim-cmp",
	-- 	dependencies = { "hrsh7th/cmp-emoji" },
	-- 	opts = function(_, opts)
	-- 		table.insert(opts.sources, { name = "emoji" })
	-- 	end,
	-- },
}
