.file "io/print_int.S"
.include "io.inc"
.include "common.inc"
.section .text
.global print_int

//void print_int(signed long num)
//prints a signed long number to stdout
INIT print_int
	mov x1, #10	
	mov x5, #18
	adr x6, buff
	cmp x0, #0
	b.ge 0f

	//Handle negative numbers	
	mov x19, x0
	mov x20, x1

	PRINTS #'-'
	
	mov x0, x19
	mov x1, x20
	sub x0, xzr, x0
	
	//Main loop
	0:
		cmp x0, #0
		b.eq 1f
		
		udiv x2, x0, x1
		msub x3, x1, x2, x0
		add x3, x3, #'0'
		
		strb w3, [x6, x5]
		sub x5, x5, #1
		
		mov x0, x2
		b 0b

	//Print the stringified version
	1:
		add x3, x6, x5
		add x3, x3, #1
		
		mov x0, x3
		bl strlen
		mov x2, x0
		mov x1, x3
		mov x0, STDOUT
		mov x8, #64
		svc #0
FINI
