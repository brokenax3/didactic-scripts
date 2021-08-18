vim.g['mkdx#settings'] = { 
    highlight = { enable = 1 }, 
    enter = { shift = 1 },
    links = { 
        external = { enable = 1 },
        conceal = true
    },
    toc = { 
        text = 'Table of Contents',
        update_on_write = 1 
    },
    fold = { enable = 0 },
    -- map = {
    --     prefix = '<localleader>',
    -- }
}
