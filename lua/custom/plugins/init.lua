-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = true,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = 'copilot',
      copilot = {
        model = "claude-3.5-sonnet",
      },
      auto_suggestions_provider = 'copilot',
      behaviour = {
        auto_suggestions = false, -- Experimental stage
      },
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
  -- {
  --   'LintaoAmons/bookmarks.nvim',
  --   -- tag = "v0.5.4", -- optional, pin the plugin at specific version for stability
  --   dependencies = {
  --     { 'nvim-telescope/telescope.nvim' },
  --     { 'stevearc/dressing.nvim' }, -- optional: to have the same UI shown in the GIF
  --   },
  -- },
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      { "<leader>H", function() require("harpoon"):list():add() end,     desc = "harpoon file", },
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
      { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
      { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
      { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
      { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
    },
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'VeryLazy',
    config = function()
      -- Global folding options
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Keymaps for opening/closing all folds
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      -- Setup ufo with treesitter and indent providers
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end,
        -- Optional: Configure preview for folds
        preview = {
          win_config = {
            border = { '', '─', '', '', '', '─', '', '' },
            winhighlight = 'Normal:Folded',
            winblend = 0
          }
        }
      })
    end
  },
  {
    "gbprod/yanky.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      sync_with_numbered_registers = false,
      system_clipboard = {
        sync_with_ring = false,
        clipboard_register = nil,
      },
    },
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  }
}
