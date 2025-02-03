return {
  'preservim/tagbar',
  lazy = false,
  keys = {
    vim.keymap.set('n', '<leader>tb',"<cmd>TagbarToggle<cr>" , {desc = "Open Tagbar"})
  },
}
