.mergesort:
		@ ADD YOUR CODE HERE
	cmp r4,r2
	bgt .if
	b .break
	.if:
		sub r5,r4,r2
		lsr r5,r5,1
		add r5,r5,r2
		lsr r5,r5,2
		lsl r5,r5,2

		sub sp,sp,16

		st r2,[sp]
		st r5, 4[sp]
		st r4, 8[sp]
		st ra, 12[sp]

		mov r4,r5

		call .mergesort

		ld r2,[sp]
		ld r5,4[sp]
		ld r4,8[sp]
		ld ra,12[sp]
		
		add r2,r5,4 

		call .mergesort
		
		ld r2,[sp]
		ld r5,4[sp]
		ld r4,8[sp]
		ld ra,12[sp]
		
		add sp,sp,16

		sub sp,sp,4
		st ra,[sp]
	
		call .merge

		ld ra,[sp]
		add sp,sp,4

	.break:
		ret
	
.merge: 	
		@ ADD YOUR CODE HERE
	mov r8,r2
	.loop1:
		cmp r8,r5
		bgt .break1
		ld r9,[r8]
		st r9,1000[r8]
		add r8,r8,4
		b .loop1
	.break1:

	add r8,r5,4


	.loop2:
		cmp r8,r4
		bgt .break2
		ld r9,[r8]
		st r9,2000[r8]
		add r8,r8,4
		b .loop2
	.break2: 

	mov r8,r2
	add r9,r5,4
	mov r10,r2
	.while:
		cmp r8,r5
		bgt .breakwhile1
		cmp r9,r4
		bgt .breakwhile2
		ld r11,1000[r8]
		ld r12,2000[r9]
		cmp r11,r12
		bgt .if1
		b .else
		.if1:
			st r12,[r10]
			add r9,r9,4
			b .afterif
		.else:
			st r11,[r10]
			add r8,r8,4
			b .afterif
		.afterif:
			add r10,r10,4
			b .while
	.breakwhile1:
		cmp r9,r4
		bgt .afterbreak
		st r12,[r10]
		add r9,r9,4
		add r10,r10,4
		b .breakwhile1
	.breakwhile2:
		cmp r8,r5
		bgt .afterbreak
		st r11,[r10]
		add r8,r8,4
		add r10,r10,4
		b .breakwhile2
	.afterbreak: 
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
	
	call .mergesort

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

