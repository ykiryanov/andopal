        .text
        .align  4
        .globl  logbf


logbf:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        mov     r2, r0
        str     r0, [sp, #4]
        mvn     r0, #2, 2
        ands    r1, r2, r0
        mov     r0, #0xFE, 10
        orr     r3, r0, #3, 2
        mov     r12, r1, asr #23
        bne     LABO3
        cmp     r12, #0x7F
        beq     LABO2
        cmp     r12, #0xFF
        bne     LABO5
LABO0:
        mvn     r3, r3
        tst     r1, r3
        beq     LABO1
        orr     r0, r2, #1, 10
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABO1:
        mov     r0, #0xFE, 10
        orr     r0, r0, #1, 2
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABO2:
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABO3:
        cmp     r12, #0x7F
        beq     LABO2
        cmp     r12, #0xFF
        beq     LABO0
        cmp     r12, #0
        mov     r0, #2, 2
        beq     LABO6
LABO4:
        subs    r1, r12, #0x7F
        rsbmi   r1, r1, #0
        movpl   r0, #0
        clz     r2, r1
        rsb     r3, r2, #0x9D
        sub     r2, r2, #8
        mov     r3, r3, lsl #23
        add     r2, r3, r1, lsl r2
        orr     r0, r0, r2
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABO5:
        add     r0, sp, #4
        mov     r2, sp
        add     r1, sp, #4
        str     r3, [sp]
        mov     r3, #0x97
        bl      __libm_error_support
        ldr     r0, [sp]
        add     sp, sp, #8
        ldr     pc, [sp], #4
LABO6:
        sub     r2, r0, #2, 10
        orr     r2, r2, #2, 2
        mvn     r2, r2
        and     r2, r1, r2
        clz     r1, r2
        sub     r1, r1, #9
        rsb     r12, r1, #0
        b       LABO4


