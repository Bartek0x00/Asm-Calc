.file "io/get_int.S"
.include "io.inc"
.include "common.inc"
.section .text
.global get_int

//enum errors get_int(signed long *num, 
//					  unsigned long len)
//gets not less than one,
//up to len or until LF bytes
//from stdin and stores that in num
//returns one of the states from enum errors
INIT get_int
	mov x19, x0
	mov x20, x1
	mov x21, xzr
	GETC buff
	ldrb w9, buff
	cmp x9, #'-'
	b.eq 0f
	0:
		mov x23, #1		
FINI
