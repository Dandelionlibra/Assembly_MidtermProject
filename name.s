.data
msg1:
    .word	msg1				@ msg1 store the address of label msg1 (4 bytes)
    .asciz	"Name Function\n"
msg2:
    .word	msg2				@ msg2 store the address of label msg2
    .asciz  "*****Print Name*****\n"
msg3:
    .word	msg3				@ msg3 store the address of label msg3
    .asciz	"Team 17\n"
name1:
    .asciz	"Lo Haichi\n"
name2:
    .asciz	"Huang Yijia\n"
name3:
    .asciz	"Lin Yuchen\n"
msg4:
    .asciz	"*****End Print*****\n"

strset:							@ Array
    .word	name1
    .word	name2
    .word	name3

    .globl	msg1
    .globl	msg2
    .globl	msg3
    .globl	msg4
    .globl	strset

.text
	.globl	name
	@.globl  main

name:
	stmfd	sp!,{lr}			@ push return address onto stack

    ldr     r4,=msg1			@ load address of msg1 into r4
    ldr     r0,[r4]				@ load value of msg1 into r0 (1.Addressing mode)
    add     r0,r0,#4			@ r0 = r0 + 4, because the first 4 bytes store the address of itself
    @mov     r0, r0
	bl		printf				@ printf("Name Function\n")

	ldr		r4,=msg2			@ load address of msg2 into r4
    mov		r2, #1				@ r2 = 1
    @mov		r0, r0
    ldr     r0,[r4, r2, lsl #2]!	@ r0 = r4 + r2 then logical shift left 2,
                                    @ then store the address in r4(2.Addressing mode)(Operand2)
    mov     r0, r4              @ r0 = r4
    @mov     r0, r0
	bl		printf				@ printf("*****Print Name*****\n")

	ldr		r4,=msg3			@ load address of msg3 into r4
    mov		r2, #4              @ r2 = 4
    @mov		r0, r0
    ldr		r0,[r4], r2			@ load r0 with word at the address r4 then increment r4 by r2 (3.Addressing mode)
    mov		r0, r4              @ r0 = r4
    @mov		r0, r0
	bl		printf				@ printf("Team 17\n")

    mov		r4,#0               @ r4 = 0

loop:
    eors	r0,r0,r0			@ r0 = r0^r0(expression = 0) and set CPSR flags(Z set 1)(Operand2)
    ldreq	r0,=strset			@ if Z == 1, r0 = *(strset) (Conditional Execution)
    ldr		r0,[r0, r4]			@ r0 = r0 + r4; r0 = r0 + 0
    bl		printf				@ printf(strset)
    add		r4,r4,#4			@ r4 = r4 + 4
    cmp		r4,#12				@ if(r4 == 12) (Operand2)
    blt		loop				@ jump to loop


    ldr		r0,=msg4			@ read address of msg4 into r0
    bl		printf				@ printf("*****End Print*****\n")



	mov		r0, #0				@ move return value into r0
	ldmfd	sp!, {lr}           @ pop return address from stack
	mov		pc, lr              @ return from name
