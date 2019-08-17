.bubblesort:
		@ ADD YOUR CODE HERE
	sub r3,r3,1
	mul r8,r3,4
	.loop1:
		cmp r2,r8 @ r2 is i, r3 is n-1
		beq .break1
		mov r4,0  @ r4 is j
		sub r5,r8,r2 @ r5 is n-i-1
		sub r5,r5,4
		.loop2:
			cmp r4,r5
			beq .break2
			ld r6,[r4]
			ld r7,4[r4]
			cmp r6,r7
			bgt .if
			b .afterif
			.if:
				st r6,4[r4]
				st r7,[r4]	
			.afterif:
				add r4,r4,4
				b .loop2
		.break2:
			add r2,r2,4
			b .loop1	
	.break1:
		ret

.main:

	@ Loading the values as an array into the registers
	mov r0, 0    
	mov r1, 12	@ replace 12 with the number to be sorted
	st r1, 0[r0]
	mov r1, 7	@ replace 7 with the number to be sorted
	st r1, 4[r0]
	mov r1, 11  @ replace 11 with the number to be sorted
	st r1, 8[r0]
	mov r1, 9   @ replace 9 with the number to be sorted
	st r1, 12[r0]
	mov r1, 3   @ replace 3 with the number to be sorted
	st r1, 16[r0]
	mov r1, 15  @ replace 15 with the number to be sorted
	st r1, 20[r0]
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0       @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 6	@ REPLACE 6 WITH N, where, N is the number of numbers being sorted
	
	@ ADD YOUR CODE HERE

	call .bubblesort
	
	@ ADD YOUR CODE HERE

	@ Print statements
	ld r1, 0[r0]
	.print r1
	ld r1, 4[r0]
	.print r1
	ld r1, 8[r0]
	.print r1
	ld r1, 12[r0]
	.print r1
	ld r1, 16[r0]
	.print r1
	ld r1, 20[r0]
	.print r1
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

