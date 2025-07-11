local cmp = require("cmp")
local reg_source = require("who5673_nasm.completion_registers")

cmp.register_source("nasm_registers", reg_source)
require("who5673_nasm").setup()
vim.notify("Plugin who5673 has loaded!")
