local keyboard_layout = UTILITIES.get_keyboard_layout()

local M = {}

-- Default remap options (used when an options argument is not passed in)
local options = { noremap = true, silent = false, buffer = nil, nowait = false }
local options_navigation = { noremap = true, silent = false, buffer = nil, nowait = false }

local keymap = vim.api.nvim_set_keymap
-- Swap navigation keys to the new keyboard layout
keymap('', keyboard_layout.left.lower,  'h', options_navigation)
keymap('', keyboard_layout.left.upper,  'H', options_navigation)
keymap('', keyboard_layout.down.lower,  'j', options_navigation)
keymap('', keyboard_layout.down.upper,  'J', options_navigation)
keymap('', keyboard_layout.up.lower,    'k', options_navigation)
keymap('', keyboard_layout.up.upper,    'K', options_navigation)
keymap('', keyboard_layout.right.lower, 'l', options_navigation)
keymap('', keyboard_layout.right.upper, 'L', options_navigation)

-- Move the functions, previously on the navigation row, to the swapped keys
keymap('', 'h', keyboard_layout.left.lower,   options_navigation)
keymap('', 'H', keyboard_layout.left.upper,   options_navigation)
keymap('', 'j', keyboard_layout.down.lower,   options_navigation)
keymap('', 'J', keyboard_layout.down.upper,   options_navigation)
keymap('', 'k', keyboard_layout.up.lower,     options_navigation)
keymap('', 'K', keyboard_layout.up.upper,     options_navigation)
keymap('', 'l', keyboard_layout.right.lower,  options_navigation)
keymap('', 'L', keyboard_layout.right.upper,  options_navigation)

-- Custom mappings
-- Modes
--   "n" = normal_mode,
--   "i" = insert_mode,
--   "v" = visual_mode,
--   "x" = visual_block_mode,
--   "t" = term_mode,
--   "c" = command_mode,

-- Disable all of NvChad's default keymappings
M.disabled = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
  },

  n = {
    ["<Esc>"] = { ":noh <CR>", "Clear highlights" },
    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },

    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

    -- new buffer
    ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },

  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },

  v = {
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
  },

  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },
}

M.custom = {

  n = {
    ["<Esc>"] = { ":noh <CR>", "Clear highlights" },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },

     -- ["<C-n>"] = {"<cmd> Telescope <CR>", "Open Telescope"}
    -- Move current line
    ["<A-" .. keyboard_layout.down.lower .. ">"]  = {":m .+1<CR>==", "Move line down", options},
    ["<A-" .. keyboard_layout.up.lower .. ">"]    = {":m .-2<CR>==", "Move line up", options},

    -- Move the focus between panels
    ["<C-" .. keyboard_layout.left.lower .. ">"]  = {"<C-w>h", "Move the focus left", options},
    ["<C-" .. keyboard_layout.down.lower .. ">"]  = {"<C-w>j", "Move the focus down", options},
    ["<C-" .. keyboard_layout.up.lower .. ">"]    = {"<C-w>k", "Move the focus up", options},
    ["<C-" .. keyboard_layout.right.lower .. ">"] = {"<C-w>l", "Move the focus right", options},

    -- Move panels
    -- On Mac the S(hift) is apparently required. TODO: How does this affect other environments?
    ["<C-S-" .. keyboard_layout.left.upper .. ">"]  = {"<C-w>H", "Move the focused panel left", options},
    ["<C-S-" .. keyboard_layout.down.upper .. ">"]  = {"<C-w>J", "Move the focusen panel down", options},
    ["<C-S-" .. keyboard_layout.up.upper .. ">"]    = {"<C-w>K", "Move the focused panel up", options},
    ["<C-S-" .. keyboard_layout.right.upper .. ">"] = {"<C-w>L", "Move the focused panel right", options},

    -- Resize panels
    ["<CA-" .. keyboard_layout.left.lower .. ">"]  = {":vertical resize +2<CR>",  "Resize panel increase", options},
    ["<CA-" .. keyboard_layout.down.lower .. ">"]  = {":resize +2<CR>",           "Resize panel vertical increase", options},
    ["<CA-" .. keyboard_layout.up.lower .. ">"]    = {":resize -2<CR>",           "Resize panel decrease", options},
    ["<CA-" .. keyboard_layout.right.lower .. ">"] = {":vertical resize -2<CR>",  "Resize panel", options},

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    [keyboard_layout.down.lower] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    [keyboard_layout.up.lower]   = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Up>"]                     = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"]                   = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },

  i = {
    -- Move current line
    ["<A-" .. keyboard_layout.down.lower .. ">"] = {"<Esc>:m .+1<CR>==gi", "Move line down", options},
    ["<A-" .. keyboard_layout.up.lower .. ">"] = {"<Esc>:m .-2<CR>==gi", "Move line up", options},
    -- ["jk"] = {"<Esc>", "Exit insert mode", options},

    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-k>"] = { "<End>", "End of line" },
  },

  v = {
    -- Move selected lines
    ["<A-" .. keyboard_layout.down.lower .. ">"] = {":m .+1<CR>==", "Move visually selected block down", options},
    ["<A-" .. keyboard_layout.up.lower .. ">"] = {"<Esc>:m .-2<CR>==gi", "Move visually selected block up", options},
  },

  x = {
    -- Move current line
    ["<A-" .. keyboard_layout.down.lower .. ">"] = {":move '>+1<CR>gv-gv", "Move line down", options},
    ["<A-" .. keyboard_layout.up.lower .. ">"] = {":move '<-2<CR>gv-gv", "Move line up", options},

    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    [keyboard_layout.paste.lower] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },

}

-- Use specific mappings when using vscode and not
if vim.g.vscode then
  local vscode_mappings = require "custom.vscode.mappings"
  M = UTILITIES.deepMergeTables(M, vscode_mappings)
else
  M.nvimtree = {
    plugin = true,

    n = {
      -- toggle
      ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

      -- focus
      ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },

      ["e"] = { "k", "Move up" },
    },
  }

  CUSTOM = {}
  function CUSTOM.nvimtree_options(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Mappings defined here differ from the mappings in M.nvimtree as these map keys
    -- while in the nvim tree buffer. The other mappings map keys in normal buffers

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,     opts('Up'))
    vim.keymap.set('n', '?',     api.tree.toggle_help,               opts('Help'))

    -- Add custom movement keys to vimtree as well
    vim.keymap.set('n', keyboard_layout.down.lower,     "j",         opts('Move down'))
    vim.keymap.set('n', keyboard_layout.up.lower,       "k",         opts('Move up'))
  end
end


return M

