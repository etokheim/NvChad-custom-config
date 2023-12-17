UTILITIES = require("custom.utilities")
JSON = require("dkjson")

local M = {}

M.mappings = require "custom.mappings"

if vim.g.vscode then
  require "custom.vscode.options"
  M.plugins = require "custom.vscode.plugins"
else
  require "custom.options"
  M.plugins = require "custom.plugins"
end

M.ui = {
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "github_dark", "one_light" },
  transparency = false,
  theme = "github_dark", -- default theme
	-- theme = "everforest",
}

M.options = {
  nvChad = {
    update_url = "https://github.com/NvChad/NvChad",
    update_branch = "main",
  },
}

-- require('github-theme').setup()

return M
