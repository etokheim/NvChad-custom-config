local M = {}
local env_keyboard_layout = "qwerty"

-- Default remap options (used when an options argument is not passed in)
local options = { noremap = true, silent = false, buffer = nil, nowait = false }

local keyboard_layout = {}
if env_keyboard_layout == "qwerty" then
  keyboard_layout = {
    left = {
      lower = "h",
      upper = "H"
    },
    down = {
      lower = "j",
      upper = "J"
    },
    up = {
      lower = "k",
      upper = "K"
    },
    right = {
      lower = "l",
      upper = "L"
    }
  }

elseif env_keyboard_layout == "colemak-qi" then
  print("Keyboard layout is not yet supported")
  keyboard_layout = {
    left = {
      lower = "h",
      upper = "H"
    },
    down = {
      lower = "j",
      upper = "J"
    },
    up = {
      lower = "k",
      upper = "K"
    },
    right = {
      lower = "l",
      upper = "L"
    }
  }
end

if env_keyboard_layout ~= "qwerty" then
  local keymap = vim.api.nvim_set_keymap
  -- Swap navigation keys to the new keyboard layout
  keymap('', keyboard_layout.left.lower,  'h', options)
  keymap('', keyboard_layout.left.upper,  'H', options)
  keymap('', keyboard_layout.down.lower,  'j', options)
  keymap('', keyboard_layout.down.upper,  'J', options)
  keymap('', keyboard_layout.up.lower,    'k', options)
  keymap('', keyboard_layout.up.upper,    'K', options)
  keymap('', keyboard_layout.right.lower, 'l', options)
  keymap('', keyboard_layout.right.upper, 'L', options)

  -- Move the functions, previously on the navigation row, to the swapped keys
  keymap('', 'h', keyboard_layout.left.lower,   options)
  keymap('', 'H', keyboard_layout.left.upper,   options)
  keymap('', 'j', keyboard_layout.down.lower,   options)
  keymap('', 'J', keyboard_layout.down.upper,   options)
  keymap('', 'k', keyboard_layout.up.lower,     options)
  keymap('', 'K', keyboard_layout.up.upper,     options)
  keymap('', 'l', keyboard_layout.right.lower,  options)
  keymap('', 'L', keyboard_layout.right.upper,  options)
end

print("h = " .. keyboard_layout.left.lower, "H = " .. keyboard_layout.left.upper)
print("j = " .. keyboard_layout.down.lower, "J = " .. keyboard_layout.down.upper)
print("k = " .. keyboard_layout.up.lower, "K = " .. keyboard_layout.up.upper)
print("l = " .. keyboard_layout.right.lower, "L = " .. keyboard_layout.right.upper)
-- Custom mappings
-- Modes
--   "n" = normal_mode,
--   "i" = insert_mode,
--   "v" = visual_mode,
--   "x" = visual_block_mode,
--   "t" = term_mode,
--   "c" = command_mode,
M.custom = {

  n = {
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
  },

  i = {
    -- Move current line
    ["<A-" .. keyboard_layout.down.lower .. ">"] = {"<Esc>:m .+1<CR>==gi", "Move line down", options},
    ["<A-" .. keyboard_layout.up.lower .. ">"] = {"<Esc>:m .-2<CR>==gi", "Move line up", options},
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
  },

}

return M

