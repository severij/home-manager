local wk = require'which-key'

wk.register({
  g = {
    D = { vim.lsp.buf.declaration, 'Jump to the declaration' },
    I = { vim.lsp.buf.implementation, 'Jump to the implementation' },
    d = { vim.lsp.buf.definition, 'Jump to the definition' },
    r = { vim.lsp.buf.references, 'List references to the symbol' }
  },
  ['-'] = { require'oil'.open, 'Open parent directory' },
  ['['] = {
    c = { '<Cmd>cprev<CR>', 'Previous quickfix error' },
    d = { vim.diagnostic.goto_prev, 'Previous diagnostic' },
    h = { require'gitsigns'.prev_hunk, 'Previous hunk' }
  },
  [']'] = {
    c = { '<Cmd>cnext<CR>', 'Previous quickfix error' },
    d = { vim.diagnostic.goto_next, 'Next diagnostic' },
    h = { require'gitsigns'.next_hunk, 'Next hunk' }
  },
  ['<C-c>'] = { '<Cmd>Bwipeout<CR>', 'Delete the current buffer, keep window layout' },
  ['<leader>'] = {
    f = {
      name = 'Telescope',
      b = { require'telescope.builtin'.buffers, 'Buffers' },
      c = { require'telescope.builtin'.commands, 'Commands' },
      f = { require'telescope.builtin'.find_files, 'Find files' },
      g = { require'telescope.builtin'.live_grep, 'Live grep' },
      h = { require'telescope.builtin'.help_tags, 'Help tags' },
      o = { require'telescope.builtin'.oldfiles, 'Previously opened files' }
    },
    g = {
      name = 'Git',
      S = { require'gitsigns'.stage_buffer, 'Stage all hunks in the current buffer' },
      U = { require'gitsigns'.reset_buffer_index, 'Unstage all hunks for current buffer in the index' },
      b = { require'gitsigns'.blame_line, 'Blame line' },
      d = { '<Cmd>DiffviewOpen<CR>', 'Open Diffview' },
      h = { '<Cmd>DiffviewFileHistory %<CR>', 'Open history of the current file in Diffview' },
      g = { require'neogit'.open, 'Open Neogit' },
      s = { require'gitsigns'.stage_hunk, 'Stage hunk at the cursor position' },
      r = { require'gitsigns'.reset_hunk, 'Reset hunk at the cursor position' }
    }
  }
}, {})
