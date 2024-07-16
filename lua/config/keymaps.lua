-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- vim-visual-multi keymap sheet
-- <c-n> -- select next match
-- q --skip next match
-- \\A select all match
-- https://github.com/mg979/vim-visual-multi
------------

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- delete switch buffer
-- keymap.del("n", "<S-l>")
-- keymap.del("n", "[b")
-- keymap.del("i", "<C-l>")
------------------------

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")
-- keymap.set("i", "<a-l>", "<ESC>l", opts())
-- keymap.set("i", "<a-h>", "<ESC>h", opts())

-- ---------- 视觉模式 ---------- ---
keymap.set("v", "<s-h>", "^")
keymap.set("v", "<s-l>", "$")

-- ---------- 正常模式 ---------- ---
-- 窗口
-- 新增水平窗口
keymap.set("n", "<leader>ss", "<C-w>v", { desc = "verticle split window" })
-- 新增垂直窗口
keymap.set("n", "<leader>sv", "<C-w>s", { desc = "horizon split window" })
-- select all
keymap.set("n", "<C-a>", "GVgg")
-- quick move cursor
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("n", "dH", "d^")
keymap.set("n", "dL", "d$")
-- no highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "cancel highlight", silent = true })
-- close window
keymap.set("n", "<leader>wd", "<C-w>c", { desc = "close window" })

-- print current time
-- keymap.set('n', '<leader>t', function()
--   -- print current time
--   local t = os.date("*t")
--   local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
--   print(time)
-- end, { desc = "Print Current Time", silent = true })

-- ---------- 选择模式 ---------- ---

-- ---------- 命令模式 ---------- ---
-- stop search something or command line
keymap.set("c", "jk", "<c-c>", opts)

-- fittencode
keymap.set("i", "<a-j>", function()
	require("fittencode").accept_all_suggestions()
end, { desc = "accept_all_suggestions", silent = true, noremap = true })

keymap.set("i", "<a-k>", function()
	require("fittencode").dismiss_suggestions()
end, { desc = "dismiss_all_suggestions", silent = true, noremap = true })

vim.keymap.set("n", "<leader>fc", "<cmd>Fitten start_chat<cr>", { desc = "start_chat" })
