local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("nasm", {
	-- Generate an example  NASM program
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
	-- Generate a template for you to start coding faster
	s("program", {
		t("section .data"),
		t({ "", "\t" }),
		i(1, ""),
		t({
			"",
			"",
			"section .text",
			"\tglobal _start",
			"",
			"_start:",
		}),
	}),
	-- Create an example of a function
	s("sum", {
		t({
			"section .text",
			"\tglobal sum",
			"",
			"sum:",
			"\tmov rax, rdi",
			"\tadd rax, rsi",
			"\tret",
		}),
	}),
	-- This snippet is used to create a function
	s("function", {
		i(1, "functionname"),
		t({ ":" }),
		t({ "", "\t" }),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\tret" }),
	}),
	-- Generate exit syscall:
	s("exit", {
		t("mov rax, 60"),
		t({ "", "mov rdi, " }),
		i(1, ""),
		t({ "", "" }),
		t("syscall"),
	}),
	s("section", {
		t("section "),
		i(1, "sectionname"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("basicoutput", {
		t({
			"mov rax, 1",
			"mov rdi, 1",
			"mov rsi, ",
		}),
		i(1, "printvalue"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "mov rdx, len", "syscall" }),
	}),
	s("basicinput", {
		t({
			"mov rax, 0",
			"mov rdi, 0",
			"mov rsi, ",
		}),
		i(1, "buffervalue"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "mov rdx, 30    ; You must create uninitialized data using .bss section first", "syscall" }),
	}),
	s("%include", {
		t('%include "'),
		i(1, "filename"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t('"'),
	}),
	-- % commands
	s("%define", {
		t("%define "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("value"),
	}),
	s("%idefine", {
		t("%idefine "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("value"),
	}),
})
