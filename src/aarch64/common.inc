.ifndef _COMMON_INC
.set _COMMON_INC, 1
.file "common.inc"
.section .text

.macro INIT lbl
	\lbl:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
.endm

.macro FINI
	ldp x29, x30, [sp], #16
	ret
.endm

.endif //_COMMON_INC
