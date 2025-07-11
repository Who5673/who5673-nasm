local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("nasm", {
	s("printHello", {
		t({
			"section .data",
			'\tmsg db "Hello world", 0xA',
			"\tlen equ $ - msg",
			"",
			"section .text",
			"\tglobal _start",
			"",
			"_start:",
			"\tmov rax, 1",
			"\tmov rdi, 1",
			"\tmov rsi, msg",
			"\tmov rdx, len",
			"\tsyscall",
			"",
			"\tmov rax, 60",
			"\txor rdi, rdi",
			"\tsyscall",
		}),
		i(0),
	}),
	s("test", {
		t({ {
			"testtext!",
		} }),
		i(0),
	}),
})
