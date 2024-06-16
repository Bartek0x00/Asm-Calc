.file "io/print_int.S"
.section .text
.global print_int

//void print_int(long num, long base)
//prints a int64_t number to stdout
//base == 2 binary
//base == 8 octal
//base == 10 decimal
print_int:
	cmp x0, #0
	cset x4, lo
	b.ge print_int_positive

	neg x0
	print_int_positive:
		cmp x0, #0
		b.eq print_int_final
		
		udiv x2, x0, x1
		msub x3, x2, x1, x0

	print_int_final:
		ret
