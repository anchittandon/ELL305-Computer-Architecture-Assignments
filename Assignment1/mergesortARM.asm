main
			mov		r0, #0x1000  ; starting address a little to ahead of 0 to save space for instructions
			
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
			
			mov		r2, #0
			
			mov		r3, #49
			mov		r3, r3, lsl #2
			add		r4, r2, r3
			
			bl		mergesort
			end
			
mergesort
			cmp		r4,r2
			bgt		if				; right should be greater than left to proceed
			b		break
if
			sub		r5,r4,r2			; mid = right - left
			lsr		r5,r5,#1			; mid = mid/2
			add		r5,r5,r2			; mid = mid + left
			lsr		r5,r5,#2			; mid = mid/4
			lsl		r5,r5,#2			; mid = mid * 4, now mid is multiple of 4
			
			stmfd	sp!, {r2,r4,r5,lr}  ; push left, right, mid and return address to stack
			
			mov		r4,r5			; right = mid
			
			bl		mergesort			; mergesort(left, mid)
			
			ldmfd	sp!, {r2,r4,r5,lr}	 ; pop left, right, mid and return address from stack
			stmfd	sp!, {r2,r4,r5,lr}	 ; push left, right, mid and return address to stack
			
			add		r2,r5,#4			;  left = mid + 1
			
			bl		mergesort			; mergesort(mid+1, right)
			
			ldmfd	sp!, {r2,r4,r5,lr}	 ; pop left, right, mid and return address from stack
			
			stmfd	sp!, {lr}			 ; push return address to stack
			
			bl		merge
			
			ldmfd	sp!, {lr}			 ; pop return address from stack
			
break
			mov		pc, lr			; move return address to program counter
			
merge
			mov		r8,r2			; i is left
loop1
			cmp		r8,r5
			bgt		break1			; i > mid then break
			add		r8,r8,r0
			ldr		r9,[r8]			; Take array[i]
			str		r9,[r8, #0x500]	; Store array[i] in L[i]
			sub		r8,r8,r0
			add		r8,r8,#4			; i++
			b		loop1
break1
			
			add		r8,r5,#4			; i is mid + 1
			
loop2
			cmp		r8,r4
			bgt		break2			; i > right then break
			add		r8,r8,r0
			ldr		r9,[r8]			; Take array[i]
			str		r9,[r8, #0x1000]	; Store array[i] in R[i]
			sub		r8,r8,r0
			add		r8,r8,#4			; i++
			b		loop2
break2
			
			mov		r8,r2			; i is left
			add		r9,r5,#4			; j is mid+1
			mov		r10,r2			; k is left
while
			cmp		r8,r5
			bgt		breakwhile1		; i > mid then break
			cmp		r9,r4
			bgt		breakwhile2		; j > right then break
			add		r8,r8,r0
			add		r9,r9,r0
			ldr		r11,[r8,	#0x500]	; Take L[i]
			ldr		r12,[r9,	#0x1000]	; Take R[j]
			sub		r8,r8,r0
			sub		r9,r9,r0
			cmp		r11,r12
			bgt		if1				; L[i] > R[j]
			b		else
if1
			add		r10,r10,r0
			str		r12,[r10]			; Store R[j] in array[k]
			sub		r10,r10,r0
			add		r9,r9,#4			; j++
			b		afterif
else
			add		r10,r10,r0
			str		r11,[r10]			; Store L[i] in array[k]
			sub		r10,r10,r0
			add		r8,r8,#4			; i++
			b		afterif
afterif
			add		r10,r10,#4		; k++
			b		while
breakwhile1
			cmp		r9,r4
			bgt		afterbreak		; j > right then break
			add		r9,r9,r0
			ldr		r12,[r9, #0x1000]	; Take R[j]
			sub		r9,r9,r0
			add		r10,r10,r0
			str		r12,[r10]			; Store R[j] in array[k]
			sub		r10,r10,r0
			add		r9,r9,#4			; j++
			add		r10,r10,#4		; k++
			b		breakwhile1
breakwhile2
			cmp		r8,r5
			bgt		afterbreak		; i > mid then break
			add		r8,r8,r0
			ldr		r11,[r8, #0x500]	; Take L[i]
			sub		r8,r8,r0
			add		r10,r10,r0
			str		r11,[r10]			; Store L[i] in array[k]
			sub		r10,r10,r0
			add		r8,r8,#4			; i++
			add		r10,r10,#4		; k++
			b		breakwhile2
afterbreak
			mov		pc, lr			; move return address to program counter
			
