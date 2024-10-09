local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

require('neogen').setup({
    languages = {
        ['cpp.doxygen'] = require('neogen.configurations.cpp')
    }
})
