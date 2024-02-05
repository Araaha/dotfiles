local opts = {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function()
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
            return ok and stats and stats.size > max_filesize
        end,
    },
    incremental_selection = {
        enable = true,
        disable = function()                -- Disable in large C++ buffers
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
            return ok and stats and stats.size > max_filesize
        end,
        keymaps = {
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
        },
    },
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "latex", "css", "go", "python", "bash",
        "diff", "yaml", "xml", "markdown", "ini", "json", "html" },
}

return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event   = "VeryLazy",
    config  = function()
        require("nvim-treesitter.configs").setup(opts)
        vim.treesitter.language.register("bash", "zsh")
    end,
}
