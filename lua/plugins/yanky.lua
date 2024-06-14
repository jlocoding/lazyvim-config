return {
  "gbprod/yanky.nvim",
  recommended = true,
  event = "LazyFile",
  opts = {
    highlight = { timer = 150 },
  },
  keys = {
    {
      ";y",
      function()
        require("telescope").extensions.yank_history.yank_history({
          initial_mode = "normal",
        })
      end,
      desc = "Open Yank History",
    },
  },
}
