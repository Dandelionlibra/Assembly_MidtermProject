    .data
msg1:
	.word	msg1
    .asciz  "Name Function\n"
msg2:
    .asciz  "**Please Enter Member "
msg3:
    .asciz  " ID:**\n"	
	
summation:
	.word	0
    .asciz  "%d"
idlist:
	.word	0
    .asciz  "%d"
	
	.word	0
    .asciz  "%d"

	.word	0
    .asciz  "%d"



msg4:
    .asciz  "** Please Enter Command **\n"
msg5:
    .asciz  "*****Print Team Member ID and ID Summation*****\n"
msg6:
    .asciz  "ID Summation = "
msg7:
    .asciz  "*****End Print*****\n"

    .globl	msg1
    .globl	msg2
    .globl	msg3
    .globl	msg4
    .globl	msg5
    .globl	msg6
    .globl	msg7
	
    .globl	summation
    .globl	idlist


.text
	.globl	id
id:	
	stmfd	sp!,{lr}	@ push return address onto stack
<<<<<<< HEAD

    @bl      name


=======
	
	
>>>>>>> ac87d6840bfdbe49b8ad258224d5811eaf092926
	mov		r0, #0		@ move return value into r0
	ldmfd	sp!, {lr}
	mov		pc, lr
