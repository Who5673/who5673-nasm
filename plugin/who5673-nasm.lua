local cmp = require("cmp")
local reg_source = require("who5673_nasm.completion_registers")
local inst_source = require("who5673_nasm.completion_instructions")
require("who5673_nasm.syntax_control")

cmp.register_source("nasm_registers", reg_source)
cmp.register_source("nasm_instructions", inst_source)

require("who5673_nasm").setup()
vim.notify("Plugin who5673-nasm has loaded!")
