.ifndef _IO_INC
.set _IO_INC, 1
.file "io.inc"

//enum fd
.set STDIN,  0
.set STDOUT, 1
.set STDERR, 2

//enum errors
.set SUCCES, 0
.set EINVAL, -1
.set EOVFLW, -2
.set EDIVZR, -3

.section .bss
	.lcomm buff, 20

.section .rodata.strings
	startm: 
		.ascii "\tAsm-Calc\n"
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

.macro GETC buf
	mov x2, #1
	adr x1, \buf
	mov x0, STDIN
	mov x8, #63
	svc #0
.endm

.macro GETI buf len=20
	adr x0, \buf
	mov x1, \len
	bl get_int
.endm

.macro PRINTS str fd=STDOUT
	adr x0, \str
	bl strlen
	mov x2, x0
	adr x1, \str
	mov x0, \fd
	mov x8, #64
	svc #0
//write(fd, str, strlen(str))
.endm

.macro PRINTE err lbl
	PRINTS \err STDERR
	b \lbl
.endm

.macro PRINTI num
	mov x0, \num
	bl print_int
.endm

.macro PRINTF num
	mov d0, \num
	bl print_flt
.endm

.endif //_IO_INC
