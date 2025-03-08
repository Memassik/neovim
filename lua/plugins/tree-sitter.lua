return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs", -- Sets main module to use for opts
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
    },
    highlight = {
      enable = true,
      disable = function(bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 50000
      end,
      use_languagetree = true,
    },
    indent = { enable = true },
  },
}
