local function read_config()
	local config_path = vim.fn.expand("~/.config/nvim/lua/config/hex.conf")
	local file = io.open(config_path, "r")
	if file then
		local syntax_enabled = true
	else
		vim.notify("Fun fact: You can get our syntax highlight for .hex at ~/.config/nvim/lua/config/hex.conf")
		return false
	end

	for line in file:lines() do
		local key, value = line:match("^%s*(%w+)%s*=%s*(%w+)%s*$")
		if key == "syntax" then
			if value == "false" then
				SYNTAX_ENABLED = false
			end
		elseif value == "true" then
			SYNTAX_ENABLED = true
		else
			vim.notify(
				"Error while configuring your configuration for the syntax highlighting in who5673-nasm - hex file at "
					.. config_path,
				vim.log.levels.ERROR,
				{ title = "syntax_control.lua" }
			)
			return false
		end
	end
	file:close()
	return SYNTAX_ENABLED
end

vim.api.nvim_create_augroup("MyPluginSyntaxControl", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = "MyPluginSyntaxControl",
	pattern = "nasm",
	callback = function()
		if vim.b.current_syntax then
			vim.cmd("syntax clear")
			vim.b.current_syntax = nil
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = "MyPluginSyntaxControl",
	pattern = "hex",
	callback = function()
		if read_config() then
			vim.cmd("runtime syntax/hex.vim")
		else
			if vim.b.current_syntax then
				vim.cmd("syntax clear")
				vim.b.current_syntax = nil
			end
		end
	end,
})
