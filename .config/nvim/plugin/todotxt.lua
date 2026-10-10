vim.pack.add({ "https://github.com/phrmendes/todotxt.nvim" })
vim.filetype.add({
	filename = {
		["todo.txt"] = "todotxt",
		["done.txt"] = "todotxt",
	},
})


require("todotxt").setup({
	todotxt = vim.env.HOME .. "/Markor/todo.txt",
	donetxt = vim.env.HOME .. "/Markor/done.txt",
	max_priority = "C",
	metadata = {
		-- asc/desc strings
		tag = { sort = "asc" },
		due = { sort = "desc" },
		-- custom comparator: a comes before b if tonumber(a) < tonumber(b)
		effort = {
			sort = function(a, b)
				return tonumber(a) < tonumber(b)
			end,
		},
	},
	ghost_text = {
		enable = true,
		mappings = {
			["(A)"] = "today",
			["(B)"] = "this week",
			["(C)"] = "this month",
			["(D)"] = "somedays",
		},
	},
})

-- highlights
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "tokyonight*",
	callback = function()
		-- priorités : dégradé chaud → froid
		vim.api.nvim_set_hl(0, "@todotxt.priority.a", { fg = "#f7768e", bold = false }) -- rouge
		vim.api.nvim_set_hl(0, "@todotxt.priority.b", { fg = "#ff9e64", bold = false }) -- orange
		vim.api.nvim_set_hl(0, "@todotxt.priority.c", { fg = "#9ece6a", bold = false }) -- vert
		vim.api.nvim_set_hl(0, "@todotxt.priority.d", { fg = "#7aa2f7", bold = false }) -- bleu
		vim.api.nvim_set_hl(0, "@todotxt.priority.other", { fg = "#bb9af7", bold = false }) -- magenta, E+

		-- métadonnées
		vim.api.nvim_set_hl(0, "@todotxt.context", { fg = "#7dcfff" }) -- cyan
		vim.api.nvim_set_hl(0, "@todotxt.project", { fg = "#e0af68", bold = false }) -- jaune
		vim.api.nvim_set_hl(0, "@todotxt.date", { fg = "#565f89", italic = true }) -- gris comment

		-- texte
		vim.api.nvim_set_hl(0, "@todotxt.pending", { fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "@todotxt.done", { fg = "#565f89", strikethrough = true })
	end,
})
vim.cmd("doautocmd ColorScheme")

-- Keymaps
vim.api.nvim_create_autocmd("FileType", {
	pattern = "todotxt",
	callback = function()
		-- Cycle priority (A → B → C → aucune)
		vim.keymap.set("n", "<leader>tp", function()
			require("todotxt").cycle_priority()
		end, { desc = "[T]odo cycle [P]riority", buffer = true })

		-- Toggle done (x 2026-09-10 → suppression ou ajout)
		vim.keymap.set("n", "<leader>td", function()
			require("todotxt").toggle_todo_state()
		end, { desc = "[T]oggle [D]one", buffer = true })

		-- Sort tasks (par défaut : priorité + texte)
		vim.keymap.set("n", "<leader>tst", function()
			require("todotxt").sort_tasks()
		end, { desc = "[S]ort [T]asks", buffer = true })

		-- -- Sort by priority
		-- vim.keymap.set("n", "<leader>tP", function()
		--   require("todotxt").sort_tasks_by_priority()
		-- end, { desc = "Sort by priority", buffer = true })

		-- Sort by project
		vim.keymap.set("n", "<leader>tsp", function()
			require("todotxt").sort_tasks_by_project()
		end, { desc = "[S]ort by [P]roject", buffer = true })

		-- Sort by context
		vim.keymap.set("n", "<leader>tsc", function()
			require("todotxt").sort_tasks_by_context()
		end, { desc = "[S]ort by [C]ontext", buffer = true })
	end,
})
-- Todo new note
vim.keymap.set("n", "<leader>tn", "<cmd>TodoTxt new<cr>", {desc="[T]odo [N]ew entry"})
-- Toggle todo
vim.keymap.set("n", "<leader>tt", "<cmd>TodoTxt<cr>", { desc = "[T]oggle [T]odo.txt", buffer = true })
