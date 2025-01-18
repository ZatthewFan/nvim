local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_format = require("lsp-zero").cmp_format({details = true})

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
--     -- preselects first item
    preselect = cmp.PreselectMode.None,

    completion = {
        -- autocomplete = false,
        -- completeopt = 'menu,menuone,noinsert',
        completeopt = 'menuone, noselect',
    },

    sources = {
        {name = "path"},
        {name = "nvim_lsp"},
        {name = "buffer"},
        {name = 'nvim_lua'},
        {name = 'luasnip'},
        {name = 'buffer'},
    },

    mapping = cmp.mapping.preset.insert({
        -- ['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<CR>'] = cmp.mapping.confirm({select = false}),

--         -- for manual menu invoking
--         ['<C-Space>'] = cmp.mapping.complete(),

        -- for manual menu closing
        ['<C-Space>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                fallback() -- Allow the default behavior if the menu is not visible
            end
        end, { 'i', 's' }),  -- Ensure it works in insert and select modes

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

--        ['<Tab>'] = cmp_action.luasnip_supertab(),
--        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

----------------------------------------------------------------------------------
        -- Tab to cycle forward through options
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()  -- If the menu is not visible, do the default action (e.g., insert a tab)
            end
        end, { 'i', 's' }),

        -- Shift-Tab to cycle backward through options
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()  -- If the menu is not visible, do the default action (e.g., insert a tab)
            end
        end, { 'i', 's' }),
----------------------------------------------------------------------------------

    }),

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    --- (Optional) Show source name in completion menu
    formatting = cmp_format
})
