-- relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- set tab to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- enable smart indentation
vim.opt.smartindent = true

-- disable line wrapping
vim.opt.wrap = false

-- always keep 10 lines above and below the cursor
vim.opt.scrolloff = 10

-- allow the @ character in file names
vim.opt.isfname:append("@-@")

-- highlight search results as they are found
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- frequently write to swap file for better recovery
vim.opt.updatetime = 50

-- set leader key to space
vim.g.mapleader = " "

-- use visual bell instead of beeping
vim.opt.visualbell = true

-- show the cursor position all the time
vim.opt.ruler = true

-- disable automatic comment insertion on new lines
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- disable swap files
vim.opt.swapfile = false

-- add relative line numbers to netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
