require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = false,
    styles = {
        comments = { "italic" }
    },
    integrations = {
        harpoon = true,
    },
    custom_highlights = function(colors)
        return {
            -- defines from https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/mini.lua
            -- but only those mini.Statusline use
            MiniStatuslineDevinfo = { fg = colors.subtext1, bg = colors.surface1 },
            MiniStatuslineFileinfo = { fg = colors.subtext1, bg = colors.surface1 },
            MiniStatuslineFilename = { fg = colors.text, bg = colors.mantle },
            MiniStatuslineInactive = { fg = colors.blue, bg = colors.mantle },
            MiniStatuslineModeCommand = { fg = colors.base, bg = colors.peach, style = { "bold" } },
            MiniStatuslineModeInsert = { fg = colors.base, bg = colors.green, style = { "bold" } },
            MiniStatuslineModeNormal = { fg = colors.mantle, bg = colors.blue, style = { "bold" } },
            MiniStatuslineModeOther = { fg = colors.base, bg = colors.teal, style = { "bold" } },
            MiniStatuslineModeReplace = { fg = colors.base, bg = colors.red, style = { "bold" } },
            MiniStatuslineModeVisual = { fg = colors.base, bg = colors.mauve, style = { "bold" } },
        }
    end
})


-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- require("dracula").setup({
--     transparent_bg = true,
--     italic_comment = true,
--     overrides = {
--         NormalFloat = {
--             bg = "none"
--         },
--         -- LspInlayHint = {
--         --     fg = "#969696",
--         --     bg = "#2f3146",
--         -- }
--     },
-- })
--
-- vim.cmd.colorscheme "dracula"
