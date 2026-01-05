local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("nasm", {
	-- Generate an example  NASM program
	s("@@@", {
		t({
			"%macro exit 1",
			"\tmov rax, 60",
			"\tmov rdi, %1",
			"\tsyscall",
			"%endmacro",
			"",
			"%macro getstr 2",
			"\tmov rax, 1",
			"\tmov rdi, 1",
			"\tmov rsi, %1",
			"\tmov rdx, %2",
			"\tsyscall",
			"%endmacro",
			"",
			"section .data",
			'\texample db 0x1b, "[1;38;2;255;165;0m", "Hello world", 0x1b, "[0m", 0xA',
			"\tlength equ $-example",
			"",
			"section .text",
			"\tglobal _start",
			"",
			"_start:",
			"\tgetstr example, length",
			"\texit 0",
		}),
		i(0),
	}),
	-- Generate a template for you to start coding faster
	s("@", {
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
	s("dup", {
		t("dup("),
		i(1),
		t(")"),
	}),
	s("section", {
		t("section "),
		i(1, "sectionname"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("segment", {
		t("segment "),
		i(1, "segmentname"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("absolute", {
		t("absolute "),
		i(1, "LABEL"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%include", {
		t('%include "'),
		i(1, "filepath"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t('"'),
	}),
	s("%include", {
		t("%include "),
		i(1, "filemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%pathsearch", {
		t('%pathsearch "'),
		i(1, "singlelinemacro filename"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%realpath", {
		t("%realpath("),
		i(1, "PATH"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%depend", {
		t('%depend "'),
		i(1, "filepath"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t('"'),
	}),
	s("%depend", {
		t("%depend "),
		i(1, "filemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%use", {
		t("%use "),
		i(1, "smart_macro_feature"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%{", {
		t("%{"),
		i(1, "start:end"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%push", {
		t("%push "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%pop" }),
	}),
	s("%pop", {
		t("%pop"),
	}),
	-- % commands
	s("struc", {
		t("struc "),
		i(1, "structname"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "endstruc" }),
	}),
	s("macro", {
		t("macro "),
		i(1, "multilinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "endmacro" }),
	}),
	s("istruc", {
		t("istruc "),
		i(1, "structname"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "iend" }),
	}),
	s("%define", {
		t("%define "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
	}),
	s("%idefine", {
		t("%idefine "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
	}),
	s("%xdefine", {
		t("%xdefine "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
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
		i(1, "[macroname] [number of parameters]"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endmacro" }),
	}),
	s("%exitmacro", {
		t("%exitmacro"),
	}),
	s("%imacro", {
		t("%imacro "),
		i(1, "[macroname] [number of parameters]"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endmacro" }),
		t("value"),
	}),
	--ends
	s("%endmacro", {
		t("%endmacro"),
	}),
	s("%endif", {
		t("%endif"),
	}),
	-- More defs
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
		i(1, "strings"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(" "),
	}),
	s("%strcat(", {
		t("%strcat("),
		i(1),
		t(")"),
	}),
	s("%strlen", {
		t("%strlen "),
		i(1, "string"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%strlen(", {
		t("%strlen("),
		i(1, "string"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%str", {
		t("%str("),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%substr", {
		t("%substr "),
		i(1, "singlelinemacro, quoted_string, number_of_string_to_extract"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%substr(", {
		t("%substr("),
		i(1, "singlelinemacro, quoted_string, number_of_string_to_extract"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
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
	s("%cond", {
		t("%cond("),
		i(1, "expression,value,value"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%count", {
		t("%count("),
		i(1),
		t(")"),
	}),
	s("%eval", {
		t("%eval("),
		i(1),
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
	s("%map~", {
		t("%map("),
		i(1, "macro, mapvalues"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%map", {
		t("%map "),
		i(1, "macro, mapvalues"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%num", {
		t("%num("),
		i(1, "full_digits_string_value"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%sel", {
		t("%sel("),
		i(1, "index, list"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%selbits", {
		t("%selbits("),
		i(1, "different_ISA_registers"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%tok", {
		t("%tok("),
		i(1, "value"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%rotate", {
		t("%rotate "),
		i(1, "N"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),

	-- %find preprocessors
	s("%find", {
		t("%find("),
		i(1, "target_char, target_string_or_charlist"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("%findi", {
		t("%findi("),
		i(1, "target_char, target_string_or_charlist"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),

	s("%null", {
		t("%null("),
		i(1),
		t(")"),
	}),

	s("enter", {
		t("enter "),
		i(1, "imm16, imm8"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "", "leave" }),
	}),
	-- ifs
	s("%if", {
		t("%if "),
		i(1, "condition"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifn", {
		t("%ifn "),
		i(1, "condition"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elif", {
		t("%elif "),
		i(1, "condition"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifn", {
		t("%elif "),
		i(1, "condition"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	-- ifdefs
	s("%ifdef", {
		t("%ifdef "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifdefalias", {
		t("%ifdefalias "),
		i(1, "alias"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifdirective", {
		t("%ifdirective "),
		i(1, "directive"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifusable", {
		t("%ifusable "),
		i(1, "standard_package"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifusing", {
		t("%ifusing "),
		i(1, "standard_package"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%iffile", {
		t("%iffile "),
		i(1, "FILE"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifndef", {
		t("%ifndef "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elifdef", {
		t("%elifdef "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifndef", {
		t("%elifndef "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	-- ifmacros
	s("%ifmacro", {
		t("%ifmacro "),
		i(1, "multilinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifnmacro", {
		t("%ifnmacro "),
		i(1, "multilinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elifmacro", {
		t("%elifmacro "),
		i(1, "multilinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifnmacro", {
		t("%elifnmacro "),
		i(1, "multilinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%ifctx", {
		t("%ifctx "),
		i(1, "content"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifnctx", {
		t("%ifnctx "),
		i(1, "content"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elifctx", {
		t("%elifctx "),
		i(1, "content"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifnctx", {
		t("%elifnctx "),
		i(1, "content"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%ifidn", {
		t("%ifidn "),
		i(1, "two-identifiers"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifnidn", {
		t("%ifnidn "),
		i(1, "two-identifiers"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elifidn", {
		t("%elifidn "),
		i(1, "two-identifiers"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifnidn", {
		t("%elifnidn "),
		i(1, "two-identifiers"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%ifidni", {
		t("%ifidni "),
		i(1, "twoidns-insensitive"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifnidni", {
		t("%ifnidni "),
		i(1, "twoidns-insensitive"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elifidni", {
		t("%elifidni "),
		i(1, "twoidns-insensitive"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifnidni", {
		t("%elifnidni "),
		i(1, "twoidns-insensitive"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%ifstr", {
		t("%ifstr "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifnstr", {
		t("%ifnstr "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elifstr", {
		t("%elifstr "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifnstr", {
		t("%elifnstr "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%ifnum", {
		t("%ifnum "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifnnum", {
		t("%ifnnum "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elifnum", {
		t("%elifnum "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifnnum", {
		t("%elifnnum "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%iftoken", {
		t("%iftoken "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifntoken", {
		t("%ifntoken "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%eliftoken", {
		t("%eliftoken "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifntoken", {
		t("%elifntoken "),
		i(1, "singlelinemacro"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%ifid", {
		t("%ifid "),
		i(1, "identifier"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifnid", {
		t("%ifnid "),
		i(1, "identifier"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elifid", {
		t("%elifid "),
		i(1, "identifier"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifnid", {
		t("%elifnid "),
		i(1, "identifier"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%ifempty", {
		t("%ifempty "),
		i(1, "VARIABLE"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifnempty", {
		t("%ifnempty "),
		i(1, "VARIABLE"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elifempty", {
		t("%elifempty "),
		i(1, "VARIABLE"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifnempty", {
		t("%elifnempty "),
		i(1, "VARIABLE"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%ifenv", {
		t("%ifenv "),
		i(1, "ENVIRONMENTAL_VARIABLE"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%ifnenv", {
		t("%ifnenv "),
		i(1, "ENV"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endif" }),
	}),
	s("%elifenv", {
		t("%elifenv "),
		i(1, "ENV"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%elifnenv", {
		t("%elifnenv "),
		i(1, "ENV"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t" }),
	}),
	s("%else", {
		t({
			"%else",
			"\t",
		}),
	}),
	s("%rep", {
		t("%rep "),
		i(1, "times"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t({ "", "\t", "%endrep" }),
	}),
	s("%repl", {
		t("%repl "),
		i(1, "newname"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%arg", {
		t("%arg "),
		i(1, "arguments"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%stacksize", {
		t("%stacksize "),
		i(1, "size"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%local", {
		t("%local "),
		i(1, "variable"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%pragma", {
		t("%pragma "),
		i(1, "namespace.command value"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("%clear", {
		t("%clear "),
		i(1, "[global|context] [type]"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("clearallpreprocessors", {
		t("%clear global all"),
	}),
	-- Errors
	s("%error", {
		t('%error "'),
		i(1, "message"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t('"'),
	}),
	s("%fatal", {
		t('%fatal "'),
		i(1, "message"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t('"'),
	}),
	s("%note", {
		t('%note "'),
		i(1, "message"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t('"'),
	}),
	s("%warning", {
		t('%warning "'),
		i(1, "message"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t('"'),
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
	s("%undeftok", {
		t("%undeftok "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
	}),
	s("%undefstr", {
		t("%undefstr "),
		i(1, "something"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
	}),
	s("%unmacro", {
		t("%unmacro "),
		i(1, "[macroname] [number of parameters]"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
	}),

	-- Standard macros:
	s("__?USE_package?__", {
		t("__?USE_"),
		i(1, "PACKAGE"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t("?__"),
	}),

	-- Floats
	s("__?float8?__", {
		t("__?float8?__("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("__?float16?__", {
		t("__?float16?__("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("__?bfloat16?__", {
		t("__?bfloat16?__("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("__?float32?__", {
		t("__?float32?__("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("__?float64?__", {
		t("__?float64?__("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("__?float80m?__", {
		t("__?float80m?__("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("__?float80e?__", {
		t("__?float80e?__("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("__?float128l?__", {
		t("__?float128l?__("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("__?float128h?__", {
		t("__?float128h?__("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("float8", {
		t("float8("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("float16", {
		t("float16("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("bfloat16", {
		t("bfloat16("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("float32", {
		t("float32("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("float64", {
		t("float64("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("float80m", {
		t("float80m("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("float80e", {
		t("float80e("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("float128l", {
		t("float128l("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),
	s("float128h", {
		t("float128h("),
		i(1, "x"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(")"),
	}),

	-- Assembler directives
	s("cpu", {
		t("cpu "),
		i(1, "cpu_keyword"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("float", {
		t("float "),
		i(1, "float_constant"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t(""),
	}),
	s("[warning]", {
		t("[warning "),
		i(1, "directive"),
		f(function(_, snip)
			return snip.env.SELECT_RAW or ""
		end, {}, { user_args = {} }),
		t("]"),
	}),
})
