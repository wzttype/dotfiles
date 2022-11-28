require("nvim-treesitter.configs").setup({
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["uc"] = "@comment.outer",
            },
        },
        -- swap = {
        --     enable = true,
        --     swap_next = {
        --         ["<leader>a"] = "@parameter.inner",
        --         ["<leader>f"] = "@function.outer",
        --         ["<leader>e"] = "@element",
        --     },
        --     swap_previous = {
        --         ["<leader>A"] = "@parameter.inner",
        --         ["<leader>F"] = "@function.outer",
        --         ["<leader>E"] = "@element",
        --     },
        -- },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[]"] = "@class.outer",
            }
        }
    }
})
