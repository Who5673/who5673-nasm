local ls = require("luasnip")
local loader = require("luasnip.loaders.from_vscode")

loader.lazy_load({
	paths = vim.fn.stdpath("config") .. "/home/who5673/Desktop/who5673-codes/who5673-snippets/who5673-nasm/snippets/",
})
