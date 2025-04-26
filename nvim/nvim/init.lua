-- load options
require('options')

-- load keymappings
require('keymaps')

-- load Packervim
require('plugins')

-- Set colorscheme
require('colorscheme')

-- Set LSP
require('lsp')

-- https://github.com/neovim/neovim/discussions/29065
-- https://www.reddit.com/r/neovim/comments/1ctoeqi/disable_deprecated_messages/
vim.deprecate = function() end
