-- Nice to know:
-- If the plugin is already configured in NvChad, editing the same plugin dictionary here
-- will enrich the already configured plugin. Ie. adding nvim-lspconfig here, will not 
-- remove the configuration from NvChad. If the ["neovim/nvim-lspconfig"].config is 
-- already defined, then redefining it here, will of course override that key, but the
-- .setup etc will still be in effect.

-- After editing this file, run :PackerCompile!
return {
}

