-- disable netrw at the very start of your init.lua (strongly advised)
--
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.cmd('source C:/Users/Itamar/AppData/Local/nvim/vim/without_plugins.vim')

-- Setting command to edit this file
vim.api.nvim_create_user_command('EditConfig', 'e C:/Users/Itamar/AppData/Local/nvim/init.lua', {desc='Edit the config file'})

vim.opt.inccommand = 'split'
vim.opt.completeopt = {'menuone','noselect','noinsert'}
vim.opt.mouse = 'a'
vim.opt.laststatus = 3

-- Telescope
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '//', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader><Tab>', '<cmd>Telescope buffers<cr>')

-- Highlight Yank 
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  desc = "Briefly highlight yanked text"
})

vim.cmd.highlight({"WinSeparator", "guibg=None"})

-- requires for lazy and other configs
require('config.lazy')

-- Chose random color Scheme
function chooseRandomColorScheme(colors)
	math.randomseed(os.time())
	local randIndex = math.random(#colors)
	chosenColor = colors[randIndex]
	vim.cmd.colorscheme(chosenColor)
	return chosenColor
end
mycolors = {'lucario', 'retrobox', 'badwolf', 'brogrammer', 'molokai', 'janah', 'nord', 'habamax'}
newColor = chooseRandomColorScheme(mycolors)
vim.notify("Chose "..newColor.." Colorscheme")
vim.api.nvim_create_user_command('ChooseRandomColorScheme', 'lua chooseRandomColorScheme(mycolors)', {})

-- LSP Package Manager
require("config.lsp")

vim.cmd('let g:sneak#label = 1')


require('mini.operators').setup()
require('mini.pairs').setup()
require('config.lualine')
