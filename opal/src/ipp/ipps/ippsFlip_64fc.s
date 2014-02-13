        .text
        .align  4
        .globl  _ippsFlip_64fc


_ippsFlip_64fc:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LBSX3
        cmp     r1, #0
        beq     LBSX3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r2, #5
        mov     r5, #0
        sub     r4, r2, #1
        blt     LBSX1
        mov     r3, r4, lsl #4
        add     r3, r3, #0x1C
        add     r3, r3, r0
        sub     lr, r2, #5
        sub     r12, r1, #4
LBSX0:
        ldr     r6, [r3, #-0x1C]
        ldr     r7, [r3, #-0x18]
        add     r5, r5, #4
        str     r6, [r12, #4]
        cmp     r5, lr
        str     r7, [r12, #8]
        ldr     r6, [r3, #-0x14]
        ldr     r7, [r3, #-0x10]
        sub     r4, r4, #4
        str     r6, [r12, #0xC]
        str     r7, [r12, #0x10]
        ldr     r6, [r3, #-0x2C]
        ldr     r7, [r3, #-0x28]
        str     r6, [r12, #0x14]
        str     r7, [r12, #0x18]
        ldr     r6, [r3, #-0x24]
        ldr     r7, [r3, #-0x20]
        str     r6, [r12, #0x1C]
        str     r7, [r12, #0x20]
        ldr     r6, [r3, #-0x3C]
        ldr     r7, [r3, #-0x38]
        str     r6, [r12, #0x24]
        str     r7, [r12, #0x28]
        ldr     r6, [r3, #-0x34]
        ldr     r7, [r3, #-0x30]
        str     r6, [r12, #0x2C]
        str     r7, [r12, #0x30]
        ldr     r6, [r3, #-0x4C]
        ldr     r7, [r3, #-0x48]
        str     r6, [r12, #0x34]
        str     r7, [r12, #0x38]
        ldr     r6, [r3, #-0x44]
        ldr     r7, [r3, #-0x40]!
        str     r6, [r12, #0x3C]
        str     r7, [r12, #0x40]!
        ble     LBSX0
LBSX1:
        mov     r12, r5, lsl #4
        mov     r4, r4, lsl #4
        add     r3, r4, #0x1C
        sub     r12, r12, #4
        add     r0, r3, r0
        add     r1, r12, r1
LBSX2:
        ldr     r12, [r0, #-0x1C]
        ldr     r3, [r0, #-0x18]
        add     r5, r5, #1
        str     r12, [r1, #4]
        cmp     r5, r2
        str     r3, [r1, #8]
        ldr     r12, [r0, #-0x14]
        ldr     r3, [r0, #-0x10]!
        str     r12, [r1, #0xC]
        str     r3, [r1, #0x10]!
        blt     LBSX2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBSX3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


