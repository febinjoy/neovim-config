-- Bootstrap lazy.nvim
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

-- Plugin Configurations
local plugins = {
  -- UI Theme
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  
  -- Fuzzy Finder
  { 
	  'nvim-telescope/telescope.nvim', branch = '0.1.x', 
	  dependencies = { 'nvim-lua/plenary.nvim' } 
  },

-- Neo Tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  -- Visualise buffers as tabs
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Comment code
  {
    'terrortylor/nvim-comment',
    config = function()
      require("nvim_comment").setup({ create_mappings = false })
    end
  },
  -- Tree Sitter
  {
    'nvim-treesitter/nvim-treesitter', 
    build = ":TSUpdate"
  },

}

-- Options
local opts = {}

-- Setup

-- lazy.nvim
require('lazy').setup(plugins, opts)

-- Treesitter
local treesitterconfigs = require('nvim-treesitter.configs')

treesitterconfigs.setup({
  ensure_installed = {
    "lua","javascript","c","vim","query","html","go","bash","c_sharp","cpp","css","csv","dockerfile","gitignore","graphql","ini","java","json","powershell","make","python","sql","typescript","xml","yaml"
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },  
})

-- catppuccin
require('catppuccin').setup{}
vim.cmd.colorscheme 'catppuccin'

-- bufferline
require('bufferline').setup{}

