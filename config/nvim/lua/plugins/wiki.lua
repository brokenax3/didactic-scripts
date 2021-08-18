vim.g.wiki_filetypes = {'md'} 
vim.g.wiki_root = '/home/mark/git/effective-train'
vim.g.wiki_tags_scan_num_lines = -10
vim.g.wiki_link_target_type = 'md'
vim.cmd([[let g:wiki_tags_format_pattern = '\v%(^|\s)#\zs[^# ]+']])
