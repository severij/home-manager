{ config, pkgs, ...}:
let
  inherit (builtins) readFile;
in
{
  enable = true;
  defaultEditor = true;
  extraLuaConfig = ''
    vim.g.mapleader = ' '
    vim.g.maplocalleader = '\\'

    ${readFile ./options.lua}

    vim.keymap.set('n', '<Esc>', '<Cmd>nohl<CR><Esc>') -- Clear the search highlighting whenever <Esc> is pressed.                           

    vim.cmd 'highlight WinSeparator guibg=None'
    vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber | startinsert'

    P = function(v)
      print(vim.inspect(v))
      return v
    end
  '';
  plugins = with pkgs.vimPlugins; [
    bufdelete-nvim
    ccc-nvim
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp_luasnip
    {
      plugin = diffview-nvim;
      type = "lua";
      config = ''
      require'diffview'.setup {
        default_args = {
          DiffviewOpen = { '--imply-local' },
        }
      }
      '';
    }
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        require 'gitsigns'.setup {
          current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
          current_line_blame_opts = {
            delay = 200,
            ignore_whitespace = true
          }
        }
      '';
    }
    indent-blankline-nvim
    {
      plugin = lsp_signature-nvim;
      type = "lua";
      config = "require'lsp_signature'.setup()";
    }
    luasnip
    {
      plugin = neodev-nvim;
      type = "lua";
      config = "require'neodev'.setup()";
    }
    neogit
    {
      plugin = comment-nvim;
      type = "lua";
      config = "require('Comment').setup()";
    }
    (with config.colorScheme.colors; {
      plugin = nvim-base16;
      type = "lua";
      config = ''
        local colorscheme = require'base16-colorscheme'
        local hi = colorscheme.highlight

        colorscheme.setup({
          base00 = '#${base00}', base01 = '#${base01}',
          base02 = '#${base02}', base03 = '#${base03}',
          base04 = '#${base04}', base05 = '#${base05}',
          base06 = '#${base06}', base07 = '#${base07}',
          base08 = '#${base08}', base09 = '#${base09}',
          base0A = '#${base0A}', base0B = '#${base0B}',
          base0C = '#${base0C}', base0D = '#${base0D}',
          base0E = '#${base0E}', base0F = '#${base0F}',
        })

        hi.LineNr = 'Comment'
        hi.CmpItemAbbr = 'None'
        hi.TelescopeBorder = 'Normal'
        hi.TelescopeNormal = 'Normal'
        hi.TelescopePromptBorder = 'Normal'
        hi.TelescopePromptTitle = 'Normal'
        hi.TelescopePreviewTitle = 'Normal'
        hi.TelescopeResultsTitle = 'Normal'
        hi.TelescopePromptNormal = 'Normal'
        hi.TelescopePromptPrefix = 'Normal'
      '';
    })
    {
      plugin = lualine-nvim;
      type = "lua";
      config = readFile ./plugins/lualine.lua;
    }
    nvim-autopairs
    {
      plugin = nvim-cmp;
      type = "lua";
      config = readFile ./plugins/cmp.lua;
    }
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = readFile ./lsp.lua;
    }
    nvim-treesitter.withAllGrammars
    nvim-web-devicons
    plenary-nvim
    {
      plugin = oil-nvim;
      type = "lua";
      config = "require'oil'.setup()";
    }
    {
      plugin = telescope-nvim;
      type = "lua";
      config = readFile ./plugins/telescope.lua;
    }
    vim-sleuth
    {
      plugin = which-key-nvim;
      type = "lua";
      config = readFile ./mappings.lua;
    }
  ];
}
