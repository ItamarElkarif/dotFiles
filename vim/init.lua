-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('source ~/.config/nvim/init.vim')

vim.opt.inccommand = 'split'
vim.opt.completeopt = {'menuone','noselect','noinsert'}
vim.opt.mouse = 'a'
vim.opt.laststatus = 3


-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
