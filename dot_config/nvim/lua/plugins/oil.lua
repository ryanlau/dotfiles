return {
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		opts = {
			skip_confirm_for_simple_edits = false,
			float = {
				max_height = 40,
				max_width = 80,
				padding = 10,
			},
		},
		dependencies = { { "echasnovski/mini.icons" } },
		keys = {
			{ "-", "<CMD>Oil --float<CR>", desc = "Open Oil" },
		},
	},
}
