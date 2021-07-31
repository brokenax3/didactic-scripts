-- Telescope
local actions = require('telescope.actions')

require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "    ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "flex",
        layout_config = {
            horizontal = {
                mirror = false,
                preview_width = 0.6,
            },
            vertical = {
                mirror = false,
                preview_height = 0.5,
            },
            preview_cutoff = 40,
        },
        file_sorter =    require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =    require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        path_display = { shorten = 2 },
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    pickers = {
      -- Your special builtin config goes in here
        buffers = {
            sort_lastused = true,
            mappings = {
                i = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                    -- Right hand side can also be the name of the action as a string
                    ["<c-d>"] = "delete_buffer",
                },
                n = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        },
        find_files = {
        }
    },
    extensions = {
      -- Your extension config goes in here
    }
}
