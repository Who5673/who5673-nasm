local M = {}

function M.setup()
	local ls = require("luasnip")
	--local loader = require("luasnip.loaders.from_vscode")
	local loader2 = require("luasnip.loaders.from_lua")
	-- Load snippets like CSCode style from the local dir plugin
	-- If you want to add more snippets in the future, you can add:
	loader2.load({
		path = vim.fn.stdpath("data") .. "/lazy/who5673-nasm/lua/who5673_snippets",
	})
end

return M
