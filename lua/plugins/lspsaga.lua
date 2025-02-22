return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      definition = {
        keys = {
          edit = "o",
          vsplit = "v",
          split = "s",
        },
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
    "neovim/nvim-lspconfig",
  },
}
