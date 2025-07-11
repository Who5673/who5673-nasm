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
# who5673-nasm - A plugin for Lazy.nvim that helps you program Netwide Assembler (NASM) language.
The plugin named `coc-nasm` has been released since the 6<sup>th</sup> of July, 2025, to help you code faster with snippets and auto-completions. However, It needs `coc.nvim` as its dependency, and `coc.nvim` is not a modern plugin manager in Neovim (due to the action that we use Lazy and Mason as our plugin manager instead). We cannot download it if we do not use `coc.nvim` plugin manager (as that plugin makes for normal Vi Improved, not Neovim, though it still can run in it via `init.vim`). 

From that reason, `who5673-nasm` is going to be developed as a plugin which helps you code faster like `coc-nasm` on Lazy plugin manager. We will go through that plug in order to find some information about it.

## Basic information about who5673-nasm:
__Manufacturing date__ : The 13<sup>th</sup> of July, 2025  
**GitHub link**: `https://github.com/Who5673/who5673-nasm` (current page)

## Installation (Lazy only)
**Install LuaSnip first** (GitHub Link: [https://github.com/L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)).  

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

- Add this script into `~/.config/nvim/lua/config/keymaps.lua` 
```
local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if ls.expand_or_jumpable() then
    return "<cmd>lua require('luasnip').expand_or_jump()<CR>"
  else
    return "<Tab>"
  end
end, { expr = true, silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if ls.jumpable(-1) then
    return "<cmd>lua require('luasnip').jump(-1)<CR>"
  else
    return "<S-Tab>"
  end
end, { expr = true, silent = true })
```
- Then, execute this command:
```
echo 'require("config.keymaps")' >> ~/.config/nvim/init.lua
```
After all those Installation steps, you will have who5673-nasm plugin installed in your local user.

## Basic features:
who5673-nasm has many snippets and auto-completions such as:
- Having completions for 64-bit, 32-bit, 16-bit and 8-bit registers.
- sum (snippet): Generate an example of a function in NASM.
- exit (snippet): Generate the script to exit a program in NASM.
- funtn (snippet): Generate a template to help you create a function.
- program (snippet): Make a layout of NASM script so as to let you code faster (as you do not need to code the start of the program).
- printHello (snippet): Generate a demo script in NASM (it prints "Hello world") when being compiled if you do not modifier it after using this snippet.

## How to use snippets in who5673-nasm:
- Make sure you have done the Installation above.
- Type exactly the snippet you want to use.
- After that, press Tab and you will see the result.

## Note:
- As `nvim` is a hard Integrated Develop Environment for most people, I think you might want not to configure more things before using this plugin effectively.
- Because of the high difficulty of Lua and plugins in Neovim, the update I make can have bugs and errors so please sympathise.
- Assembly language has a language server named `asm-lsp` (GitHub link: [https://github.com/bergercookie/asm-lsp](https://github.com/bergercookie/asm-lsp)) and a formatter named `asmfmt` (GitHub link: [https://github.com/klauspost/asmfmt](https://github.com/klauspost/asmfmt)). From that reason, __I do not want to create other things like debugger and real-time error in this plugin__. You need to use them or find other ones.
- If you have problems, you will need to think of the solution to solve them by yourself. Yep, __NO WARRANTY__.
- Switch your thought to the case you are coding Assembly Languages and you think it is hard to code it. If you were in that situation, I would like to ask you a question:  
___Would you like to create and develop plugins for programming Assembly Languages in the world, especially in Lazy.nvim and Mason.nvim?___  
Come up with and answer that question if you want. You do not need to send your answer to me.  
- Even though this plugin is not famous anymore, I will carry on developing newer versions of this plugin with no reasons.  

Have fun while using my plugin.  


# Metadata about this plugin:

## Copyright
Copyright &copy; 2025 Who5673. All Rights Reserved. 
## License: 
MIT
