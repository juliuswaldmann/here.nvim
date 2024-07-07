# here.nvim

A simple Neovim plugin to quickly set the current working directory.
Useful for people who frequently change directories, without necessarily quitting Neovim.

## Features

- Easily set the current working directory to the directory of the current selected buffer
- Works within netrw, files and terminal buffers (tested with zsh. should work with bash & co)
- Provides variants for different directory changing commands: `:TcdHere`, `:LcdHere`, and `:CdHere`

## Installation

### Using lazy.nvim

Add the following to your lazy configuration:

```lua
{
  "juliuswaldmann/here.nvim",
  config = function()
    require("here)
  end,
}
```
### Using packer.nvim
Add the following to your packer configuration:

```lua
use {
  'juliuswaldmann/here.nvim',
  config = function()
    require("here")
  end
}
```

## Usage

Use any of the following commands to set the current working directory according to the buffer directory:

- `:Here` (alias for `:CdHere`)
- `:CdHere` (Uses `:cd` to change the global working dir)
- `:TcdHere` (Uses `:tcd` to change the tab-wide working dir)
- `:LcdHere` (Uses `:lcd` to change the window-local working dir)

These commands work in different contexts:

1. In a file buffer: Sets the working directory to the directory containing the current file
2. In a terminal buffer: Sets the working directory to match the current directory in the shell
3. In netrw: Sets the working directory to the current netrw directory

## Examples
Coming soon...

## Contributing

If you want to contribute please feel free to open a Pull-Request. All contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
