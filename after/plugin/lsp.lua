local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
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
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

-- Configure jdtls to always use Java 21
require('lspconfig').jdtls.setup({
  on_new_config = function(new_config, _)
    new_config.cmd_env = vim.tbl_extend("force", new_config.cmd_env or {}, {
      JAVA_HOME = "/usr/lib/jvm/java-21-openjdk",
      PATH = "/usr/lib/jvm/java-21-openjdk/bin:" .. os.getenv("PATH"),
    })
  end,
})
