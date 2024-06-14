return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    -- "nvim-telescope/telescope-file-browser.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false, desc = "Grep (root dir)" },
    { "<leader><space>", false, desc = "Find Files (root dir)" },
    { "<leader>s", false, desc = "Registers" },
    { "<leader>sd", false, desc = "Document diagnostics" },
    { "<leader>sD", false, desc = "Workspace diagnostics" },
    { "gd", false },
    {
      ";k",
      function()
        require("telescope.builtin").keymaps({
          previewer = true,
          initial_mode = "normal",
        })
      end,
      desc = "Registers",
    },
    {
      ";f",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          no_ignore = false,
          hidden = true,
          previewer = true,
        })
      end,
      desc = "Lists files in your current working directory, respects .gitignore",
    },
    {
      ";r",
      function()
        local builtin = require("telescope.builtin")
        builtin.live_grep({
          additional_args = { "--hidden" },
        })
      end,
      desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
    },
    {
      ";;",
      function()
        local builtin = require("telescope.builtin")
        builtin.resume()
      end,
      desc = "Resume the previous telescope picker",
    },
    {
      ";d",
      function()
        local builtin = require("telescope.builtin")
        builtin.diagnostics({
          initial_mode = "normal",
        })
      end,
      desc = "Lists Diagnostics for all open buffers or a specific buffer",
    },
    {
      ";b",
      function()
        local builtin = require("telescope.builtin")
        builtin.buffers({
          initial_mode = "normal",
        })
      end,
      desc = "Lists open buffers",
    },
    {
      ";s",
      function()
        local builtin = require("telescope.builtin")
        builtin.treesitter()
      end,
      desc = "Lists Function names, variables, from Treesitter",
    },
    -- {
    --   ";e",
    --   function()
    --     local telescope = require("telescope")
    --
    --     local function telescope_buffer_dir()
    --       return vim.fn.expand("%:p:h")
    --     end
    --
    --     telescope.extensions.file_browser.file_browser({
    --       path = "%:p:h",
    --       cwd = telescope_buffer_dir(),
    --       respect_gitignore = false,
    --       hidden = true,
    --       grouped = true,
    --       previewer = false,
    --       initial_mode = "normal",
    --       layout_config = { height = 40 },
    --     })
    --   end,
    --   desc = "Open File Browser with the path of the current buffer",
    -- },
  },
}
