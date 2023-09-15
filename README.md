### ⚠️⚠️  Work in progress  ⚠️⚠️

# Custom config for NvChad's Neovim
Custom configuration to extend and improve NvChad's config.

What to do:
1. Link the ./custom folder to the NvChad files
2. If you use an alternative keyboard layout, you can set the `KEYBOARD_LAYOUT` environment variable to change the keyboard bindings to better match the layout
   - Supported keyboard layouts:
      1. `qwerty`
      2. `colemak-qi`

# Development
1. You must run `:PackerCompile` everytime you change the plugin configuration
3. `:MasonInstallAll` among other things installs all the LSPs (language server protocols) which are setup in the config files
