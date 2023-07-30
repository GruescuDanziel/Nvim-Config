local copilot = require('copilot')

copilot.setup({})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- The packer manager itself
    use 'neovim/nvim-lspconfig'
    use 'sainnhe/everforest' -- Color Scheme
    use {'nvim-telescope/telescope.nvim', tag = '0.1.2',requires = { {'nvim-lua/plenary.nvim'} } } -- Fuzy Finder
    use 'zbirenbaum/copilot.lua'
    use 'ms-jpq/chadtree'
    use {'neoclide/coc.nvim', branch = 'release'}
end)
