"" NOTE: make a soft link file of this file to ~/.vimrc, which can auto load
"" those configures when you use vim instead nvim
if has("nvim")
  if has("nvim-0.8")
    lua require "init"
  else
    echo "This configuration needs NeoVim 0.8+ version, use vim instead"
  endif
endif

