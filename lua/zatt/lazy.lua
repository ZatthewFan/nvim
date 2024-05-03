local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        -- or                            , branch = '0.1.x',
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },

    "sainnhe/gruvbox-material",
    "folke/tokyonight.nvim",
    "scottmckendry/cyberdream.nvim",

    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",

    "folke/which-key.nvim",

    "stevearc/oil.nvim",

    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    "nvim-treesitter/playground",
    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",

    "folke/neodev.nvim",
    "declancm/cinnamon.nvim",

    "folke/trouble.nvim",


    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",

}

require("lazy").setup(plugins, {})
