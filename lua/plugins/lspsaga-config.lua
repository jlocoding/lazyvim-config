return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
    "yioneko/nvim-vtsls",
    init = function()
      require("lazyvim.util").lsp.on_attach(function(_, buffer) end)
    end,
  },
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    local keymap = vim.keymap

    keys[#keys + 1] = { "gd", "<cmd>Lspsaga peek_definition<CR>" }
    keys[#keys + 1] = { "gr", false }
    -- keys[#keys + 1] = { "gD", false }
    keys[#keys + 1] = { "gI", false }
    keys[#keys + 1] = { "gy", false }
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "<c-k>", false }
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>cA", false }
    keys[#keys + 1] = { "<leader>cr", false }

    require("lazyvim.util").lsp.on_attach(function(_, buffer)
      local opts = { noremap = true, silent = true, buffer = buffer }
      keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- Show LSP methods search results
      -- keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts) -- jump directly to definition
      keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
      keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts) -- Search and preview implementation of interfaces
      keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
      keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
      keymap.set("n", "<leader>D", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts) -- show  diagnostics for line
      keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for cursor
      keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
      keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
      keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
      keymap.set("n", "<leader>oo", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand si
    end)

    return {
      -- options for vim.diagnostic.config()
      ---@type vim.diagnostic.Opts
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
          },
        },
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = true,
        exclude = {}, -- filetypes for which you don't want to enable inlay hints
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      codelens = {
        enabled = false,
      },
      -- Enable lsp cursor word highlighting
      document_highlight = {
        enabled = true,
      },
      -- add any global capabilities here
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        tsserver = {
          enable = false,
        },
        vtsls = {
          keys = {
            {
              "<leader>oi",
              function()
                require("vtsls").commands.organize_imports(0)
              end,
              desc = "Organize Imports",
            },
            {
              "<leader>ru",
              function()
                require("vtsls").commands.remove_unused()
              end,
              desc = "Remove unused",
            },
          },
        },
        tailwindcss = {},
        helm_ls = {},
        yamlls = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          -- require("typescript").setup({ server = opts })
          return true
        end,

        tailwindcss = function(_, opts)
          local original_on_attach = opts.on_attach
          opts.on_attach = function(client, bufnr)
            -- Call the original on_attach if it exists
            if original_on_attach then
              original_on_attach(client, bufnr)
            end

            -- Add the tailwindcss-colors plugin
            require("tailwindcss-colors").buf_attach(bufnr)
          end
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    }
  end,
}
