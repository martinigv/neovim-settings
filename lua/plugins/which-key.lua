return {
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	  },
	  keys = {
		{
		  "<leader>?",
		  function()
			require("which-key").show({ global = false })
		  end,
		  desc = "Buffer Local Keymaps (which-key)",
		},
	  },
	  config = function()
	  	local wk = require("which-key")
		wk.add({
			{ "<C-n>", "<cmd>Neotree right toggle<cr>" },
			{ "<leader>e", "<cmd>Neotree focus<cr>" },
			
			{ "<leader>f", group = "telescope" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },

		})
	  end
	}
}
