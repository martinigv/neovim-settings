-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")
vim.notify = require("notify")



-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10


vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- From: https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt#L4671-L4713
vim.o.foldmethod = "expr"
vim.o.foldexpr="vimtex#fold#level(v:lnum)"
vim.o.foldtext="vimtex#fold#text()"
-- I like to see at least the content of the sections upon opening
vim.o.foldlevel=2 

--vimtex config
vim.g.tex_flavor='latex'
vim.g.vimtex_quickfix_mode=0
vim.opt.conceallevel=1
vim.g.tex_conceal='abdmg'
vim.g.vimtex_view_general_viewer = "SumatraPDF"

--auto update plugins
vim.api.nvim_create_autocmd("VimEnter",{callback=function()require"lazy".update()end})

vim.cmd("colorscheme twilight256")
--
--vim.cmd [[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
--  highlight NormalNC guibg=none
--  highlight NormalNC ctermbg=none
--]]

