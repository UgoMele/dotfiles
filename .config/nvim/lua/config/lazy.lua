local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- vim.o.background = "dark" -- this is for gruvbox theme
-- vim.cmd("set termguicolors") --this is for zenbones theme

vim.cmd("colorscheme everforest")

vim.cmd("hi Normal guibg=NONE")
vim.cmd("hi NonText guibg=NONE")
vim.cmd("hi Normal ctermbg=NONE")
vim.cmd("hi NonText ctermbg=NONE")
