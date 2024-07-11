.file "io/strlen.S"
.include "common.inc"
.section .text
.global strlen

//unsigned long strlen(char *str)
//returns length of str
//without '\0'
INIT strlen
	mov x1, #0
	0:
		ldrb w8, [x0, x1]
		add x1, x1, #1
		cbnz w8, 0b
	sub x1, x1, #1
	mov x0, x1
FINI
