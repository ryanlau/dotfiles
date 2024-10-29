return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "echasnovski/mini.icons" },
		opts = {
			options = {
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_x = { "filetype" },
				lualine_b = {
					{
						"branch",
						icons_enabled = false,
					},
					"diff",
					"diagnostics",
				},
			},
		},
	},
}
