-- APPEARANCE --
vim.opt.termguicolors = true	-- Enable true color support

-- BEHAVIOR --
vim.opt.swapfile = false		-- Don't use swap files (Modern NeoVim configs typically don't use this feature)
vim.opt.backup = false			-- Do not backup files (we have git for a reason)
vim.opt.colorcolumn = "80"
vim.opt.undofile = true			-- Persistant and long running undos for undo tree
vim.opt.scrolloff = 8			-- Always have the cursor at least 8 lines from the top or bottom of view where possible
vim.opt.updatetime = 50			-- Fast update time
vim.opt.wrap = false			-- No Line Wrapping (Gross)

-- DIAGNOSTICS (diagnostic messages are fed into nvim by an LSP) --
vim.diagnostic.config({
	virtual_text = true,

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '🕱',
			[vim.diagnostic.severity.WARN] = '⚠',
			[vim.diagnostic.severity.INFO] = '🛈',
			[vim.diagnostic.severity.HINT] = '⦒',
		}
	}
})

-- SEARCH --
vim.opt.incsearch = true		-- Highlight all matches while typing
vim.opt.hlsearch = true			-- Highlight all matches after typing
vim.opt.ignorecase = true		-- Ignore case in search patterns
vim.opt.smartcase = true		-- Override IgnoreCase if the pattern searched contains capital letters

-- LINE NUMBERS --
vim.opt.number = true			-- Show the current line number from the top
vim.opt.relativenumber = true	-- Show surrounding line numbers relative to the current line

-- TABS & INDENTS --
vim.opt.tabstop = 4				-- A tab character is 4 spaces wide
vim.opt.shiftwidth = 4			-- Number of spaces to use for auto-indent
vim.opt.expandtab = false		-- Do not convert tabs to spaces

