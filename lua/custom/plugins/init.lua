-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Centers view after Ctrl-d' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Centers view after Ctrl-u' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Centers view after "n" (next result)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Centers view after "N" (previous result' })

-- virtual env for neovim plugin
vim.g.python3_host_prog = '~/venvs/neovim/bin/python'

-- wrapping text at 120 characters
vim.opt.textwidth = 120
-- highlights column after wrapping line
vim.opt.colorcolumn = '+1'

-- default to 4 spaces
vim.opt.shiftwidth = 4

return {}
