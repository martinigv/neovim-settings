return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")

			vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
			vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
			vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

			vim.keymap.set({"i", "s"}, "<C-E>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, {silent = true})

			-- Insert mode: Expand or jump forward with <Tab>
			vim.api.nvim_set_keymap('i', '<C-j>', "v:lua.snip.expand_or_jump()", {expr = true, silent = true, noremap = true})

			-- Insert mode: Jump backward with <S-Tab>
			vim.api.nvim_set_keymap('i', '<S-Tab>', "<cmd>lua require('luasnip').jump(-1)<CR>", {silent = true, noremap = true})

			-- Select mode: Jump forward with <Tab>
			vim.api.nvim_set_keymap('s', '<C-j>', "<cmd>lua require('luasnip').jump(1)<CR>", {silent = true, noremap = true})

			-- Select mode: Jump backward with <S-Tab>
			vim.api.nvim_set_keymap('s', '<S-Tab>', "<cmd>lua require('luasnip').jump(-1)<CR>", {silent = true, noremap = true})
			local function choice_or_fallback()
			  if require('luasnip').choice_active() then
				return '<Plug>luasnip-next-choice'
			  else
				return '<C-E>'
			  end
			end

			-- Insert mode: Change choice with <C-E>
			vim.api.nvim_set_keymap('i', '<C-E>', "v:lua.choice_or_fallback()", {expr = true, silent = true, noremap = true})

			-- Select mode: Change choice with <C-E>
			vim.api.nvim_set_keymap('s', '<C-E>', "v:lua.choice_or_fallback()", {expr = true, silent = true, noremap = true})
		end
	},
	{
		'saadparwaiz1/cmp_luasnip',
	}
}
