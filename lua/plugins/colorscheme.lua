return {
  {
    "folke/tokyonight.nvim",
    lazy = false,          -- load immediately
    priority = 1000,       
    opts = {
      transparent = true,
      style = "night",
      terminal_colors = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  }
}
