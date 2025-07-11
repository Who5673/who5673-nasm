local M = {}

function M.setup()
	local ls = require("luasnip")
	local loader = require("luasnip.loaders.from_lua")
	loader.load({
		paths = { vim.fn.expand("~/.local/share/nvim/lazy/who5673-nasm/lua/who5673_snippets/") },
	})
	--local loader = require("luasnip.loaders.from_vscode")
	-- Load snippets like CSCode style from the local dir plugin
	-- If you want to add more snippets in the future, you can add:
end

return M
