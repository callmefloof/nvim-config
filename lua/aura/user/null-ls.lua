-- ~/.config/nvim/lua/aura/user/null-ls.lua

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Add formatters/linters installed via Mason
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
    },
})

