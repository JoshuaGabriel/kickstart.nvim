return {
    {
        'linrongbin16/gitlinker.nvim',
        cmd = 'GitLink',
        opts = {
            -- router = {
            --   browse = {
            --     -- Replace with your actual GitHub Enterprise host pattern
            --     -- The key is a Lua pattern (regex). '%.' escapes the dot.
            --     ["^gitlab%.clyso%.com"] = require('gitlinker.routers').gitlab_blame,
            --     -- You can add other custom hosts here too:
            --     -- ["^gitlab%.mycompany%.com"] = require('gitlinker.routers').gitlab_browse,
            --   },
            --   blame = {
            --     ["^gitlab%.clsyo%.com"] = require('gitlinker.routers').gitlab_blame,
            --     -- ["^gitlab%.mycompany%.com"] = require('gitlinker.routers').gitlab_blame,
            --   },
            -- }
        },
        keys = {
            { '<leader>gy', '<cmd>GitLink<cr>',  mode = { 'n', 'v' }, desc = 'Yank git link' },
            { '<leader>gY', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = 'Open git link' },
        },
    },

    {
        'romgrk/barbar.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

}
