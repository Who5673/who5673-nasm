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
*Due to the high difficulty of Vietnamese tenth-grade exam, I cannot update this plugin regularly (2025 - 2026). I need to spend my time focusing on the skills to do that exam (I am just 14 years old).*
# who5673-nasm - A plugin for Lazy.nvim that helps you program Netwide Assembler (NASM) language.
The plugin named `coc-nasm` has been released since the 6<sup>th</sup> of July, 2025, to help you code faster with snippets and auto-completions. However, It needs `coc.nvim` as its dependency, and `coc.nvim` is not a modern plugin manager in `nvim` (due to the action that we use Lazy and Mason as our plugin manager instead). We cannot download it if we do not use `coc.nvim` plugin manager (as that plugin makes for normal Vi Improved, not Neovim, though it still can run in it via `init.vim`). 

From that reason, `who5673-nasm` is going to be developed as a plugin which helps you code faster like `coc-nasm` on Lazy plugin manager. We will go through that plug in order to find some information about it.

## Basic information about who5673-nasm:
__Manufacturing date__ : The 13<sup>th</sup> of July 2025  
**GitHub link**: `https://github.com/Who5673/who5673-nasm` (current page)

## Our website is maintaining:
```
https://who5673.github.io/coc-nasm-web
```
- In order to help you program Netwide Assembler language, we are going to make a website for you.
- However, this website is being worked in progress.

## Installation 
First, run:
```
git config --global credential.helper store
```
Or use SSH Key instead. I have added this method as since July 25<sup>th</sup>, 2025, I have a problem while cloning this plugin (git prompts for username and password, since they are all deprecated).  

Recommend to create your own GPG or SSH key before using this plugin.

Then:
**Install `LuaSnip` first** (GitHub Link: [https://github.com/L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)).  
**Install `nvim-cmp`** (GitHub Link: [https://github.com/hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)) but __not now__. Let me __teach__ you how to do that later, as if you install using a wrong way, `who5673-nasm` plugin can be __useless__.

### Lazy.nvim:
- If you do not install plugin via `$HOME/.config/nvim/lua/plugins/init.lua`, you need to create `who5673-nasm.lua` first using:
```
touch $HOME/.config/nvim/lua/who5673-nasm.lua
```
- Whether you use `init.lua` (in `$HOME/.config/nvim/lua/plugins/`) or that `who5673-nasm.lua`, you still need to add this script into `return {...}` command (must learn how to program Lua if you want to understand):
```
return {
  "Who5673/who5673-nasm", -- Or git@github.com:Who5673/who5673-nasm if you use SSH Key (recommended)
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/nvim-cmp"
  },
  ft = "nasm",
  lazy = true,
}
```
- Install `nvim-cmp` like this. You do not need to take down like this script, but that thing will help you know the way to configure snippets and completions for who5673-nasm:

`$HOME/.config/nvim/lua/plugins/cmp.lua` (if you do not have, please manually make it by yourself)
```
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
    },
    enabled = true, -- Very important! Lazyvim may disable this plugin when we download it.
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "nasm_registers" },
          { name = "nasm_instructions" },
        },
      })
    end,
  },
}

```
Now you have done the installation of `who5673-nasm` in `lazy.nvim`.

### Packer.nvim:
The file path you need to install this plugin is just like `lazy.nvim`, but has different script.

`$HOME/.config/nvim/lua/plugins/init.lua`  or `$HOME/.config/nvim/lua/plugins.lua`:
```
use {
	'Who5673/who5673-nasm',
	opt = true,
	requires = {{'L3MON4D3/LuaSnip', opt = true}, {'hrsh7th/nvim-cmp', opt = true}}
	ft = {'nasm'},
}
```  

Just like the Lazy one, I need to tell you how to configure `nvim-cmp` in order to make my plugin work well.

`$HOME/.config/nvim/lua/plugins/cmp.lua`:
```
use {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  requires = {
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "Who5673/who5673-nasm" },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "nasm_registers" },
        { name = "nasm_instructions" },
      }),
      mapping = cmp.mapping.preset.insert({
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
    })
  end,
}
```

Now you have done the installation of `who5673-nasm` in `packer.nvim`.

## Basic features:
`who5673-nasm` has many snippets and auto-completions such as:
- Having completions for 64-bit, 32-bit, 16-bit, 8-bit and segment registers.
- Supports many Netwide Assembler commands.
- Supports preprocessors and `SSE`, `AVX` and `AVX-512` Instruction Set Architecture syntax.

## Snippets:
- sum (snippet): Generate an example of a function in NASM.
- exit (snippet): Generate the script to exit a program in NASM.
- function (snippet): Generate a template to help you create a function.
- program (snippet): Make a layout of NASM script so as to let you code faster (as you do not need to code the start of the program).
- ! (snippet): Generate a demo script in NASM (it prints "Hello world") when being compiled if you do not modifier it after using this snippet.
- basicoutput (snippet): Generate a tamplate of a basic output which prints the text into `stdout` (terminal screen).
- basicinput (snippet): Generate a template of a basic prompt (user input) which prompts the user to take down their texts into the variable in the `stdin`.

I also have some example screens for you to know what you get after installing this plugin:  

![Demo who5673-nasm plugin](media/gitnvim.gif)  

## How to use snippets in who5673-nasm:
Just like how you deal with snippets and completions in Neovim.  
- Choose the snippet or completion you want to use. 
- `LuaSnip` will initialize the snippets.
- `nvim-cmp` will show them, also initialize the completions.  
So do not be worry that the snippets and completions will not appear. I also place my contact at `contact.txt` in GitHub link. I, nevertheless, still need time to read your report.

## Note:
- As `nvim` is a hard Integrated Develop Environment for most people, I think you might want not to configure more things before using this plugin effectively.
- Because of the high difficulty of Lua and plugins in Neovim, the update I make can have bugs and errors so please sympathise.
- Assembly language has a language server named `asm-lsp` (GitHub link: [https://github.com/bergercookie/asm-lsp](https://github.com/bergercookie/asm-lsp)) and a formatter named `asmfmt` (GitHub link: [https://github.com/klauspost/asmfmt](https://github.com/klauspost/asmfmt)). From that reason, __I do not want to create other things like debugger and real-time error in this plugin__. You need to use them or find other ones.
- If you have problems, you will need to think of the solution to solve them by yourself. Yep, __NO WARRANTY__.
- Switch your thought to the case you are coding Assembly Languages and you think it is hard to code it. If you were in that situation, I would like to ask you a question:  
___Would you like to create and develop plugins for programming Assembly Languages in the world, especially in Lazy.nvim and Mason.nvim?___  
Come up with and answer that question if you want. You do not need to send your answer to me.  
- Even though this plugin is not famous anymore, I will carry on developing newer versions of this plugin with no reasons.  

## See also
- `coc-nasm` is another repository that is make by me (Who5673) for programming NASM language using `coc.nvim`. You can see that plugin by going to this website:  
[https://github.com/Who5673/coc-nasm](https://github.com/Who5673/coc-nasm)  

- Thanks to [The Netwide Assembler Hyper Text Markup Language document](https://www.nasm.us/xdoc/2.16.03/html/nasmdoc0.html) for providing me with many important skills about programming this Assembler.  

Have fun while using my plugin.  

# Metadata about this plugin:

## Product meta information:
Copyright &copy; 2025 Who5673. All Rights Reserved.  

This is an official NASM plugin made by Who5673.  

## License: 
MIT
