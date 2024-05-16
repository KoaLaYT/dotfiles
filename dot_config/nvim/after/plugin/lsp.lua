local lspconfig = require('lspconfig')

-- set border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'rounded'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Per language settings
local langs = {
    'lua_ls',
    'gopls',
    -- 'clangd',
    -- 'rust_analyzer',
    -- 'sqls',
    -- 'zls',
    -- 'tsserver',
    -- 'toy',
}

for _, lang in ipairs(langs) do
    local settings = require('koalayt.lspsettings.' .. lang)
    lspconfig[lang].setup(settings)
end


local augroup = vim.api.nvim_create_augroup('UserLspConfig', { clear = true, })
vim.api.nvim_create_autocmd('LspAttach', {
    group = augroup,
    callback = function(ev)
        local lsp_client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not lsp_client then return end

        if lsp_client and lsp_client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable()
        end
        -- Buffer local mappings.
        local opts = { buffer = ev.buf, }
        local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, opts)
        end
        map('n', 'K', vim.lsp.buf.hover)
        map('n', 'gD', vim.lsp.buf.declaration)
        map('n', 'gd', function() require('telescope.builtin').lsp_definitions({ show_line = false, }) end)
        map('n', 'gi', function() require('telescope.builtin').lsp_implementations({ show_line = false, }) end)
        map('n', 'gt', vim.lsp.buf.type_definition)
        map('n', 'gr', function() require('telescope.builtin').lsp_references({ show_line = false, }) end)
        map('n', 'gl', vim.diagnostic.open_float)
        map('n', '<Leader>rn', vim.lsp.buf.rename)
        map({ 'n', 'v', }, '<Leader>ca', vim.lsp.buf.code_action)

        local lsp_name = lsp_client.name
        -- sqls has formatting issue
        -- use prettier instead of tsserver
        if lsp_name == 'sqls' or lsp_name == 'tsserver' then
            return
        end
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = ev.buf,
            callback = function(eev)
                vim.lsp.buf.format({ async = false, })
            end,
        })
    end,
})
