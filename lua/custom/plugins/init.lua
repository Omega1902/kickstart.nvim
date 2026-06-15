-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Centers view after Ctrl-d' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Centers view after Ctrl-u' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Centers view after "n" (next result)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Centers view after "N" (previous result' })

-- virtual env for neovim plugin
vim.g.python3_host_prog = vim.fn.expand('~/venvs/neovim/bin/python')

-- wrapping text at 120 characters
vim.o.textwidth = 120
-- highlights column after wrapping line
vim.o.colorcolumn = '+1'

-- default to 4 spaces
vim.o.shiftwidth = 4

-- don't enforce lower case w and q
vim.api.nvim_create_user_command("W", "write", {})
vim.api.nvim_create_user_command("Q", "quit", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- Kotlin settings
vim.pack.add({ gh "AlexandrosAlexiou/kotlin.nvim" })
require("kotlin").setup({
 root_markers = {
  "gradlew",
  ".git",
  "mvnw",
  "settings.gradle",
 },
 jvm_args = {
  "-Xmx8g",
 },
 build_tool = "gradle",
 file_templates = {
  enabled = false,
 },
})
