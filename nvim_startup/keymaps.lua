-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymaps = vim.keymap
local opts = {
	noremap = true,
	silent = true,
}

-- Increment/decrement
keymaps.set("n", "+", "<C-a>")
keymaps.set("n", "-", "<C-x>")

-- Delete a word backwards
--keymaps.set("n", "dw", "vb-d")

-- Select all
keymaps.set("n", "<C-a>", "gg<S-v>G")

-- Save File
keymaps.set("n", "<C-s>", ":w<Return>")

-- Jumplist
keymaps.set("n", "<C-m>", "<C-i>", opts)

-- Buffers
--keymaps.set("n", "<C><tab>", ":bn<Return>", opts)
--keymaps.set("n", "<C-s-tab>", ":bp<Return>", opts)
--keymaps.set("n", "<C-w>", ":bd<Return>:bn<Return>", opts)

-- Split window
keymaps.set("n", "ss", ":split<Return>", opts)
keymaps.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymaps.set("n", "sh", "<C-w>h")
keymaps.set("n", "sk", "<C-w>k")
keymaps.set("n", "sj", "<C-w>j")
keymaps.set("n", "sl", "<C-w>l")

-- Resize window
keymaps.set("n", "<C-w><left>", "<C-w><")
keymaps.set("n", "<C-w><right>", "<C-w>>")
keymaps.set("n", "<C-w><up>", "<C-w>+")
keymaps.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
--keymaps.set("n", "<C-j>", function()
-- vim.diagnostic.goto_next()
--end, opts)
