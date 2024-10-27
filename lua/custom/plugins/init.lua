-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = 'copilot',
      auto_suggestions_provider = 'copilot',
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      {
        'zbirenbaum/copilot.lua',
        opts = {},
      }, -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
  { -- Leap plugin for enhanced navigation
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  -- {
  --   'ruifm/gitlinker.nvim',
  --   dependencies = {
  --     {
  --       'nvim-lua/plenary.nvim',
  --     },
  --   },
  --   config = function()
  --     require('gitlinker').setup {
  --       opts = {
  --         -- Opens the URL in your default browser
  --         action_callback = require('gitlinker.actions').open_in_browser,
  --         add_current_line_on_normal_mode = true,
  --         git_command = 'git rev-parse HEAD',
  --         -- Add current line number to URL in normal mode
  --         print_url = true,
  --       },
  --       -- mappings = nil, -- Disable default mappings
  --     }
  --
  --     -- Set up a custom key mapping (optional)
  --     -- vim.api.nvim_set_keymap('n', '<leader>gy', "<cmd>lua require'gitlinker'.get_buf_range_url('n')<CR>", { silent = true, noremap = true })
  --   end,
  -- },
  {
    'linrongbin16/gitlinker.nvim',
    cmd = 'GitLink',
    opts = {},
    keys = {
      { '<leader>gy', '<cmd>GitLink<cr>',  mode = { 'n', 'v' }, desc = 'Yank git link' },
      { '<leader>gY', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = 'Open git link' },
    },
  },
  {
    'LintaoAmons/bookmarks.nvim',
    -- tag = "v0.5.4", -- optional, pin the plugin at specific version for stability
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
      { 'stevearc/dressing.nvim' }, -- optional: to have the same UI shown in the GIF
    },
  },
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      { "<leader>H", function() require("harpoon"):list():add() end, desc = "harpoon file", },
      { "<leader>h", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
      { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
      { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
      { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
      { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
      { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
    },
  },

}
