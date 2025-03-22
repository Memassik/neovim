return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            opts = {},
        },
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
        vim.keymap.set("n", "<leader>e", "<cmd> NvimTreeToggle <CR>"),
        vim.keymap.set("n", "<leader>E", "<cmd> NvimTreeFocus <CR>"),
    },
    opts = {
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            highlight_git = true,
            group_empty = true,
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    git = {
                        unstaged = "U",
                        staged = "S",
                        unmerged = "UM",
                        renamed = "R",
                        deleted = "D",
                        untracked = "X",
                        ignored = "I",
                    },
                    folder = {
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                    },
                },
            },
        },
        filters = {
            dotfiles = true,
        },
    },
}
