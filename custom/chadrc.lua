-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "onedark",
}

require "custom.settings"
M.mappings = require "custom.mappings"

return M
