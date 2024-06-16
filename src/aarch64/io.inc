.ifndef _IO_INC
.set _IO_INC, 1
.file "io.inc"

//fd
.set STDIN, 0
.set STDOUT, 1
.set STDERR, 2

//errors
.set EOPRTN, -1
.set EOPRND, -2
.set EOVFLW, -3

.section .bss
	.lcomm buff, 1

.section .rodata.strings
	startm: 
		.ascii "\tAsmCalc\n"
		.ascii "Choose the operation: \n"
		.ascii "0 - Addition\n"
		.ascii "1 - Substraction\n"
		.asciz "2 - Multiplication\n"
	op1m: .asciz "\nEnter the 1st operand: "
	op2m: .asciz "\nEnter the 2nd operand: "

.section .rodata.errors
	eoprtn: .asciz "Invalid operation\n"
	eoprnd: .asciz "Invalid operand\n"
	eovflw: .asciz "Number overflow\n"

.section .text

.macro STRLEN str
	mov x0, \str
	bl strlen
.endm 

.macro PRINTS str fd=STDOUT
	STRLEN \str
	mov x2, x0
	adr x1, \str
	mov x0, \fd
	mov x8, #64
	svc 0
//write(fd, str, strlen(str))
.endm

.macro PRINTE err lbl
	PRINTS \err STDERR
	b \lbl
.endm

.macro PRINTC chr
	str \chr, buff
	mov x2, #1
	adr x1, buff
	mov x0, STDOUT
	mov x8, #64
	svc 0
//write(stdout, buff, 1)
.endm

.macro PRINTI num
	mov x0, \num
	bl print_int
.endm

.macro PRINTF num
	mov d0, \num
	bl print_flt
.endm

.endif // _IO_INC
