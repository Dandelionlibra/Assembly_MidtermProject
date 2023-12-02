.data

namefunc:
    .word   namefunc
    .asciz  "Function1: Name\n"

idfunc:
    .asciz  "Function2: ID\n"

mainmsg1:
    .asciz   "\nMain Function:\n"
mainmsg2:
    .asciz   "*****Print All*****\n"

endl:
    .asciz   "\n"

fmtStrIntSpace:
    .asciz  "%d "

    .globl  endl

.text
	.globl  main
main:
	stmfd	sp!,{lr}	@ push return address onto stack
    ldr     r0, =namefunc
    ldr     r0, [r0]
    add     r0, r0, #4
    bl      printf
    mov     r0, r0, asl #0
	bl		name


    ldr      r0, =idfunc
    bl      printf
	bl		id

    ldr		r0, =mainmsg1
    bl		printf

    ldr     r0, =mainmsg2
    bl      printf

    ldr     r0, =msg3
    add     r0, r0, #4
    bl      printf

    mov     r4, #0

main_loop:

    ldr     r0, =fmtStrIntSpace
    ldr     r1, =idlist
    ldr     r1, [r1, r4]
    bl      printf
    ldr     r0, =strset
    ldr     r0, [r0, r4]
    bl      printf

    add     r4, r4, #4
    cmp     r4, #12
    blt     main_loop


    ldr     r0, =idmsg7
    bl      printf

    ldr     r0, =intendl
    ldr     r1, =summation
    ldr     r1, [r1]
    bl      printf

    ldr		r0, =msg4
    bl		printf


	mov		r0, #0		@ move return value into r0
	ldmfd	sp!, {lr}
	mov		pc, lr
