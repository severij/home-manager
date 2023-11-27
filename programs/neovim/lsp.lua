local lspconfig = require'lspconfig'

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
}

lspconfig.nil_ls.setup{}
lspconfig.clojure_lsp.setup{}
lspconfig.pyright.setup{}

-- Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Bslash>t', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<Bslash>a', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<Bslash>s', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<Bslash>h', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<Bslash>r', vim.lsp.buf.rename, opts)
vim.keymap.set({'n', 'v'}, '<Bslash>f', vim.lsp.buf.format, opts)
vim.keymap.set('n', '<Bslash>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<Bslash>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<Bslash>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
