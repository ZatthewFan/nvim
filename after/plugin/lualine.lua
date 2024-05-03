require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "gruvbox-material",
        -- theme = "tokyonight",
        -- theme = "cyberdream",
    },
    sections = {
        lualine_a = {
            {
                "filename",
                path = 3,
            }
        }
    }
}
