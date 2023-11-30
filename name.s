.data
msg1:
    .word  msg1
    .asciz  "Name Function\n" @ 15
msg2:
    .word   msg2
    .asciz  "*****Print Name*****\n" @ 22
msg3:
    .word   msg3
    .asciz  "Team 17\n" @ 9
name1:
    .asciz  "Lo Haichi\n" @
name2:
    .asciz  "Huang Yijia\n"
name3:
    .asciz  "Lin Yuchen\n"
msg4:
    .asciz  "*****End Print*****\n"

strset:
    .word name1
    .word name2
    .word name3

    .globl msg1
    .globl msg2
    .globl msg3
    .globl msg4
    .globl strset

.text
	.globl	name
name:
	stmfd	sp!,{lr}	@ push return address onto stack

    ldr     r4,=msg1
    ldr     r0,[r4]
    add     r0,r0,#4
    mov     r0, r0
	bl		printf

	ldr		r4,=msg2
    mov     r2, #1
    mov     r0, r0
    ldr     r0,[r4, r2, lsl #2]!
    mov     r0, r4
    mov     r0, r0
	bl		printf

	ldr     r4,=msg3
    mov     r2, #4
    mov     r0, r0
    ldr     r0,[r4], r2
    mov     r0, r4
    mov     r0, r0
	bl      printf

    mov     r4,#0
loop:
    eors     r0,r0,r0
    ldreq     r0,=strset
    ldr     r0,[r0, r4]
    bl      printf
    add     r4,r4,#4
    cmp     r4,#12
    blt     loop

    ldr     r0,=msg4
    bl      printf


	mov		r0, #0		@ move return value into r0
	ldmfd	sp!, {lr}
	mov		pc, lr


