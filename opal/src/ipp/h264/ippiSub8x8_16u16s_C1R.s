        .text
        .align  4
        .globl  _ippiSub8x8_16u16s_C1R


_ippiSub8x8_16u16s_C1R:
        stmdb   sp!, {r4 - r6, lr}
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        beq     LKEM1
        cmp     r2, #0
        beq     LKEM1
        cmp     lr, #0
        beq     LKEM1
        mov     r4, #8
LKEM0:
        ldrh    r6, [r2]
        ldrh    r5, [r0]
        subs    r4, r4, #1
        sub     r5, r5, r6
        strh    r5, [lr]
        ldrh    r5, [r0, #2]
        ldrh    r6, [r2, #2]
        sub     r5, r5, r6
        strh    r5, [lr, #2]
        ldrh    r5, [r0, #4]
        ldrh    r6, [r2, #4]
        sub     r5, r5, r6
        strh    r5, [lr, #4]
        ldrh    r5, [r0, #6]
        ldrh    r6, [r2, #6]
        sub     r5, r5, r6
        strh    r5, [lr, #6]
        ldrh    r5, [r0, #8]
        ldrh    r6, [r2, #8]
        sub     r5, r5, r6
        strh    r5, [lr, #8]
        ldrh    r5, [r0, #0xA]
        ldrh    r6, [r2, #0xA]
        sub     r5, r5, r6
        strh    r5, [lr, #0xA]
        ldrh    r5, [r0, #0xC]
        ldrh    r6, [r2, #0xC]
        sub     r5, r5, r6
        strh    r5, [lr, #0xC]
        ldrh    r5, [r0, #0xE]
        ldrh    r6, [r2, #0xE]
        add     r0, r0, r1
        add     r2, r2, r3
        sub     r5, r5, r6
        strh    r5, [lr, #0xE]
        add     lr, lr, r12
        bne     LKEM0
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LKEM1:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


