return {
  {
    "folke/tokyonight.nvim", -- must change if swapping colorscheme !! 
    lazy = false,          -- load immediately
    priority = 1000,       
    opts = {
      transparent = true,
      style = "night",  -- depends on colorscheme you're using
      terminal_colors = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts) -- must change if swapping colorscheme !!
      vim.cmd("colorscheme tokyonight") -- must change if swapping colorscheme !!
    end,
  }
}
