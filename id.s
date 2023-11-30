

msg1:
    .data
    .asciz  "Name Function\n"
    .asciz  "**Please Enter Member "
    .asciz  " ID:**\n"
    .asciz  "** Please Enter Command **\n"
    .asciz  "*****Print Team Member ID and ID Summation*****\n"
    .asciz  "ID Summation = "

    .asciz  "*****End Print*****\n"



id:
    .text
	stmfd	sp!,{lr}	@ push return address onto stack
    name
	
	
	mov		r0, #0		@ move return value into r0
	ldmfd	sp!, {lr}
	mov		pc, lr