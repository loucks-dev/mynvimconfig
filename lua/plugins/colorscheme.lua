return {
	{
		"folke/tokyonight.nvim",
		lazy = true,          
		priority = 1000,
		opts = {
			transparent = true,
		}
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		opts = {
			disable_background = true,
			disable_float_background = true,
			disable_italics = true,
		},
	},
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		lazy = true,
		opts = {
			style = "darker", -- dark, darker, cool, warm, deep
			transparent = true,
		},
	},
	-- add more here
}
