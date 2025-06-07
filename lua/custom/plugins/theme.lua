return {
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'tokyonight-night'

            vim.cmd.hi 'Comment gui=none'
        end,
    },

    { "catppuccin/nvim",    name = "catppuccin", priority = 1000 },
    { "sainnhe/everforest", name = "everforest", priority = 1000 },
    {
        "EdenEast/nightfox.nvim",
        name = "nightfox",
        priority = 999,
        init = function()
            -- vim.cmd.colorscheme 'dayfox'

            vim.cmd.hi 'Comment gui=none'
        end,
    },
}
