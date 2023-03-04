local options = {
  -- backup = false,                          -- wheather to create a backup file
	clipboard = 'unnamedplus',         	     -- Makes Neovim use the system's clipboard, so you can copy/paste from Neovim. A workaround is required for Windows
  -- cmdheight = 2,                           -- Set the height of the command area (where you focus when typing :) {Default: 1}
  -- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  -- pumheight = 10,                          -- pop up menu height
  -- showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs (0: never, 1: , 2: always)
	smartcase = true, -- If you search with a captial letter, the search will be case sensitive, if not, it's unsensitive
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  -- swapfile = false,                        -- creates a swapfile
  -- termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- Keep undo history
  updatetime = 300,                        -- faster completion (4000ms default)
  -- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = false,                       -- convert tabs to spaces when inserted
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  -- cursorline = true,                       -- highlight the current line (Doesn't work in NvChad?)
	number = true, -- Show line numbers?
	relativenumber = true,-- Show the relative line number, and display the current line number on the active line
  numberwidth = 4,                         -- set number column width {default 4}
	signcolumn = 'yes', -- Add a column on the left side for messages (linting/git messages etc. Need plugins). If 'no', the column will appear/disappear as needed.
  wrap = false,                            -- display lines as one long line
  scrolloff = 16,                          -- is one of my fav
  sidescrolloff = 8,
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
	autoindent = true,				-- Indents any new lines to the same level as the previous line
	-- errorbells = true,				-- Stops the chiming on errors etc
	incsearch = true,				-- Incremental search
	termguicolors = true,			-- Enables more colors (24-bit)
	syntax = 'on',					-- Enables syntax highlighting
	list = true,-- Display hidden characters (and the like)
	listchars = "tab:→ ,space:·,eol:¬,trail:~",   -- Display whitespaces as symbols (to differentiate between tabs, spaces etc)
	exrc = true, -- Auto source init.vim files within project directories
	showmatch = true, -- Highlights the matching parentheses for a second after	it's created ({[]})
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
