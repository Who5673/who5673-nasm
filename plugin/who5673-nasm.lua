require("who5673-nasm").setup()
local cmp = require("cmp")

cmp.register_source("nasm_registers", require("who5673-nasm.completion_registers"))
vim.notify("Plugin who5673 has loaded!")
