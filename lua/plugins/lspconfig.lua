return {
	{
		"neovim/nvim-lspconfig",
		event = {"BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{"antosha417/nvim-lsp-file-operations", config = true },
			{"folke/neodev.nvim", opts = {}},
		},
		config = function()
			local lsp = require("lspconfig")
			local mlsp = require("mason-lspconfig")
			local clsp = require("cmp_nvim_lsp")

			local capabilities = clsp.default_capabilities()
			local opts = {noremap = true, silent = true}
			vim.api.nvim_set_keymap('n', '<leader>do', "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
			vim.api.nvim_set_keymap('n', '<leader>d[', "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
			vim.api.nvim_set_keymap('n', '<leader>d]', "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
			vim.api.nvim_set_keymap('n', '<leader>dl', "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
			local on_attach = function(client, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifuc")
				--mapping
				vim.api.nvim_buf_set_keymap(bufnr,"n","<leader>bD","<cmd>lua vim.lsp.buf.declaration()<cr>",opts)
				vim.api.nvim_buf_set_keymap(bufnr,"n","<leader>bd","<cmd>lua vim.lsp.buf.definition()<cr>",opts)
				vim.api.nvim_buf_set_keymap(bufnr,"n","<leader>bi","<cmd>lua vim.lsp.buf.implementation()<cr>",opts)
				vim.api.nvim_buf_set_keymap(bufnr,"n","<leader>bh","<cmd>lua vim.lsp.buf.hover()<cr>",opts)
			end
			require"lspconfig".lua_ls.setup({

			})
			require"lspconfig".clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = {"clangd"},
				filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
				root_dir = require("lspconfig.util").root_pattern(
					".clangd",
					'.clang-tidy',
					'.clang-format',
					'compile_commands.json',
					'compile_flags.txt',
					'configure.ac',
					'.git'
				),
				single_file_support = true
			})

			require"lspconfig".texlab.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = {"texlab"},
				filetypes = {"tex", "plaintex", "bib"},
				settings = {
					texlab = {
					auxDirectory = ".",
					bibtexFormatter = "texlab",
					build = {
					  args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
					  executable = "latexmk",
					  forwardSearchAfter = false,
					  onSave = false
					},
					chktex = {
					  onEdit = false,
					  onOpenAndSave = false
					},
					diagnosticsDelay = 300,
					formatterLineLength = 80,
					forwardSearch = {
					  args = {}
					},
					latexFormatter = "latexindent",
					latexindent = {
					  modifyLineBreaks = false
					}
				  }
				},
				single_file_support = true
			})
			local servers = { "clangd", "texlab" }
			for _, lsp in pairs(servers) do 
				require("lspconfig")[lsp].setup {
					on_attach = on_attach,
					capabilities = capabilities,
				}
			end
	    end
	},
}
