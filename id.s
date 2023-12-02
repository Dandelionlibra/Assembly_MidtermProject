    .data
idmsg0:
    .asciz  "Function 2: ID\n"
idmsg1:
    .asciz  "*****Input ID*****\n"
idmsg2:
    .asciz  "** Please Enter Member 1 ID:**\n"
idmsg3:
    .asciz  "** Please Enter Member 2 ID:**\n"
idmsg4:
    .asciz  "** Please Enter Member 3 ID:**\n"

summation:
	.word	0
idlist:
	.word	0
	.word	0
	.word	0

inputstr:
    .align  10

fmtstrint:
    .asciz  "%d"

fmtstr:
    .asciz  "%s"

command:
    .asciz  "p"

intendl:
    .asciz  "%d\n"

idmsg5:
    .asciz  "** Please Enter Command **\n"
idmsg6:
    .asciz  "*****Print Team Member ID and ID Summation*****\n"
idmsg7:
    .asciz  "\nID Summation = "
idmsg8:
    .asciz  "*****End Print*****\n"

    .globl	summation
    .globl	idlist


.text
	.globl	id
id:
	stmfd	sp!,{lr}	@ push return address onto stack
    mov     r0, #0      @ clear r0
    mov     r1, #0      @ clear r1
    mov     r0, r1, lsl #1
@--------------------
    mov     r0, lr      @ save return address
    adds    lr, pc, r0  @ !!!
    mov     lr, r0      @ restore return address
@--------------------
    and   r0, r0, #0   @ clear r0
    orrs   r0, r0, #1
    ldrne    r0, =idmsg0   @ load address of msg1 into r0
    bl     printf      @ call printf
@--------------------
    eors  r0, r0, r0   @ clear r0
    cmp   r0, #1
    ldrlt    r0, =idmsg1   @ load address of msg1 into r0
    bl    printf      @ call printf
@--------------------
    mov   r0, #1
    cmp   r0, #0
    ldrgt  r0, =idmsg2   @ load address of msg1 into r0
    bl    printf      @ call printf
@--------------------  @ input id1
    ldr   r0, =fmtstrint
    ldr   r1, =idlist
    bl    scanf
@--------------------
    ldr   r0, =idmsg3
    bl    printf
@--------------------  @ input id2
    ldr   r0, =fmtstrint
    ldr   r1, =idlist+4
    bl    scanf
@--------------------
    ldr   r0, =idmsg4
    bl    printf
@--------------------  @ input id3
    ldr   r0, =fmtstrint
    ldr   r1, =idlist+8
    bl    scanf
@====================
loop2:
    ldr   r0, =idmsg5
    bl    printf
@ input command
    ldr   r0, =fmtstr
    ldr   r1, =inputstr
    bl    scanf

    @ if inputstr != "p", then jump to loop2
    ldr   r0, =inputstr
    ldr   r1, =command
    bl    strcmp
    cmp   r0, #0
    bne   loop2
@====================
    ldr   r0, =idmsg6
    bl    printf
@ print id1

    ldr   r0, =intendl
    ldr   r1, =idlist
    ldr   r1, [r1]
    bl   printf
@ print id2
    ldr   r0, =intendl
    ldr   r1, =idlist+4
    ldr   r1, [r1]
    bl   printf
@ print id3
    ldr   r0, =intendl
    ldr   r1, =idlist+8
    ldr   r1, [r1]
    bl   printf

@--------------------

    ldr   r0, =idmsg7
    bl    printf


@ calculate summation

    mov   r4, #0
loop3:
    ldr   r0, =idlist
    ldr   r0, [r0, r4]
    ldr   r1, =summation
    ldr   r1, [r1]
    add   r1, r1, r0
    ldr   r0, =summation
    str   r1, [r0]
    add   r4, r4, #4
    cmp   r4, #12
    blt   loop3

@ print summation

    ldr  r0, =intendl
    ldr  r1, =summation
    ldr  r1, [r1]
    bl   printf

@ end print

    ldr   r0, =idmsg8
    bl    printf

	mov		r0, #0		@ move return value into r0
	ldmfd	sp!, {lr}
	mov		pc, lr
