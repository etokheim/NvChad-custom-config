-- Nice to know:
-- If the plugin is already configured in NvChad, editing the same plugin dictionary here
-- will enrich the already configured plugin. Ie. adding nvim-lspconfig here, will not 
-- remove the configuration from NvChad. If the ["neovim/nvim-lspconfig"].config is 
-- already defined, then redefining it here, will of course override that key, but the
-- .setup etc will still be in effect.

-- After editing this file, run :PackerCompile!
return {
	["NMAC427/guess-indent.nvim"] = {
		config = function() require('guess-indent').setup {} end
	},
	["Pocco81/TrueZen.nvim"] = {},

	  -- lsp stuff
	["williamboman/mason.nvim"] = {
		override_options = {
		  ensure_installed = {
				-- lua stuff
				"lua-language-server",
				"stylua",

				-- web dev
				"css-lsp",
				"html-lsp",
				"typescript-language-server",
				"deno",
				"emmet-ls",
				"json-lsp",

				-- shell
				"shfmt",
				"shellcheck",
			},
		},
	},

	["neovim/nvim-lspconfig"] = {
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end,
	},

  ["nvim-tree/nvim-tree.lua"] = {
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      return require "configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },

	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		-- A list of parser names, or "all" (the five listed parsers should always be installed)
	-- 		ensure_installed = { "c", "lua", "html", "css", "bash", "javascript" },
	--
	-- 		-- Install parsers synchronously (only applied to `ensure_installed`)
	-- 		sync_install = false,
	--
	-- 		-- Automatically install missing parsers when entering buffer
	-- 		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	-- 		auto_install = true,
	--
	-- 		-- List of parsers to ignore installing (for "all")
	-- 		-- ignore_install = {},
	-- 	},
	-- }

	-- This doesn't work -> meaning that javascript isn't automatically installed when opening a js file
	["nvim-treesitter/nvim-treesitter"] = {
		opts = {
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = { "c", "lua", "html", "css", "bash", "javascript" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing (for "all")
			-- ignore_install = {},
		},
	},

  -- How do I load this into NvChads theme manager? They seem to be configured elsewhere...
	["projekt0n/github-nvim-theme"] = {
		config = function()
			require('github-theme').setup({})
		end,
	},
}

