.file "io/strlen.S"
.section .text
.global strlen

//long strlen(const char *str)
//returns length of str
//without '\0'
strlen:
	mov x1, x0
	strlen_loop:
		ldrb w9, [x0], #1
		cbnz w9, strlen_loop
	sub x0, x0, x1
	sub x0, x0, #1
	ret

