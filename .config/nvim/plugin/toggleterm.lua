vim.pack.add({"https://github.com/akinsho/toggleterm.nvim"})

require('toggleterm').setup({
direction = 'float',
float_opts={border = 'curved'}
})

-- vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", {
--   desc = "[T]erminal",
-- })
