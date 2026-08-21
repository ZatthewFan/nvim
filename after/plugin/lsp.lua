vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf, remap = false }

    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)

    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)

    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_next()
    end, opts)

    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, opts)
  end,
})

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {
    "eslint",
    "gopls",
    "jdtls",
    "pyright",
    "jsonls",
    "lua_ls",
    "rust_analyzer",
    "ts_ls",
    "clangd",
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("jdtls", {
  on_new_config = function(new_config, _)
    new_config.cmd_env = vim.tbl_extend("force", new_config.cmd_env or {}, {
      JAVA_HOME = "/usr/lib/jvm/java-21-openjdk",
      PATH = "/usr/lib/jvm/java-21-openjdk/bin:" .. os.getenv("PATH"),
    })
  end,
})

vim.lsp.enable({
  "eslint",
  "gopls",
  "jdtls",
  "pyright",
  "jsonls",
  "lua_ls",
  "rust_analyzer",
  "ts_ls",
  "clangd",
})
