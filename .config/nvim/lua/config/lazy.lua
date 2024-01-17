local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    checker = { enabled = false },
    change_detection = {
        enabled = false
    },
    ui = {
        border = { '┏', '━', '┓', '┃', '┛', '━', '┗', '┃' }
    },
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true,
        rtp = {
            reset = true,
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "filetype",
                "health",
                "man",
                "shada",
                "spellfile",
                "rplugin",
                "zipPlugin",
                "editorconfig",
            },
        },
    },
})
