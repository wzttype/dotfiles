require('mini.ai').setup({
    custom_textobjects = {
        F = require('mini.ai').gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
    },
})
