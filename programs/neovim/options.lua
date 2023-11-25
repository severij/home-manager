local options = {
  background = 'dark',
  cmdheight = 0,
  confirm = true,
  cursorline = true,
  expandtab = true,
  ignorecase = true,
  jumpoptions = 'stack',
  laststatus = 3,
  mouse = 'a',
  number = true,
  shiftwidth = 4,
  showmatch = true,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 300,
  undofile = true,
  winbar = '%f',
  wrap = false,
  wrapscan = false
}

for option, value in pairs(options) do
  vim.opt[option] = value
end
