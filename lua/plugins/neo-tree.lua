return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>fe",
      false,
      desc = "Explorer NeoTree (root dir)",
    },

    {
      ";e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    { "<leader>e", false, desc = "Explorer NeoTree (root dir)", remap = true },
  },
}
