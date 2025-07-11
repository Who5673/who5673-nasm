<!--
Copyright (c) 2025 who5673. All rights served.

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
-->

# This plugin has not been released yet.
The plugin named `coc-nasm` has been released since the 6<sup>th</sup> of July, 2025, to help you code faster with snippets and auto-completions. However, It needs `coc.nvim` as its dependency, and `coc.nvim` is not a modern plugin manager in Neovim (due to the action that we use Lazy and Mason as our plugin manager instead). We cannot download it if we do not use `coc.nvim` plugin manager (as that plugin makes for normal Vi Improved, not Neovim, though it still can run in it via `init.vim`). 

From that reason, `who5673-nasm` is going to be developed as a plugin which helps you code faster like `coc-nasm` on Lazy plugin manager. We will go through that plug in order to find some information about it.

## Basic information about who5673-nasm:
__Manufacturing date__ : The ?<sup>th</sup> of ?, 2025  
**GitHub link**: `https://github.com/Who5673/who5673-nasm` (current page)

## Installation (Lazy only)
**Install LuaSnip first** (GitHub Link: [https://github.com/L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip))
__Then:__
- If you do not install plugin via `$HOME/.config/nvim/lua/plugins/init.lua`, you need to create `who5673-nasm.lua` first using:
```
touch $HOME/.config/nvim/lua/who5673-nasm.lua
```
- Whether you use `init.lua` (in `$HOME/.config/nvim/lua/plugins/`) or that `who5673-nasm.lua`, you still need to add this script into `return {...}` command (must learn how to program Lua if you want to understand):
```
return {
  "Who5673/who5673-nasm",
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  ft = "nasm",
  lazy = true,
},
```

<hr />

# Metadata about this plugin 
## Copyright
Copyright &copy; 2025 Who5673. All Rights Reserved. 
## License: 
MIT
