local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_format = require("lsp-zero").cmp_format({details = true})

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
--     -- preselects first item
    preselect = cmp.PreselectMode.None,
-- 
--     completion = {
--         completeopt = 'menu,menuone,noinsert',
--     },

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
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

        -- for manual menu invoking
        ['<C-Space>'] = cmp.mapping.complete(),
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
