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
	s("%xdefine", {
		t("%xdefine "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("value"),
	}),
	s("%assign", {
		t("%assign "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("value"),
	}),
	s("%macro", {
		t("%macro "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("value"),
	}),
	s("%imacro", {
		t("%imacro "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("value"),
	}),
	s("%endmacro", {
		t("%endmacro "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("value"),
	}),

	s("%defstr", {
		t("%defstr "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("string"),
	}),
	s("%deftok", {
		t("%deftok "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("value"),
	}),
	s("%defalias", {
		t("%defalias "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("value"),
	}),
	-- % strings
	s("%strcat", {
		t("%strcat "),
		i(1, "newstringvariable"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
	}),
	s("%strlen", {
		t("%strlen "),
		i(1, "macro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("string"),
	}),
	s("%substr", {
		t("%substr "),
		i(1, "macro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
	}),
	s("%strinv", {
		t("%strinv "),
		i(1, "macro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("string"),
	}),
	s("%abs", {
		t("%abs("),
		i(1, "value"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%hex", {
		t("%hex("),
		i(1, "value"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%", {
		t("%"),
		i(1, "preprocessor"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
	}),
	s("%line", {
		t("%line "),
		i(1, "number"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
		t("filename"),
	}),
	-- Undef %s
	s("%undef", {
		t("%undef "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
	}),
	s("%undefalias", {
		t("%undefalias "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
	}),
})
