return {
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }
					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

					-- setup icons for diagnostic messages
					local signs = {
						{ name = "DiagnosticSignError", text = "󰅚 " },
						{ name = "DiagnosticSignWarn", text = "󰀪 " },
						{ name = "DiagnosticSignHint", text = "󰋽 " },
						{ name = "DiagnosticSignInfo", text = "󰌶 " },
					}
					for _, sign in ipairs(signs) do
						vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
					end
				end,
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"emmet_language_server",
					"gopls",
					"jdtls",
					"lua_ls",
					"pyright",
					"tailwindcss",
					"ts_ls",
				},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})
		end,
	},
	-- Completions
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = "rafamadriz/friendly-snippets",
		version = "v0.4.1",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap
			keymap = {
				accept = "<C-y>",
				select_prev = "<C-p>",
				select_next = "<C-n>",
			},

			highlight = {
				use_nvim_cmp_as_default = true,
			},
			nerd_font_variant = "normal",

			-- experimental auto-brackets support
			accept = { auto_brackets = { enabled = true } },

			-- experimental signature help support
			-- trigger = { signature_help = { enabled = true } }
		},
	},
	-- Configure lua_ls
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
}
