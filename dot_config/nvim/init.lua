vim.g.mapleader = ' '

local map = function(mode, lhs, rhs, opts)
    local default_opts = {
        noremap = true,
    }
    local final_opts = vim.tbl_deep_extend('force', default_opts, opts or {})
    vim.keymap.set(mode, lhs, rhs, final_opts)
end

map('i', 'jk', '<Esc>')
map('n', '<leader>pv', '<CMD>Explore<CR>')

map('n', '<C-j>', '<C-w>j')
map('n', '<leader><leader>x', '<CMD>source %<CR>')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Mainly selected and copied from "mini.basics"
local o       = vim.opt

-- General
o.undofile    = false                -- Enable persistent undo (see also `:h undodir`)
o.backup      = false                -- Don't store backup while overwriting the file
o.writebackup = false                -- Don't store backup while overwriting the file
o.mouse       = 'a'                  -- Enable mouse for all available modes
vim.cmd('filetype plugin indent on') -- Enable all filetype plugins

-- Appearance
o.breakindent    = true -- Indent wrapped lines to match line start
o.cursorline     = true -- Highlight current line
o.linebreak      = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
o.number         = true -- Show line numbers
o.relativenumber = true
o.splitright     = true -- Vertical splits will be to the right
o.wrap           = false -- Display long lines as just one line
o.signcolumn     = 'yes' -- Always show sign column (otherwise it will shift text)
o.termguicolors  = true -- Enable gui colors
o.pumblend       = 10 -- Make builtin completion menus slightly transparent
o.pumheight      = 10 -- Make popup menu smaller
o.listchars      = 'tab:» ,extends:…,precedes:…,nbsp:␣' -- Define which helper symbols to show
o.list           = true -- Show some helper symbols
o.colorcolumn    = '+1,+2' -- Draw line one column after `textwidth`
o.scrolloff      = 8

-- Editing
o.textwidth      = 120
o.tabstop        = 4
o.softtabstop    = 4
o.shiftwidth     = 4
o.expandtab      = true
o.ignorecase     = true    -- Ignore case when searching (use `\C` to force not doing that)
o.incsearch      = true    -- Show search results while typing
o.infercase      = true    -- Infer letter cases for a richer built-in keyword completion
o.smartcase      = true    -- Don't ignore case when searching if pattern has upper case
o.smartindent    = true    -- Make indenting smart
o.virtualedit    = 'block' -- Allow going past the end of line in visual block mode
o.formatoptions  = 'qjl1'  -- Don't autoformat comments
o.shortmess:append('WcC')  -- Reduce command line messages
o.splitkeep = 'screen'     -- Reduce scroll during window split

require('koalayt.plugin')
