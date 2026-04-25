-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
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
      -- vim.o.foldcolumn = 'auto:8'
      vim.o.foldcolumn = "0"

      -- Keymaps for opening/closing all folds
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      -- Setup ufo with treesitter and indent providers
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end,
        -- Optional: Configure preview for folds
        -- preview = {
        --   win_config = {
        --     border = { '', '─', '', '', '', '─', '', '' },
        --     winhighlight = 'Normal:Folded',
        --     winblend = 0
        --   }
        -- }
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
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
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
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
  {
    "sindrets/diffview.nvim",
    enhanced_diff_hl = true, -- Enable enhanced diff highlighting
    use_icons = true,
    default = {
      layout = "diff2_horizontal", -- Start with a horizontal split
      winbar_info = false,         -- Disable winbar to reduce clutter
    },
    keymaps = {
      view = {
        -- Add a custom keymap to focus on one file
        { "n", "<leader>gf", "<cmd>DiffviewFocusFiles<cr>", { desc = "Focus on single file" } },
      },
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

  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    event = { { event = "BufReadCmd", pattern = "octo://*" } },
    config = function()
      require('octo').setup({
        use_local_fs = true,
        enable_builtin = true,
        default_to_projects_v2 = true,
        default_merge_method = "squash",
        picker = "telescope",
      })
    end,
  },


  {
    "tpope/vim-fugitive",
    lazy = false
  },
  -- {
  --   "Hoffs/omnisharp-extended-lsp.nvim",
  --   lazy = true,
  -- },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup()
      vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
  },


  -- {
  --   "seblyng/roslyn.nvim",
  --   dependencies = {
  --     "microsoft/python-type-stubs", -- Optional: for better Python interop if needed
  --   },
  --   ft = "cs",                       -- Only load for C# files
  --   opts = {
  --     config = {
  --       -- Specify your manual Roslyn installation
  --       cmd = {
  --         "dotnet",
  --         "/usr/local/roslyn/lib/net9.0/Microsoft.CodeAnalysis.LanguageServer.dll",
  --         "--logLevel=Information",
  --         "--extensionLogDirectory=" .. vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
  --       },
  --
  --       -- Unity-specific settings
  --       settings = {
  --         ["csharp|inlay_hints"] = {
  --           csharp_enable_inlay_hints_for_implicit_object_creation = true,
  --           csharp_enable_inlay_hints_for_implicit_variable_types = true,
  --           csharp_enable_inlay_hints_for_lambda_parameter_types = true,
  --           csharp_enable_inlay_hints_for_types = true,
  --           dotnet_enable_inlay_hints_for_parameters = true,
  --         },
  --         ["csharp|code_lens"] = {
  --           dotnet_enable_references_code_lens = true,
  --         },
  --         ["csharp|completion"] = {
  --           dotnet_show_completion_items_from_unimported_namespaces = true,
  --           dotnet_show_name_completion_suggestions = true,
  --         },
  --       },
  --
  --       -- Important for Unity: find the .sln file
  --       -- root_dir = require("roslyn.config").root_dir,
  --       root_dir = function(fname)
  --         return require("lspconfig.util").root_pattern("*.sln")(fname)
  --             or require("lspconfig.util").root_pattern("*.csproj")(fname)
  --       end,
  --
  --     },
  --
  --     -- Unity assemblies - add Unity's reference assemblies
  --     exe = {
  --       "dotnet",
  --       "/usr/local/roslyn/lib/net9.0/Microsoft.CodeAnalysis.LanguageServer.dll",
  --     },
  --   },
  -- },
  {
    "esmuellert/vscode-diff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
  },
  {
  "JoshuaGabriel/wayfinder.nvim",
  opts = {},
}

}
