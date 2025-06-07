vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.number = true

vim.opt.mouse = 'a'

vim.opt.tabstop = 4      -- Tab width = 4 spaces
vim.opt.shiftwidth = 4   -- Indentation width = 4 spaces
vim.opt.softtabstop = 4  -- Backspace deletes 4 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
-- let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'


-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
vim.api.nvim_set_keymap('n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>pf', '<cmd>lua require("null-ls").formatting.black()<CR>', { noremap = true, silent = true, desc = 'Format Python with Black' })


vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

function ViewBranchChanges()
  vim.ui.input(
    {
      prompt = 'Enter branch name (default: current): ',
      default = vim.fn.system('git rev-parse --abbrev-ref HEAD'):gsub(
        '\n', '')
    }, function(branch)
      if not branch or branch == '' then return end

      local base = vim.fn.system('git merge-base ' .. branch .. ' upstream/main'):gsub('\n', '')
      if base == '' then
        print("Could not determine base commit.")
        return
      end

      print("Files changed in " .. branch .. ":")
      vim.cmd('!git diff --name-only ' .. base .. ' ' .. branch)
    end)
end


vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>E", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set("n", "<leader>Y", "<cmd>Telescope yank_history<CR>",
  { noremap = true, silent = true, desc = "Open Yank History in Telescope" })

-- disable yanky  to allow tmux to handle copy paste buffer
-- vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
-- vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-w>%', '<C-w>v', { desc = 'Split window Vertically' })
vim.keymap.set('n', '<C-w>"', '<C-w>s', { desc = 'Split window Horizontally' })

vim.keymap.set("n", "<C-w>+", "<Cmd>resize +10<CR>", { noremap = true, silent = true, desc = "Increase Height" })
vim.keymap.set("n", "<C-w><", "<Cmd>vertical resize -13<CR>", { noremap = true, silent = true, desc = "Decrease Width" })
vim.keymap.set("n", "<C-w>>", "<Cmd>vertical resize +13<CR>", { noremap = true, silent = true, desc = "Increase Width" })
vim.keymap.set("n", "<C-w>_", "<Cmd>resize -10<CR>", { noremap = true, silent = true, desc = "Decrease Height" })
vim.keymap.set("n", "<C-w>-", "<Cmd>resize 9999<CR>", { noremap = true, silent = true, desc = "Maximize Height" })

vim.keymap.set({ 'n', 'v' }, '<leader>mm', '<cmd>BookmarksMark<cr>',
  { desc = 'Mark current line into active BookmarkList.' })
vim.keymap.set({ 'n', 'v' }, '<leader>mo', '<cmd>BookmarksGoto<cr>',
  { desc = 'Go to bookmark at current active BookmarkList' })
vim.keymap.set({ 'n', 'v' }, '<leader>ma', '<cmd>BookmarksCommands<cr>',
  { desc = 'Find and trigger a bookmark command.' })
vim.keymap.set({ 'n', 'v' }, '<leader>mg', '<cmd>BookmarksGotoRecent<cr>',
  { desc = 'Go to latest visited/created Bookmark' })
vim.keymap.set({ 'n', 'v' }, '<leader>mt', '<cmd>BookmarksTree<cr>', { desc = 'View Bookmark Tree' })

