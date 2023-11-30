

msg1:
    .data
    .asciz  "Name Function\n" @ 15
    .asciz  "*****Print Name*****\n" @ 22
    .asciz  "Team 17\n" @ 9
    .asciz  "Lo Haichi\n" @
    .asciz  "Huang Yijia\n"
    .asciz  "Lin Yuchen\n"
    .asciz  "*****End Print*****\n"

    .text
	.globl	name
name:
	stmfd	sp!,{lr}	@ push return address onto stack
    ldr		r0,=msg1	@ r0 = *msg1

	bl		printf
	mov		r0, msg1,#15
	ldr     r0, r0
	bl		printf
	mov		r0, #0		@ move return value into r0
	ldmfd	sp!, {lr}
	mov		pc, lr


