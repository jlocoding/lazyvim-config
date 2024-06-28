return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "gs",
      delete = "ds",
      replace = "cs",
      find = "yf",
      find_left = "yF",
      highlight = "vs",
      update_n_lines = "",
    },
    search_method = "cover_or_next",
  },
  config = function(_, opts)
    require("mini.surround").setup(opts)
  end,
}
