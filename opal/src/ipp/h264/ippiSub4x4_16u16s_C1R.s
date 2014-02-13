        .text
        .align  4
        .globl  _ippiSub4x4_16u16s_C1R


_ippiSub4x4_16u16s_C1R:
        stmdb   sp!, {r4 - r6, lr}
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        beq     LKEO1
        cmp     r2, #0
        beq     LKEO1
        cmp     lr, #0
        beq     LKEO1
        mov     r4, #4
LKEO0:
        ldrh    r6, [r0]
        ldrh    r5, [r2]
        subs    r4, r4, #1
        sub     r6, r6, r5
        strh    r6, [lr]
        ldrh    r6, [r0, #2]
        ldrh    r5, [r2, #2]
        sub     r6, r6, r5
        strh    r6, [lr, #2]
        ldrh    r6, [r0, #4]
        ldrh    r5, [r2, #4]
        sub     r6, r6, r5
        strh    r6, [lr, #4]
        ldrh    r6, [r0, #6]
        ldrh    r5, [r2, #6]
        add     r0, r0, r1
        add     r2, r2, r3
        sub     r6, r6, r5
        strh    r6, [lr, #6]
        add     lr, lr, r12
        bne     LKEO0
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LKEO1:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


