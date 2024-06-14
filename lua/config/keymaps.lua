-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set({ "n", "v" }, "<C-c>", "<ESC>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up

keymap.set("n", "J", "mzJ`z") -- maintain cursor position when condensing lines
keymap.set("n", "<C-d>", "<C-d>zz") -- remain cursor in the middle when page down
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
keymap.set("n", "<C-u>", "<C-u>zz") -- remain cursor in the middle when page up
keymap.set("n", "n", "nzzzv") -- remain cursor in the middle when navigating down search result
keymap.set("n", "N", "Nzzzv") -- remain cursor in the middle when navigating up search result

keymap.set({ "n", "v" }, "<leader>y", '"+y') -- yank content to system clipboard
keymap.set("n", "<leader>Y", '"+Y') -- yank the entire line to system clipboard

keymap.set({ "n", "v" }, "d", '"_d')
keymap.set({ "n", "v" }, "yd", "d")
keymap.set({ "n", "v" }, "c", '"_c')
keymap.set({ "n", "v" }, "yc", "c")
keymap.set({ "n", "v" }, "x", '"_x')
keymap.set({ "n", "v" }, "yx", "x")
keymap.set({ "n", "v" }, "s", '"_s')
keymap.set({ "n", "v" }, "ys", "s")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- find current word and replace

-- buffer management
keymap.set("n", "<c-x>", ":bd<CR>")

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>")

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sll", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- reverse indent and indent
-- -- Set mappings in insert mode
keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true })
keymap.set("i", "<Tab>", "<Tab>", { noremap = true, silent = true })

-- Set mappings in normal mode
keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })
keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })

-- Set mappings in visual mode
keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })

-- Diagnostics
keymap.set("n", "<leader>d", function()
  vim.diagnostic.goto_next()
end, opts)
