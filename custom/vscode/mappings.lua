local keyboard_layout = UTILITIES.get_keyboard_layout()

local M = {}

-- Default remap options (used when an options argument is not passed in)
local options = { noremap = true, silent = false, buffer = nil, nowait = false }

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
  },

  i = {
  },

  v = {
  },

  x = {
  },

}

print("vscode M =", JSON.encode(M))

return M

