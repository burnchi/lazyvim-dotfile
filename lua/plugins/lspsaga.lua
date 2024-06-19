-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
--     vim.keymap.set(
--       { 'n', 'v' },
--       '<space>cs',
--       '<cmd>Lspsaga code_action<cr>',
--       opts
--     )
--   end,
-- })

return {
  'nvimdev/lspsaga.nvim',
  event = { "LspAttach" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      '[d',
      '<cmd>Lspsaga diagnostic_jump_prev<CR>',
      {

        silent = true,
        desc = 'diagnostic_jump_prev'
      }
    },
    {
      ']d',
      '<cmd>Lspsaga diagnostic_jump_next<CR>',
      {
        silent = true,
        desc = 'diagnostic_jump_next'
      }
    },
    {
      '<leader>pd',
      '<cmd>Lspsaga peek_definition<CR>',
      {
        silent = true,
        desc = 'peek definition'
      }
    },
    {
      '<leader>pt',
      '<cmd>Lspsaga peek_type_definition<CR>',
      {
        silent = true,
        desc = 'peek type_definition'
      }
    },
    -- {
    --   '<leader>o',
    --   '<cmd>Lspsaga outline<cr>',
    --   desc = 'symbol outline'
    -- },
    {
      '<leader>r',
      '<cmd>Lspsaga rename<cr>',
      desc = 'Global Rename'
    },
    -- {
    --   '<leader>ca',
    --   function()
    --     require("lspsaga.codeaction").code_action({ context = { only = "source" } })
    --   end,
    --   desc = 'Code Action'
    -- },
    {
      'K',
      '<cmd>Lspsaga hover_doc<cr>',
      desc = 'show Doc'
    },
  },
  -- config = function()
  -- local keymap = vim.keymap
  -- require('lspsaga').setup({
  opts = {
    ui = {
      border = 'rounded',
    },
    lightbulb = {
      enable = false,
    },

  }
  -- })

  -- end,
}
