.quicksort:
		@ ADD YOUR CODE HERE
	cmp r4,r2
	bgt .if
	b .break
	.if:
		sub sp,sp,4
		st ra,[sp]
		call .partition
		ld ra,[sp]
		add sp,sp,4

		
		sub sp,sp,16

		st r2,[sp]
		st r5, 4[sp]
		st r4, 8[sp]
		st ra, 12[sp]

		sub r4,r5,4

		call .quicksort

		ld r2,[sp]
		ld r5,4[sp]
		ld r4,8[sp]
		ld ra,12[sp]
		
		add r2,r5,4 

		call .quicksort
		
		ld r2,[sp]
		ld r5,4[sp]
		ld r4,8[sp]
		ld ra,12[sp]
		
		add sp,sp,16
	.break:
		ret

.partition:
	ld r5, [r4]
	sub r6,r2,4
	mov r7,r2
	.loop:
		cmp r7,r4
		bgt .breakloop
		ld r9,[r7]
		cmp r5,r9
		bgt .if1	
		b .afterif
		.if1:
			add r6,r6,4
			ld r8,[r6]
			st r8,[r7]
			st r9,[r6]
		.afterif:
			add r7,r7,4
			b .loop
	.breakloop:
		ld r8,[r4]
		ld r9,4[r6]
		st r8,4[r6]
		st r9,[r4]
		add r5,r6,4
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

	mov r2, 0          @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 5	@ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
	mul r3, r3, 4		
	add r4, r2, r3
	
	
 	@ ADD YOUR CODE HERE 

	call .quicksort

 	@ ADD YOUR CODE HERE

	@ Print statements for the result
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

