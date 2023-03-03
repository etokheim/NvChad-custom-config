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
    ["<A-" .. keyboard_layout.down.lower .. ">"] = {":m .+1<CR>==", "Move line down", options},
    ["<A-" .. keyboard_layout.up.lower .. ">"] = {":m .-2<CR>==", "Move line up", options},
  },

  i = {
    ["<A-" .. keyboard_layout.down.lower .. ">"] = {"<Esc>:m .+1<CR>==gi", "Move line down", options},
    ["<A-" .. keyboard_layout.up.lower .. ">"] = {"<Esc>:m .-2<CR>==gi", "Move line up", options},
  },

  v = {
    ["<A-" .. keyboard_layout.down.lower .. ">"] = {":m .+1<CR>==", "Move visually selected block down", options},
    ["<A-" .. keyboard_layout.up.lower .. ">"] = {"<Esc>:m .-2<CR>==gi", "Move visually selected block up", options},
  },

  x = {
    ["<A-" .. keyboard_layout.down.lower .. ">"] = {":move '>+1<CR>gv-gv", "Move line down", options},
    ["<A-" .. keyboard_layout.up.lower .. ">"] = {":move '<-2<CR>gv-gv", "Move line up", options},
  },

}

return M

