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
			
			mov		r2, #0
			
			mov		r3, #50
			
bubblesort
			sub		r3,r3,#1				; Make r3 equal to N-1
loop1									; outer loop
			cmp		r2,r3				; r2 is i, r3 is (N-1)
			beq		break1				; End outer loop
			mov		r4,#0				; r4 is j, initialised at 0
			sub		r5,r3,r2				; r5 is (N-i-1)
loop2
			cmp		r4,r5
			beq		break2				; End inner loop
			ldr		r6, [r0, r4, lsl #2]	; Retrieve element at index j
			add		r4,r4,#1				; Retrieve element at index j+1
			ldr		r7, [r0,r4,lsl #2]
			sub		r4,r4,#1
			cmp		r6,r7
			bgt		if					; If element at j is greater than at j+1
			b		afterif				; Necessary update
if										; Swap elements at j and j+1
			add		r4,r4,#1
			str		r6,[r0,	r4, lsl #2]
			sub		r4,r4,#1
			str		r7,[r0,	r4, lsl #2]
			
afterif
			add		r4,r4,#1				; Update j
			b		loop2
break2
			add		r2,r2,#1				; Update i
			b		loop1
break1
			end
			
