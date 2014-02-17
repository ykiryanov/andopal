        .text
        .align  4
        .globl  ippiSub4x4_8u16s_C1R


ippiSub4x4_8u16s_C1R:
        stmdb   sp!, {r4 - r6, lr}
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        beq     LKEN1
        cmp     r2, #0
        beq     LKEN1
        cmp     lr, #0
        beq     LKEN1
        mov     r4, #4
LKEN0:
        ldrb    r6, [r0]
        ldrb    r5, [r2]
        subs    r4, r4, #1
        sub     r6, r6, r5
        strh    r6, [lr]
        ldrb    r6, [r0, #1]
        ldrb    r5, [r2, #1]
        sub     r6, r6, r5
        strh    r6, [lr, #2]
        ldrb    r6, [r0, #2]
        ldrb    r5, [r2, #2]
        sub     r6, r6, r5
        strh    r6, [lr, #4]
        ldrb    r6, [r0, #3]
        ldrb    r5, [r2, #3]
        add     r0, r0, r1
        add     r2, r2, r3
        sub     r6, r6, r5
        strh    r6, [lr, #6]
        add     lr, lr, r12
        bne     LKEN0
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LKEN1:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


