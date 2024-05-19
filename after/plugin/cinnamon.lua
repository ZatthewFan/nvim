require("cinnamon").setup({
    -- KEYMAPS:
    default_keymaps = true,
    extra_keymaps = false,
    extended_keymaps = false,
    override_keymaps = true,

    -- OPTIONS:
    centered = true,
    disabled = false,   -- disables plugin
    default_delay = 4,
    horizontal_scroll = false,
})
-- DEFAULT_KEYMAPS:

-- half-window movements:
vim.keymap.set({"n", "x"},  "<C-u>", "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
vim.keymap.set({"n", "x"},  "<C-d>", "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

-- page movements:
vim.keymap.set({"n", "x"},  "<C-b>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set({"n", "x"},  "<C-f>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
vim.keymap.set({"n", "x"},  "<PageUp>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set({"n", "x"},  "<PageDown>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
