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
}

