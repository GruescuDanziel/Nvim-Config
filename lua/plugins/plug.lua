return require('packer').startup(function(use)
    
    use 'wbthomason/packer.nvim' -- The packer manager itself
    use 'sainnhe/everforest' -- Color Scheme
    use {'nvim-telescope/telescope.nvim', tag = '0.1.2',requires = { {'nvim-lua/plenary.nvim'} }
}

end)
