-- markdown preview
-- https://github.com/iamcco/markdown-preview.nvim

vim.pack.add({ "https://github.com/iamcco/markdown-preview.nvim" })

-- Force le thème clair pour l'aperçu
vim.g.mkdp_theme = "light"

-- Indique au plugin d'utiliser votre feuille CSS personnalisée
-- vim.g.mkdp_markdown_css = vim.fn.expand("~/.config/nvim/markdown.css")

-- set to 1, the nvim will auto close current preview window when changing
-- from Markdown buffer to another buffer
-- default: 1
vim.g.mkdp_auto_close = 0
