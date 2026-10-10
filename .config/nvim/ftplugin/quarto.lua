
local wk = require("which-key")
wk.add({
  { "<leader>q", group = "[Q]uarto" },
})

vim.keymap.set("n","<leader>qp","<Cmd>QuartoPreview<CR>",{buffer=true, desc="[Q]uarto[P]review"})

