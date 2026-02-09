local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- Tabs / indentación
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Búsqueda
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false

-- Comportamiento
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Backup
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Update time más rápido (mejor para plugins luego)
opt.updatetime = 250
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 4,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
