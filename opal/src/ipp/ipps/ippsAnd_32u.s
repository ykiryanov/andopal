        .text
        .align  4
        .globl  _ippsAnd_32u


_ippsAnd_32u:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBKA3
        cmp     r1, #0
        beq     LBKA3
        cmp     r2, #0
        beq     LBKA3
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r3, #6
        mov     r6, #0
        blt     LBKA1
        sub     r5, r3, #6
        add     r4, r0, #4
        add     lr, r1, #4
        add     r12, r2, #4
LBKA0:
        ldr     r7, [lr, #-4]
        ldr     r8, [r4, #-4]
        add     r6, r6, #5
        cmp     r6, r5
        and     r7, r8, r7
        str     r7, [r12, #-4]
        ldr     r7, [lr]
        ldr     r8, [r4]
        and     r7, r8, r7
        str     r7, [r12]
        ldr     r7, [lr, #4]
        ldr     r8, [r4, #4]
        and     r7, r8, r7
        str     r7, [r12, #4]
        ldr     r7, [lr, #8]
        ldr     r8, [r4, #8]
        and     r7, r8, r7
        str     r7, [r12, #8]
        ldr     r7, [lr, #0xC]
        ldr     r8, [r4, #0xC]
        add     r4, r4, #0x14
        add     lr, lr, #0x14
        and     r7, r8, r7
        str     r7, [r12, #0xC]
        add     r12, r12, #0x14
        ble     LBKA0
LBKA1:
        add     r0, r0, r6, lsl #2
        add     r1, r1, r6, lsl #2
        add     r2, r2, r6, lsl #2
LBKA2:
        ldr     r12, [r1], #4
        ldr     lr, [r0], #4
        add     r6, r6, #1
        and     r12, lr, r12
        str     r12, [r2], #4
        cmp     r6, r3
        blt     LBKA2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBKA3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


