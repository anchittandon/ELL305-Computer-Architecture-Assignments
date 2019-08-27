.mergesort:
	cmp r4,r2
	bgt .if 			@ right should be greater than left to proceed
	b .break
	.if:
		sub r5,r4,r2 	@ mid = right - left
		lsr r5,r5,1  	@ mid = mid/2
		add r5,r5,r2 	@ mid = mid + left
		lsr r5,r5,2  	@ mid = mid/4
		lsl r5,r5,2	 	@ mid = mid * 4, now mid is multiple of 4

		sub sp,sp,16  	@ Create space in stack for 4 elements

		st r2,[sp]    	@ push left to stack
		st r5, 4[sp]  	@ push mid to stack
		st r4, 8[sp]  	@ push right to stack
		st ra, 12[sp] 	@ push return address to stack

		mov r4,r5     	@ right = mid

		call .mergesort @ mergesort(left, mid)

		ld r2,[sp]   	@ pop left from stack
		ld r5,4[sp]  	@ pop mid from stack
		ld r4,8[sp]  	@ pop right from stack
		ld ra,12[sp]	@ pop return address from stack
		
		add r2,r5,4  	@ left = mid + 1

		call .mergesort @ mergesort(mid+1, right)
		
		ld r2,[sp]   	@ pop left from stack
		ld r5,4[sp]  	@ pop mid from stack
		ld r4,8[sp]  	@ pop right from stack
		ld ra,12[sp] 	@ pop return address from stack
		
		add sp,sp,16 	@ Remove space in stack for 4 elements

		sub sp,sp,4 	@ Create space in stack for 1 element
		st ra,[sp]  	@ push return address to stack
	
		call .merge 	@ merge(left,mid,right)

		ld ra,[sp]  	@ pop return address from stack
		add sp,sp,4 	@ Remove space in stack for 1 element

	.break:
		ret
	
.merge: 	
	mov r8,r2            @ i is left
	.loop1:
		cmp r8,r5        
		bgt .break1      @  i > mid then break
		ld r9,[r8]       @  Take array[i]
		st r9,1000[r8]   @  Store array[i] in L[i]
		add r8,r8,4      @  i++
		b .loop1         
	.break1:

	add r8,r5,4          @ i is mid + 1


	.loop2:             
		cmp r8,r4        
		bgt .break2      @  i > right then break
		ld r9,[r8]       @  Take array[i]
		st r9,2000[r8]   @  Store array[i] in R[i]
		add r8,r8,4      @  i++
		b .loop2
	.break2: 

	mov r8,r2            @  i is left
	add r9,r5,4          @  j is mid+1
	mov r10,r2           @  k is left
	.while:
		cmp r8,r5        
		bgt .breakwhile1 @ i > mid then break
		cmp r9,r4
		bgt .breakwhile2 @ j > right then break
		ld r11,1000[r8]  @ Take L[i]
		ld r12,2000[r9]  @ Take R[j]
		cmp r11,r12      
		bgt .if1         @ L[i] > R[j]
		b .else
		.if1:
			st r12,[r10] @ Store R[j] in array[k]
			add r9,r9,4  @ j++
			b .afterif
		.else:
			st r11,[r10] @ Store L[i] in array[k]
			add r8,r8,4  @ i++
			b .afterif
		.afterif:
			add r10,r10,4 @ k++
			b .while
	.breakwhile1:
		cmp r9,r4
		bgt .afterbreak  @ j > right then break
		ld r12,2000[r9]  @ Take R[j]
		st r12,[r10]     @ Store R[j] in array[k]
		add r9,r9,4      @ j++
		add r10,r10,4    @ k++
		b .breakwhile1
	.breakwhile2:
		cmp r8,r5
		bgt .afterbreak  @ i > mid then break
		ld r11,1000[r8]  @ Take L[i]
		st r11,[r10]     @ Store L[i] in array[k]
		add r8,r8,4      @ i++
		add r10,r10,4    @ k++
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

