-----------------
-- Packer.nvim --
-----------------
-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
      vim.cmd [[packadd packer.nvim]]
      return true
  end
  return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP manager
  use { 'williamboman/mason.nvim' } -- portable package manager for LSP servers, DAP servers, linters, and formatters.
  use { 'williamboman/mason-lspconfig.nvim' } -- automatically install enabled LSP servers in lspconfig
  use { 'neovim/nvim-lspconfig' } -- LSP client config for different servers

  -- Add hooks to LSP to support Linter && Formatter
  use { 'nvim-lua/plenary.nvim' }
  use {
      'jay-babu/mason-null-ls.nvim',
      after = 'plenary.nvim',
      requires = { 'nvimtools/none-ls.nvim' },
      config=[[require('config.mason-null-ls')]]
  }

  -- Auto-completion engine
  -- Note:
  --     the default search path for `require` is ~/.config/nvim/lua
  --     use a `.` as a path seperator
  --     the suffix `.lua` is not needed
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' } -- buffer auto-completion
  use { 'hrsh7th/cmp-path' } -- path auto-completion
  use { 'hrsh7th/cmp-cmdline' } -- cmdline auto-completion
  use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }
  -- Use vim-vsnip as a snippet plugin
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }

  -- Git integration
  use 'tpope/vim-fugitive' -- command executor
  use { 'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]] } -- decorations
  use {
    "sindrets/diffview.nvim",
  }

  -- Treesitter-integration
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
      config = [[require('config.nvim-treesitter')]],
  }

  -- Finder
  -- fuzzy finder over lists
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      -- optional for icon support
      'nvim-tree/nvim-web-devicons',
    }
  }

  -- File icons
  use 'nvim-tree/nvim-web-devicons'

  -- File explorer
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      config = [[require('config.nvim-tree')]]
  }

  -- Terminal integration
  use { "akinsho/toggleterm.nvim", tag = '*', config = [[require('config.toggleterm')]] }

  -- Colorscheme
  use 'tanvirtin/monokai.nvim'

  -- Status line
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = [[require('config.lualine')]],
  }

  -- Show indentation and blankline
  use { 'lukas-reineke/indent-blankline.nvim', config = [[require('config.ibl')]] }

  -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
  -- use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use {
    'romgrk/barbar.nvim',
    config = [[require('config.barbar')]]
  }

  -- Markdown support
  use { 'preservim/vim-markdown', ft = { 'markdown' } } -- Syntax highlighting, matching rules and mappings 
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  }) -- perviewer

  -- Smart indentation for Python
  use { "Vimjas/vim-python-pep8-indent", ft = { "python" } }

  -- Autopairs: [], (), "", '', etc
  -- it relies on nvim-cmp
  use {
      "windwp/nvim-autopairs",
      after = 'nvim-cmp',
      config = [[require('config.nvim-autopairs')]],
  }

  -- Code comment helper
  --  1. `gcc` to comment a line
  --  2. select lines in visual mode and run `gc` to comment/uncomment lines
  use 'tpope/vim-commentary'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
      require('packer').sync()
  end
end)
