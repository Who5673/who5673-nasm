require("who5673-nasm").setup()
local cmp = require("cmp")
local reg_source = require("who5673-nasm.completion_registers")

cmp.register_source("nasm_registers", reg_source)
vim.notify("Plugin who5673 has loaded!")
