vim.pack.add({"https://github.com/junegunn/vim-easy-align"})

-- Start interactive EasyAlign in visual mode (e.g. vipga)
vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", {
  remap = true,
  silent = true,
})

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", {
  remap = true,
  silent = true,
})
