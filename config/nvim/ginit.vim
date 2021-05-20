" To check if neovim-qt is running, use `exists('g:GuiLoaded')`,
" see https://github.com/equalsraf/neovim-qt/issues/219
if exists('g:GuiLoaded')
  GuiTabline 1
  GuiFont! Iosevka\ SS16:h12
endif
