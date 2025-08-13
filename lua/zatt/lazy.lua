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

    { "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>tb",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>ts",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>tl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>tL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>tq",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
},

    "kylechui/nvim-surround",

    "jinh0/eyeliner.nvim",

    { "echasnovski/mini.nvim", version = "*" },

    "MeanderingProgrammer/render-markdown.nvim",


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
