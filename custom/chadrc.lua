-- First read our docs (completely) then check the example_config repo
print("Hello from chadrc")

local M = {}

require "custom.options"
M.mappings = require "custom.mappings"
M.plugins = require "custom.plugins"

M.ui = {
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "onedark", "one_light" },
  transparency = false,
  -- theme = "onedark", -- default theme
	-- theme = "everforest",
}

M.options = {
  nvChad = {
    update_url = "https://github.com/NvChad/NvChad",
    update_branch = "main",
  },
}

require('github-theme').setup()

return M
