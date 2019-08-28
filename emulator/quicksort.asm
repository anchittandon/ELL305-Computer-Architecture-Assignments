.quicksort:

	cmp r4,r2				@ right should be greater than left to proceed
	bgt .if 				
	b .break

	.if:

		sub sp,sp,4			@ Create space in stack for 1 element
		st ra,[sp]			@ push return address to stack

		call .partition		@ partition(left,right)

		ld ra,[sp]			@ pop return address from stack
		add sp,sp,4			@ Remove space in stack for 1 element

		sub sp,sp,16		@ Create space in stack for 4 elements

		st r2,[sp]			@ push left to stack
		st r5, 4[sp]		@ push mid to stack
		st r4, 8[sp]		@ push right to stack
		st ra, 12[sp]		@ push return address to stack

		sub r4,r5,4			@ right = pivot - 1

		call .quicksort		@ quicksort(left, pivot-1)

		ld r2,[sp]			@ pop left from stack
		ld r5,4[sp]			@ pop pivot from stack
		ld r4,8[sp]			@ pop right from stack
		ld ra,12[sp]		@ pop return address from stack
		
		add r2,r5,4 		@ left = pivot + 1

		call .quicksort		@ quicksort(pivot+1, right)
		
		ld r2,[sp]			@ pop left from stack
		ld r5,4[sp]			@ pop pivot from stack
		ld r4,8[sp]			@ pop right from stack
		ld ra,12[sp]		@ pop return address from stack
		
		add sp,sp,16		@ Remove space in stack for 4 elements 

	.break:

		ret

.partition:

	ld r5, [r4]				@ Take array[right] as pivot
	sub r6,r2,4				@ i = left - 1
	mov r7,r2				@ j = left

	.loop:

		cmp r7,r4			
		bgt .breakloop		@ j > right then break
		ld r9,[r7]			@ Take array[j]
		cmp r5,r9			
		bgt .if1			@ array[j] < pivot then ...
		b .afterif

		.if1:

			add r6,r6,4		@ ... i++
			ld r8,[r6]		@ Take array[i]
			st r8,[r7]		@ swap array[i] and array[j]
			st r9,[r6]

		.afterif:

			add r7,r7,4		@ j++
			b .loop

	.breakloop:

		ld r8,[r4]			@ Take array[right]
		ld r9,4[r6]			@ Take array[i+1]
		st r8,4[r6]			@ Swap array[i+1] and array[right]
		st r9,[r4]				
		add r5,r6,4			@ pivot = i+1
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

