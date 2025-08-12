-- lua/who5673_nasm/instructions.lua

return {
	-- Float commands (arithmetic):
	fadd = "Like `add` but used for float numbers, especially 80-bit float.\nExample: fadd st0, st1",
	fsub = "Like `sub` but used for floating point numbers.\nExample: fsub st0, st1    ; st0 = st0 - st1",
	fsubr = "The reverse of fsub.\nfsubr st0, st1    ; st0 = st1 - st0",
	fmul = "Like `mul` but used for floating point numbers.\nExample: fmul st0, st1",
	fdiv = "Like `div` but used for floating point numbers.\nExample: fdiv st0, st1    ; st0 = st0 / st1",
	fdivr = "The reverse of fdiv.\nfdivr st0, st1.   ; st0 = st1 / st0",
	-- Float commands (load ans store):
	fld = "Load something into Floating Point Unit stack (**default pushed target: st(0)** (unsigned).\nExample: fld dword 1.5)",
	fild = "Load integer as float onto Floating Point Unit stack",
	fst = "Stire float value from Floating Point Unit stack (without pop)",
	fstp = "Store float value from Floating Point Unit stack (and pop",
	fist = "Store Floating Point Unit float as integer (without pop)",
	fistp = "Store Floating Point Unit float as integer (and pop)",
	frndint = "Round st0 to an integer based on current Floating Point Unit rounding mode",
	fldcw = "Push a value into Floating Point Unit control word for dealing with exceptions, accuracy, rounding numbers,...\nSyntax: `fldcw [mem16]`. (**Hint: [variable] rounds toward zero with variable = 0x0F7F**).\n00 -> Round to nearest; 01 -> round down; 10 -> Round up; 11 -> Truncate\n. **Default: 0x037F(hex) = 895(dec)**.",
	-- Normal commands:
	-- mov
	mov = "Move data from source (src) to destination (dest), normal way.\nSyntax: mov dest, src    ; with dest is memory (mem) XOR src is memory (mem).\nreg stands for register, mem stands for memory and imm stands for immediate.",
	movsb = [[
		Move 1-byte data from src to dest, same with `mov byte`.
		Example:
		```
		cld          ; clear direction flag\n
		rep movsb    ; copy RCX bytes from [RSI] to [RDI]
		```]],
	movsw = "Move 2-byte data from src to dest, same with `mov word`",
	movsd = "Move 4-byte data from src to dest, same with `mov dword`",
	movsq = "Move 8-byte data from src to dest, same with `mov qword`",
	movst = "Move 10-byte data from src to dest, same with `mov tword`",
	movso = "**FOR SSE**. Move 16-byte data from src to dest, same with `mov oword`",
	movsy = "**FOR AVX**. Move 32-byte data from src to dest, same with `mov yword`",
	movsz = "**FOR AVX-512**. Move 64-byte data from src to dest, same with `mov zword`",
	inc = "Increment operand by 1",
	dec = "Decrement operand by 1",
	add = "Add source to destination",
	sub = "Subtract source from destination",
	xor = "Bitwise XOR",
	["and"] = "Bitwise AND",
	["or"] = "Bitwise OR",
	cmp = "Compare operands",
	default = "This code must be at the first line of a NASM script if you combine with rel in order to combine and extern with C/C++ via gcc/g++.",
	to = "Specify the target st(i) to be added in Floating Point Unit stack, default thing used to add is st0.\n Example: fadd to st2",
	rel = "rel command: Use a relative address for something",
	neg = "Compute the **absolute value** (abs) of a register",
	lea = "lea command to work with memory",
	rep = "Repeat string operation",
	mul = "Multiply",
	div = "Divide (**unsigned**) 2 numbers",
	idiv = "Divide (**signed**) 2 numbers",
	int = "Interrupt (normally for 32-bit architecture).\n**syscall**: int 0x80.\n**BIOS video services**: int 0x10.\n**BIOS disk services**: int 0x13.\n**DOS interrupt**: int 0x21.\n**Breakpoint**: int 0x03.\n**Divide By Zero**: int 0x00.",
	cli = "Clear interrupt",
	bits = "bits command",
	org = "org command. ORG 0x7C00 to make BIOS load the bootsector at this address",
	hlt = "(**Halt**) Wait for the hardware signal, does not spin CPU",
	ret = "Return from procedure, **rax** is the most important return value if you create a label that returns an integer",
	leave = "Cleans the stack frame and restore the previous value (which is initialized before entering)",
	push = "push to stack",
	pop = "pop from stack",
	shl = "Shift bits left (<<).\n**Syntax**: shl destination, source.\nShift a register `(destination) * 2**(source)` bit(s).\nExample:\n`mov al, 4\nshl al, 1`\n--> shift 4 * 2**1 = 8 bits.",
	shr = "Shift bits right (>>) (**unsigned**).\n**Syntax**: `shr destination, source`.\nShift a register `(destination) / 2**(source)` bit(s).\nExample:\n`mov al, 4\nshl al, 1\n--> shift 4 / 2**1 = 2 bits.",
	sar = "Shift bits right (>>) (**signed**).\n**Syntax**: `sar destination, source`.",
	syscall = "Call the system kernel",
	extern = "Declare external function (usually from libraries)",
	align = "Align N to optimize memory (common values: 16, 64)",
	stosb = "Store bytes to dest (often with REP)",
	cmpsb = "Compare byte strings (often with REPNE)",
	repne = "Repeat while not equal (for CMPSB)",
	MOD = "Modulus operator (remainder). Example: 8 MOD 3 = 2",
	sete = "Set if equal (==). ZF = 1",
	setne = "Set if not equal (!=). ZF = 0",
	setg = "Set if greater (>). ZF = 0 and SF = OF",
	setge = "Set if greater or equal (>=). SF = OF",
	setl = "Set if less (<). SF ≠ OF",
	setle = "Set if less or equal (<=). ZF = 1 or SF ≠ OF",
	seta = "Set if above (unsigned >). CF = 0, ZF = 0",
	setb = "Set if below (unsigned <). CF = 1",
	setae = "Set if above or equal (unsigned ≥). CF = 0",
	setbe = "Set if below or equal (unsigned ≤). CF = 1 or ZF = 1",
	sets = "Set if negative. SF = 1",
	setns = "Set if non-negative. SF = 0",
	seto = "Set if overflow. OF = 1",
	setno = "Set if no overflow. OF = 0",
	setc = "Set if carry. CF = 1",
	setnc = "Set if no carry. CF = 0",
	setz = "Set if zero. ZF = 1 (same as SETE)",
	setnz = "Set if not zero. ZF = 0 (same as SETNE)",
	setp = "Set if parity even. PF = 1",
	setnp = "Set if parity odd. PF = 0",
	-- Data types
	byte = "byte data type (1 byte = 8 bits).\nExample use: mov byte rax, 1.\nC-type relation: char",
	word = "word data type (2 bytes = 16 bits).\nC-type relation: short int.\nSigned range: -32768 to +32767.\nUnsigned range: 0 to +65535",
	dword = "dword data type (4 bytes = 32 bits).\nC-type relation: int, long int, float.\nSigned range (int): -2_147_483_648 to +2_147_483_647.\nUnsigned range (int): 0 to +4_294_967_296",
	qword = "qword data type (8 bytes = 64 bits).\nC-type relation: long long int, double.\nSigned range (long long int): -9_223_372_036_854_775_808 to +9_223_372_036_854_775_807.\nUnsigned range (long long int): 0 to +18_446_744_073_709_551_615",
	tword = "tword data type (10 bytes = 80 bits).\nC-type relation: long double.",
	oword = "(**LARGE, FOR SSE**) oword data type (16 bytes = 128 bits)",
	yword = "(**ULTRA LARGE, FOR AVX**) yword data type (32 bytes = 256 bits)",
	zword = "(**SUPER LARGE, FOR AVX-512**) zword data type (64 bytes = 512 bits)",
	-- Jump commands
	jmp = "Unconditional jump",
	je = "Jump if 2 value is equal (**both signed and unsigned**)",
	jne = "Jump if 2 value is not equal (**both signed and unsigned**)",
	jg = "Jump if one value is greater than another (use cmp to know) (**signed**)",
	ja = "Jump if one value is greater than another (use cmp to know) (**unsigned**)",
	jge = "Jump if one value is greater than or equ to another (**signed**)",
	jae = "Jump if one value is greater than or equ to another (**unsigned**)",
	jl = "Jump if one value is lower than another (**signed**)",
	jb = "Jump if one value is lower than another (**unsigned**)",
	jle = "Jump if one value is lower than or equal to another (**signed**)",
	jbe = "Jump if one value is lower than or equal to another (**unsigned**)",
	jnz = "Jump if ZF != 0 (ZF stands for Zero Flag)",
	jz = "Jump if ZF == 0 (ZF stands for Zero Flag)",
	loop = "loop = dec and jnz",
	-- Segment registers:
	cs = "Register cs (Code Segment)",
	ds = "Register ds (Data Segment)",
	ss = "Register ss (Stack Segment)",
	es = "Register es (Extra Segment)",
	fs = "Register fs",
	gs = "Register gs",
	-- Other important words
	[".data"] = ".data section (initialized data)",
	[".bss"] = ".bss section (uninitialized data or buffers)",
	[".text"] = ".text section (code)",
	[".nolist"] = ".nolist for disabling listing expansion",
	["_start"] = "Program entry point",
	global = "Declare a symbol globally visible",
	db = "Define byte (1 byte)",
	dw = "Define word (2 bytes, 16-bit)",
	dd = "Define double word (4 bytes, 32-bit)",
	dq = "Define quad word (8 bytes, 64-bit)",
	incbin = "Include a binary file",
	dt = "Define ten bytes (80-bit, x87 float)",
	["do"] = "Define an oword (128-bit, for SSE)",
	dy = "Define ywords (256-bit, for AVX)",
	dz = "Define zwords (512-bit, for AVX-512)",
	resb = "Reserve n bytes (uninitialized)",
	resw = "Reserve n words (2n bytes)",
	resd = "Reserve n double words (4n bytes)",
	resq = "Reserve n quad words (8n bytes)",
	rest = "Reserve n ten bytes (10n bytes)",
	reso = "Reserve n owords (**16 bytes**).\nFor SSE",
	resy = "Reserve n YMM register (each YMM register has **32 bytes**, so be careful).\nFor SIMD AVX",
	resz = "Reserve n ZMM register (each YMM register has **64 bytes**, so be careful).\nFor SIMD AVX-512",
	test = "Test command",
	equ = "Define constant (equate)",
	times = "Multiple definding something.\nExample: `buffer times 20 db 0xA    ; buffer has 20 line feeds = 20 newlines (line feed = 10(dec) = 0xA(hex) )`",
	msg = "Common label for messages",
	buffer = "Common label for buffer",
	len = "Common label for string length",

	-- Standard macros:
	["__?NASM_VERSION_ID?__"] = "Returns Netwide Assembler version ID (**dword integer**)",
	["__?NASM_VER?__"] = "Returns Netwide Assembler current version inside a script (**bytes data**)",
	["__?FILE?__"] = "Returns the name of the input file",
	["__?LINE?__"] = "Returns the number of current line in a file",
	["__?BITS?__"] = [[
Return the current code generation mode.
Current code generation mode can be defined by using BITS command:
```
BITS 16    ; Code generation: 16-bit mode (great for making a BOOTLOADER).
```
]],
	["__?OUTPUT_FORMAT?__"] = [[
Returns the **format type** of the file.
**Format type** of the file can be given using the **parameter `-f`** to assemble a file into an **object file** (.obj in Windows, .o in Linux distros). For instance:
```
nasm -f elf64 main.nasm -o main.o   # Format can be elf64, win64, elf32, win32, bin,..., which depends on the Instruction Set Architecture of a hardware device.
```
So that the macro returns "elf64" value.
  ]],
	["__?DEBUG_FORMAT?__"] = [[
If the debug format is enabled, it returns the debug format.
Otherwise, it returns `null`.

The debug format can be found using `-F` and `-g` option. Type `nasm -f output y` for a list.
  ]],

	-- Date and time macros
	["__?DATE?__"] = "Returns the assembly **DATE** as strings in ISO 8601 format (YYYY-MM-DD)",
	["__?TIME?__"] = "Returns the assembly **TIME** as strings in ISO 8601 format (HH:MM:SS)",
	["__?DATE_NUM?__"] = "Returns the assembly DATE in numeric form (YYYYMMDD)",
	["__?TIME_NUM?__"] = "Returns the assembly TIME in numeric form (HHMMSS)",
	["__?UTC_DATE?__"] = "Gives the assembly DATE in **universal time (UTC)** as strings, in ISO 8681 format (YYYY-MM-DD)",
	["__?UTC_TIME?__"] = "Gives the assembly TIME in **universal time (UTC)** as strings, in ISO 8681 format (HH:MM:SS)",
	["__?UTC_DATE_NUM?__"] = "Gives the assembly DATE (**universal time format**, numeric form, YYYYMMDD)",
	["__?UTC_TIME_NUM?__"] = "Gives the assembly TIME (**universal time format**, numeric form, HHMMSS)",
	["__?POSIX_TIME?__"] = [[
Returns the POSIX TIME (qword integer).

# What is POSIX TIME?
- POSIX TIME is a number of seconds that has been from the first of January in 1970 at 00:00:00 UTC.
- Calculate the POSIX TIME (unit: seconds):

```
  POSIX_TIME = current_time - 1970-01-01 00:00:00 (s)
```

- POSIX TIME helps us compare the time super fast as we only need to compare 2 different integers.
- It is also easy to calculate the seconds to make a new time.
- That time is great for the sync between UNIX-like system.

**Expire time** (YYYY-MM-DD):
- dword (32-bit): 2038-01-19 (Year 2038 problem).
- qword (64-bit): about the year ~200 000 000 000.
  ]],
}
