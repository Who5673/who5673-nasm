-- lua/who5673_nasm/completion_instructions.lua

local cmp = require("cmp")
local instructions = require("who5673_nasm.instructions")

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

	for inst, desc in pairs(instructions) do
		table.insert(items, {
			label = inst,
			kind = kinds.Keyword,
			detail = "Instruction",
			documentation = {
				kind = "markdown",
				value = "**" .. inst .. "** — " .. desc,
			},
		})
	end

	callback({ items = items, isIncomplete = false })
end

return source
