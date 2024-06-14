return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup({})
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Add file to Harpoon" })
    vim.keymap.set("n", ";h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon Quick Menu" })

    vim.keymap.set("n", ";1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to File 1" })
    vim.keymap.set("n", ";2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon to File 2" })
    vim.keymap.set("n", ";3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon to File 3" })
    vim.keymap.set("n", ";4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon to File 4" })

    -- -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", ";p", function()
      harpoon:list():prev()
    end, { desc = "Harpoon previous file" })
    vim.keymap.set("n", ";n", function()
      harpoon:list():next()
    end, { desc = "Harpoon next file" })
  end,
}
