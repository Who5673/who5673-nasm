local M = {}

function M.setup()
	local ls = require("luasnip")
	local loader = require("luasnip.loaders.from_vscode")
	-- Load snippets like CSCode style from the local dir plugin --
	loader.lazy_load({
		paths = vim.fn.stdpath("data") .. "/lazy/who5673-nasm/snippets",
	})
	-- If you want to add more snippets in the future, you can add:
	-- require("luasnip.loaders.from_lua").lazy_load({ paths = "..." })
end

return M
