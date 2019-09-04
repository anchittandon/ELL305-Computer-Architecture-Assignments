main
		
		mov		r0, #0x1000
		mov		r1, #900
		str		r1, [r0, #0]
		mov		r1, #460
		str		r1, [r0, #4]
		mov		r1, #348
		str		r1, [r0, #8]
		mov		r1, #-179
		str		r1, [r0, #12]
		mov		r1, #181
		str		r1, [r0, #16]
		mov		r1, #45
		str		r1, [r0, #20]
		mov		r1, #-134
		str		r1, [r0, #24]
		mov		r1, #44
		str		r1, [r0, #28]
		mov		r1, #556
		str		r1, [r0, #32]
		mov		r1, #-128
		str		r1, [r0, #36]
		mov		r1, #77
		str		r1, [r0, #40]
		mov		r1, #93
		str		r1, [r0, #44]
		mov		r1, #-285
		str		r1, [r0, #48]
		mov		r1, #624
		str		r1, [r0, #52]
		mov		r1, #-99
		str		r1, [r0, #56]
		mov		r1, #260
		str		r1, [r0, #60]
		mov		r1, #59
		str		r1, [r0, #64]
		mov		r1, #-48
		str		r1, [r0, #68]
		mov		r1, #-70
		str		r1, [r0, #72]
		mov		r1, #-59
		str		r1, [r0, #76]
		mov		r1, #11
		str		r1, [r0, #80]
		mov		r1, #13
		str		r1, [r0, #84]
		mov		r1, #68
		str		r1, [r0, #88]
		mov		r1, #-50
		str		r1, [r0, #92]
		mov		r1, #68
		str		r1, [r0, #96]
		mov		r1, #34
		str		r1, [r0, #100]
		mov		r1, #61
		str		r1, [r0, #104]
		mov		r1, #-39
		str		r1, [r0, #108]
		mov		r1, #15
		str		r1, [r0, #112]
		mov		r1, #45
		str		r1, [r0, #116]
		mov		r1, #62
		str		r1, [r0, #120]
		mov		r1, #-140
		str		r1, [r0, #124]
		mov		r1, #-185
		str		r1, [r0, #128]
		mov		r1, #131
		str		r1, [r0, #132]
		mov		r1, #-125
		str		r1, [r0, #136]
		mov		r1, #-15
		str		r1, [r0, #140]
		mov		r1, #27
		str		r1, [r0, #144]
		mov		r1, #-196
		str		r1, [r0, #148]
		mov		r1, #99
		str		r1, [r0, #152]
		mov		r1, #-113
		str		r1, [r0, #156]
		mov		r1, #56
		str		r1, [r0, #160]
		mov		r1, #-87
		str		r1, [r0, #164]
		mov		r1, #-63
		str		r1, [r0, #168]
		mov		r1, #-14
		str		r1, [r0, #172]
		mov		r1, #36
		str		r1, [r0, #176]
		mov		r1, #26
		str		r1, [r0, #180]
		mov		r1, #27
		str		r1, [r0, #184]
		mov		r1, #97
		str		r1, [r0, #188]
		mov		r1, #-114
		str		r1, [r0, #192]
		mov		r1, #42
		str		r1, [r0, #196]
		
		
		mov		r2, #0          ; Starting address of the array
		
		mov		r3, #49	; REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
		lsl		r3, r3, #2
		add		r4, r2, r3
		
		bl		quicksort
		end
		
quicksort
		
		cmp		r4,r2				; right should be greater than left to proceed
		bgt		if
		b		break
		
if
		
		stmfd	sp!, {lr} ; push return address to stack
		
		bl		partition		; partition(left,right)
		
		ldmfd	sp!, {lr}		; pop return address from stack
		
		stmfd	sp!, {r2,r4,r5,lr}
		
		sub		r4,r5,#4			; right = pivot - 1
		
		bl		quicksort		; quicksort(left, pivot-1)
		
		ldmfd	sp!, {r2,r4,r5,lr}
		stmfd	sp!, {r2,r4,r5,lr}
		
		add		r2,r5,#4 		; left = pivot + 1
		
		bl		quicksort		; quicksort(pivot+1, right)
		
		ldmfd	sp!, {r2,r4,r5,lr}
		
break
		
		mov		pc, lr
		
partition
		
		ldr		r5, [r0, r4]				; Take array[right] as pivot
		sub		r6,r2,#4					; i = left - 1
		mov		r7,r2						; j = left
		
loop
		
		cmp		r7,r4
		bgt		breakloop				; j > right then break
		ldr		r9,[r0, r7]			; Take array[j]
		cmp		r5,r9
		bgt		if1					; array[j] < pivot then ...
		b		afterif
		
if1
		
		add		r6,r6,#4			; ... i++
		ldr		r8,[r0, r6]		; Take array[i]
		str		r8,[r0, r7]		; swap array[i] and array[j]
		str		r9,[r0, r6]
		
afterif
		
		add		r7,r7,#4			; j++
		b		loop
		
breakloop
		
		ldr		r8,[r0, r4]			; Take array[right]
		add		r5,r6,#4				; pivot = i+1
		ldr		r9,[r0, r5]			; Take array[i+1]
		str		r8,[r0, r5]			; Swap array[i+1] and array[right]
		str		r9,[r0, r4]
		
		mov		pc, lr
