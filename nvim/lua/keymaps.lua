local map = vim.keymap.set

--- Select up or down in insert mode
map("c", "<C-p>", "<Up>", { desc = "Select up in insert mode" })
map("c", "<C-n>", "<Down>", { desc = "Select down in insert mode" })

--- Joint two lines together
map("n", "T", "J", { desc = "Joint two lines together (same as origin `J`)" })

--- Jump to head or tail of the line
map("n", "H", "^", { desc = "Jump to the head of the line (same as `^`)" })
map("n", "L", "$", { desc = "Jump to the tail of the line (same as `$`)" })

--- Screen tiny step up or down scroll
map("n", "K", "<C-y>", { remap = true, desc = "Screen tiny step up scroll" })
map("n", "J", "<C-e>", { remap = true, desc = "Screen tiny step down scroll" })

--- Screen half step up and down scroll
map("n", "<PageUp>", "<C-u>", { desc = "Screen half step up scroll" })
map("n", "<PageDown>", "<C-d>", { desc = "Screen half step down scroll" })

--- Window move
map("n", "<C-left>", "<C-w>h", { desc = "Focus on the left window" })
map("n", "<C-right>", "<C-w>l", { desc = "Focus on the right window" })
map("n", "<C-up>", "<C-w>k", { desc = "Focus on the up window" })
map("n", "<C-down>", "<C-w>j", { desc = "Focus on the down window" })
map("n", "<C-h>", "<C-w>h", { desc = "Focus on the left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus on the right window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus on the up window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus on the down window" })

--- Quit window or buffer
map("n", "q",
    function()
      vim.cmd('windo redraw!')
      if #vim.fn.getbufinfo({ buflisted = 1 }) == 1 then
        vim.cmd('q')
      elseif #vim.fn.getwininfo() ~= 1 then
        vim.cmd('close!')
      else
        vim.cmd('bp | bd #')
      end
    end,
    { silent = true, desc = "Close buffer or exit neovim" })

--- Record mode
map("n", "Q", "q", { desc = "Record mode (same as origin `q`)" })

--- Tab indent
map("v", "<Tab>", ">gv", { desc = "Text increase indent" })
map("v", ">>", ">gv", { desc = "Text increase indent" })
map("v", "<S-Tab>", "<gv", { desc = "Text descrease indent" })
map("v", "<<", "<gv", { desc = "Text descrease indent" })

--- Disable search highlight
map("n", "<Leader><CR>", ":nohl<CR>", { desc = "Disable search highlight" })

--- Copy to system clipboard
map({"n", "v"}, "Y", '"+y', { desc = "Copy to system clipboard" })

--- Refresh Neovim configure
map("n", "<Leader>r", ":source $MYVIMRC<CR>", { desc = "Refresh Neovim configure" })
