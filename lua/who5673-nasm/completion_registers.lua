-- lua/who5673_nasm/completion_registers.lua
local cmp = require("cmp")
local registers = require("who5673_nasm.registers")

local source = {}

function source:is_available()
	return vim.bo.filetype == "nasm"
end

function source:get_keyword_pattern()
	return [[\k\+]]
end

function source:complete(_, callback)
	local kinds = cmp.lsp.CompletionItemKind

	local items = {}

	for bit_size, regs in pairs(registers) do
		for _, reg in ipairs(regs) do
			table.insert(items, {
				label = reg,
				kind = kinds.Variable,
				documentation = {
					kind = "markdown",
					value = "Register **" .. reg:upper() .. "** — `" .. bit_size .. "`",
				},
				detail = "Register " .. reg:upper(),
			})
		end
	end

	callback({ items = items, isIncomplete = false })
end

return source
