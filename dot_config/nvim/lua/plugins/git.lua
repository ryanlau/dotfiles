return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(buffer)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "<leader>gh", gitsigns.preview_hunk_inline, "[G]it [H]unk Diff")
			end,
		},
	},
}
