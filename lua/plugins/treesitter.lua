return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",      -- update parsers on install
    lazy = false,             -- load immediately at startup
    opts = {                  -- this table will be passed to setup()
      ensure_installed = {
        "c", "cpp", "typescript", "python", "lua", "vim", "vimdoc", "query",
        "markdown", "markdown_inline",
      },
      sync_install = false,
      auto_install = true,
      ignore_install = { "javascript" },
      highlight = {
        enable = true,
        disable = { "c", "rust" },
        additional_vim_regex_highlighting = false,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
