        .text
        .align  4
        .globl  ilogbf


ilogbf:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        mvn     r1, #2, 2
        str     r0, [sp, #4]
        ands    r0, r0, r1
        mvn     r1, #0xFE, 10
        bic     r1, r1, #3, 2
        and     r1, r0, r1
        mov     r2, r0, asr #23
        bne     LACG0
        cmp     r2, #0xFF
        beq     LACG2
        add     r0, sp, #4
        mov     r2, sp
        add     r1, sp, #4
        mov     r12, #2, 2
        str     r12, [sp]
        mov     r3, #0x9D
        bl      __libm_error_support
        ldr     r0, [sp]
        add     sp, sp, #8
        ldr     pc, [sp], #4
LACG0:
        cmp     r2, #0xFF
        beq     LACG2
        sub     r0, r2, #0x7F
        cmn     r0, #0x7F
        beq     LACG3
LACG1:
        add     sp, sp, #8
        ldr     pc, [sp], #4
LACG2:
        mvn     r0, #2, 2
        add     sp, sp, #8
        ldr     pc, [sp], #4
LACG3:
        cmp     r1, #0
        beq     LACG1
        clz     r1, r1
        sub     r1, r1, #9
        sub     r0, r0, r1
        add     sp, sp, #8
        ldr     pc, [sp], #4


