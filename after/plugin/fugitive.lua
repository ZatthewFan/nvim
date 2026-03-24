vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.opt.diffopt:append("vertical")

vim.api.nvim_create_user_command("Gdiffsplit", function(opts)
    vim.cmd("Gvdiffsplit" .. (opts.bang and "!" or "") .. " " .. opts.args)
    vim.cmd("windo normal! zR")
end, { nargs = "?", bang = true })

vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiffsplit)
