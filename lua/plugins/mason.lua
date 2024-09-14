return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mlsp = require("mason-lspconfig")

		mason.setup({
		})

		mlsp.setup({
			ensure_installed = {
				"lua_ls",
				"texlab",
				"ltex",
			},
		})
	end
}
