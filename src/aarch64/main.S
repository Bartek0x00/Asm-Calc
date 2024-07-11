.file "main.S"
.include "io.inc"
.section .bss
	.lcomm opr,  1
	.lcomm arg1, 8
	.lcomm arg2, 8
.section .text
.global _start
_start:
	PRINTS startm
	//GETI opr #1
	//ldrb w11, opr
	//cmp x11, #3
	//b.lo 0f
	//PRINTE eoprtn _start
0:
	//PRINTS op1m
	//GETI arg1 
	//cmp x0, EOPRND
	//b.ne 1f
	//PRINTE eoprnd 0b
1:
	//cmp x0, EOVFLW
	//b.ne 2f
	//PRINTE eovflw 0b
2:
	//PRINTS op2m
	//GETI arg2
	//cmp x0, EOPRND
	//b.ne 3f
	//PRINTE eoprnd 2b
3:
	//cmp x0, EOVFLW
	//b.ne 4f
	//PRINTE eovflw 2b
4:
	b exit	
exit:
	mov x0, #0
	mov x8, #93
	svc #0
	//exit(0)
