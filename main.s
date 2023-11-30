
	
main:
	stmfd	sp!,{lr}	@ push return address onto stack
	bl	name
	
	mov		r0, #0		@ move return value into r0
	ldmfd	sp!, {lr}
	mov		pc, lr