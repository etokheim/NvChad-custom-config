local options = {
	hlsearch = true,														-- highlight all matches on previous search pattern
	ignorecase = true,													-- ignore case in search patterns
	timeoutlen = 100,														-- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,														-- Keep undo history
	updatetime = 300,														-- faster completion (4000ms default)
	expandtab = false,													-- convert tabs to spaces when inserted
	shiftwidth = 4,															-- the number of spaces inserted for each indentation
	tabstop = 4,																-- insert 2 spaces for a tab
	smartcase = true,														-- If you search with a captial letter, the search will be case sensitive, if not, it's unsensitive
	smartindent = true,													-- make indenting smarter again
	autoindent = true,													-- Indents any new lines to the same level as the previous line
	-- errorbells = true,												-- Stops the chiming on errors etc
	incsearch = true,														-- Incremental search
	list = true,																-- Display hidden characters (and the like)
	showmatch = false,													-- Highlights the matching parentheses for a second after it's created ({[]})
}

-- Apparently used to get rid of some redundant messages?
-- vim.opt.shortmess:append "c"

for key, value in pairs(options) do
	-- print(key .. " = " .. tostring(value))
	vim.opt[key] = value
end

