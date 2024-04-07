[![GitHub Stars](https://img.shields.io/github/stars/night0721/ccc.nvim.svg?style=social&label=Star&maxAge=2592000)](https://github.com/night0721/ccc.nvim/stargazers/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![Last Commit](https://img.shields.io/github/last-commit/night0721/ccc.nvim)](https://github.com/night0721/ccc.nvim/pulse)
[![GitHub Open Issues](https://img.shields.io/github/issues/night0721/ccc.nvim.svg)](https://github.com/night0721/ccc.nvim/issues/)
[![GitHub Closed Issues](https://img.shields.io/github/issues-closed/night0721/ccc.nvim.svg)](https://github.com/night0721/ccc.nvim/issues?q=is%3Aissue+is%3Aclosed)
[![GitHub License](https://img.shields.io/github/license/night0721/ccc.nvim?logo=GNU)](https://github.com/night0721/ccc.nvim/blob/master/LICENSE)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?logo=lua&logoColor=white)](https://github.com/night0721/ccc.nvim/search?l=lua)

# ccc.nvim 

`ccc.nvim` is a fork of Neovim plugin 'fm-nvim' that lets you use your favorite terminal file managers (and fuzzy finders) from within Neovim.

<details>
<summary>Supported File Managers</summary>

- [ccc](https://github.com/night0721/ccc)

</details>

<p>
<details>
<summary>Supported Fuzzy Finders</summary>

- [fnf](https://github.com/leo-arch/fnf)

</details>
</p>

<p>Keep in mind that support for fuzzy finding is quite limited and using seperate plugins would be more practical.</p>

<p>1. Partial Support as files cannot be opened.</p>

## Demo and Screenshots:

![Demo](https://user-images.githubusercontent.com/57725322/142964076-6efd1247-b689-4cf7-bc29-ca1c6746462c.gif)

<p>
<details>
<summary>Screenshots</summary>

##### [fnf](https://github.com/leo-arch/fnf)

![fnf](https://user-images.githubusercontent.com/57725322/142956916-bd78371f-6308-4559-ae55-0014d18b16bb.png)

##### [ccc](https://github.com/night0721/ccc)

![ccc](https://github.com/night0721/ccc.nvim/assets/77528305/8ae753e4-7f16-4d44-b466-ea3c7ab78c41)

</details>
</p>

## Installation:

- [packer.nvim](https://github.com/wbthomason/packer.nvim):
  ```lua
  use {'night0721/ccc.nvim'}
  ```

## Configuration:

The following configuration contains the defaults so if you find them satisfactory, there is no need to use the setup function.

```lua
require('ccc').setup{
	-- (Vim) Command used to open files
	edit_cmd = "edit",

	-- See `Q&A` for more info
	on_close = {},
	on_open = {},

	-- UI Options
	ui = {
		-- Default UI (can be "split" or "float")
		default = "float",

		float = {
			-- Floating window border (see ':h nvim_open_win')
			border    = "none",

			-- Highlight group for floating window/border (see ':h winhl')
			float_hl  = "Normal",
			border_hl = "FloatBorder",

			-- Floating Window Transparency (see ':h winblend')
			blend     = 0,

			-- Num from 0 - 1 for measurements
			height    = 0.8,
			width     = 0.8,

			-- X and Y Axis of Window
			x         = 0.5,
			y         = 0.5
		},

		split = {
			-- Direction of split
			direction = "topleft",

			-- Size of split
			size      = 24
		}
	},

	-- Terminal commands used w/ file manager (have to be in your $PATH)
	cmds = {
        ccc_cmd     = "ccc",
        fnf_cmd     = "find . | fnf",
	},

	-- Mappings used with the plugin
	mappings = {
		vert_split = "<C-v>",
		horz_split = "<C-h>",
		tabedit    = "<C-t>",
		edit       = "<C-e>",
		ESC        = "<ESC>"
	},
}
```

## Usage:

Any of the following commands are fine...

- Commands
  - `:Ccc`
  - `:Fnf`

but you can add a directory path w/ the command (doesn't work with `fnf`).

Example:

```
:Ccc ~/.config/nvim/
```

## Q&A

Q: What if I want to open files in splits or tabs?

A: Use any of the default mappings (unless you've changed them)...

- `<C-h>` for horizontal split
- `<C-v>` for vertical split
- `<C-e>` for normal edit
- `<C-t>` for tabs

Q: Can I run a function once exiting or entering the plugin?

A: Yes you can! Use the following code as a guide...

```lua
local function yourFunction()
	-- Your code goes here
end

require('ccc').setup{
	-- Runs yourFunction() upon exiting the floating window (can only be a function)
	on_close = { yourFunction },

	-- Runs yourFunction() upon opening the floating window (can only be a function)
	on_open = { yourFunction }
}
```

Q: What if I want to map `<ESC>` to close the window?

A: You can do this by mapping `<ESC>` to whatever closes your file manager (note that this may bring up other issues). This can be done with the following code...

```lua
require('ccc').setup{
	mappings = {
		-- Example for Vifm
		ESC        = ":q<CR>"
	}
}
```

Q: Am I able to have image previews?

A: Not yet
<!-- A: Yes and no. Assuming you are on Linux, it is possible with the help of tools like [Überzug](https://github.com/seebye/ueberzug). If you are on Mac or Windows, it is not possible. -->

Q: Can I use splits instead of a floating window

A: It's possible by changing the "default" option in the "ui" table to "split"
