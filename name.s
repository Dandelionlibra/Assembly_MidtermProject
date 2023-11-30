.data
msg1:
    .space  4
    .asciz  "Name Function\n" @ 15
msg2:
    .word   0xcafebabe
    .asciz  "*****Print Name*****\n" @ 22
msg3:
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

.text
	.globl	name
name:
	stmfd	sp!,{lr}	@ push return address onto stack

    ldr     r0,=msg1
	bl		printf

	ldr		r0,=msg2
	bl		printf

	ldr     r0,=msg3
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


