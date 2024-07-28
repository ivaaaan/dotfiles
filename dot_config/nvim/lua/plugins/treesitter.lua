local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end


configs.setup({
    ensure_installed = {"c", "go", "yaml", "rust", "python"},
    sync_install = false,
    ignore_install = {},
    auto_install = true,

    autopairs = { enable = true },
    endwise = { enable = true },
    autotag = { enable = true },
    matchup = { enable = true },
    indent = { enable = true },

    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<cr>',
            scope_incremental = false,
            node_decremental = '<bs>',
        },
    },

    textsubjects = {
        enable = true,
        prev_selection = ',',
        keymaps = {
            ['.'] = { 'textsubjects-smart', desc = 'Select the current text subject' },
            ['a;'] = {
                'textsubjects-container-outer',
                desc = 'Select outer container (class, function, etc.)',
            },
            ['i;'] = {
                'textsubjects-container-inner',
                desc = 'Select inside containers (classes, functions, etc.)',
            },
        },
    },
})
