        .text
        .align  4
        .globl  _ipps_BitRev2_16


_ipps_BitRev2_16:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r2, #8
        bge     LCYI1
        ldr     r3, [r0]
        ldr     r12, [r0, #4]
        cmp     r2, #2
        str     r3, [r1]
        mov     r2, r2, lsl #4
        str     r12, [r1, #4]
        ldr     r3, [r0, #8]
        ldr     r12, [r0, #0xC]
        str     r3, [r1, #8]
        sub     r3, r2, #0x10
        add     r2, r0, r3
        str     r12, [r1, #0xC]
        ldr     lr, [r0, +r3]
        ldr     r12, [r2, #4]
        str     lr, [r3, +r1]
        add     r3, r1, r3
        str     r12, [r3, #4]
        ldr     r12, [r2, #8]
        ldr     r2, [r2, #0xC]
        str     r12, [r3, #8]
        str     r2, [r3, #0xC]
        ble     LCYI0
        ldr     r2, [r0, #0x10]
        ldr     r3, [r0, #0x14]
        str     r2, [r1, #0x20]
        str     r3, [r1, #0x24]
        ldr     r2, [r0, #0x18]
        ldr     r3, [r0, #0x1C]
        str     r2, [r1, #0x28]
        str     r3, [r1, #0x2C]
        ldr     r2, [r0, #0x20]
        ldr     r3, [r0, #0x24]
        str     r2, [r1, #0x10]
        str     r3, [r1, #0x14]
        ldr     r2, [r0, #0x28]
        ldr     r0, [r0, #0x2C]
        str     r2, [r1, #0x18]
        str     r0, [r1, #0x1C]
LCYI0:
        ldmia   sp!, {r4 - r10, pc}
LCYI1:
        ldr     lr, [r3, #4]
        ldr     r12, [r3]
        mvn     r4, #0x1E, 4
        and     r2, r2, r4
        mov     r4, lr, asr #1
        mov     r12, r12, asr #1
        add     lr, r1, r2, lsl #3
        cmp     r12, #0
        add     r2, r0, r2, lsl #3
        add     r5, r3, #4
        ble     LCYI3
LCYI2:
        ldr     r5, [r0, +r12, lsl #4]
        add     r6, r0, r12, lsl #4
        ldr     r7, [r6, #4]
        str     r5, [r1, +r4, lsl #4]
        add     r5, r1, r4, lsl #4
        str     r7, [r5, #4]
        ldr     r8, [r6, #8]
        ldr     r7, [r6, #0xC]
        add     r6, r2, r12, lsl #4
        str     r8, [r5, #8]
        str     r7, [r5, #0xC]
        ldr     r7, [r6, #4]
        ldr     r8, [r2, +r12, lsl #4]
        mov     r5, r4, lsl #4
        add     r5, r5, #0x10
        str     r8, [r1, +r5]
        add     r8, r1, r5
        str     r7, [r8, #4]
        ldr     r7, [r6, #8]
        ldr     r6, [r6, #0xC]
        str     r7, [r8, #8]
        str     r6, [r8, #0xC]
        ldr     r7, [r0, +r4, lsl #4]
        add     r6, r0, r4, lsl #4
        ldr     r8, [r6, #4]
        str     r7, [r1, +r12, lsl #4]
        add     r7, r1, r12, lsl #4
        str     r8, [r7, #4]
        ldr     r8, [r6, #8]
        ldr     r6, [r6, #0xC]
        str     r8, [r7, #8]
        str     r6, [r7, #0xC]
        ldr     r8, [r2, +r4, lsl #4]
        mov     r6, r12, lsl #4
        add     r6, r6, #0x10
        add     r7, r2, r4, lsl #4
        ldr     r9, [r7, #4]
        str     r8, [r1, +r6]
        add     r8, r1, r6
        str     r9, [r8, #4]
        ldr     r9, [r7, #8]
        ldr     r7, [r7, #0xC]
        str     r9, [r8, #8]
        str     r7, [r8, #0xC]
        ldr     r9, [r6, +r0]
        add     r8, r0, r6
        ldr     r10, [r8, #4]
        str     r9, [lr, +r4, lsl #4]
        add     r7, lr, r4, lsl #4
        str     r10, [r7, #4]
        ldr     r4, [r8, #8]
        ldr     r8, [r8, #0xC]
        str     r4, [r7, #8]
        add     r4, r2, r6
        str     r8, [r7, #0xC]
        ldr     r8, [r4, #4]
        ldr     r7, [r6, +r2]
        str     r7, [r5, +lr]
        add     r7, lr, r5
        str     r8, [r7, #4]
        ldr     r8, [r4, #8]
        ldr     r4, [r4, #0xC]
        str     r8, [r7, #8]
        str     r4, [r7, #0xC]
        ldr     r8, [r5, +r0]
        add     r4, r0, r5
        ldr     r7, [r4, #4]
        str     r8, [lr, +r12, lsl #4]
        add     r12, lr, r12, lsl #4
        str     r7, [r12, #4]
        ldr     r7, [r4, #8]
        ldr     r4, [r4, #0xC]
        str     r7, [r12, #8]
        str     r4, [r12, #0xC]
        ldr     r12, [r5, +r2]
        add     r5, r2, r5
        ldr     r4, [r5, #4]
        str     r12, [r6, +lr]
        add     r6, lr, r6
        str     r4, [r6, #4]
        ldr     r12, [r5, #8]
        ldr     r5, [r5, #0xC]
        str     r12, [r6, #8]
        str     r5, [r6, #0xC]
        ldr     r12, [r3, #8]!
        ldr     r4, [r3, #4]
        mov     r12, r12, asr #1
        cmp     r12, #0
        add     r5, r3, #4
        mov     r4, r4, asr #1
        bgt     LCYI2
LCYI3:
        ldr     r3, [r0, +r12, lsl #4]
        add     r4, r1, r12, lsl #4
        add     r6, r0, r12, lsl #4
        ldr     r7, [r6, #4]
        str     r3, [r1, +r12, lsl #4]
        mov     r3, r12, lsl #4
        add     r3, r3, #0x10
        str     r7, [r4, #4]
        ldr     r7, [r6, #8]
        ldr     r6, [r6, #0xC]
        str     r7, [r4, #8]
        str     r6, [r4, #0xC]
        ldr     r6, [r2, +r12, lsl #4]
        add     r4, r2, r12, lsl #4
        ldr     r7, [r4, #4]
        str     r6, [r1, +r3]
        add     r6, r1, r3
        str     r7, [r6, #4]
        ldr     r7, [r4, #0xC]
        ldr     r8, [r4, #8]
        add     r4, r0, r3
        str     r7, [r6, #0xC]
        str     r8, [r6, #8]
        ldr     r6, [r3, +r0]
        ldr     r7, [r4, #4]
        str     r6, [lr, +r12, lsl #4]
        add     r6, lr, r12, lsl #4
        str     r7, [r6, #4]
        ldr     r12, [r4, #8]
        ldr     r4, [r4, #0xC]
        str     r12, [r6, #8]
        add     r12, r2, r3
        str     r4, [r6, #0xC]
        ldr     r6, [r3, +r2]
        ldr     r4, [r12, #4]
        str     r6, [r3, +lr]
        add     r3, lr, r3
        str     r4, [r3, #4]
        ldr     r4, [r12, #8]
        ldr     r12, [r12, #0xC]
        str     r4, [r3, #8]
        str     r12, [r3, #0xC]
        ldr     r3, [r5]
        mov     r12, r3, asr #1
        cmp     r12, #0
        addgt   r5, r5, #4
        bgt     LCYI3
        ldmia   sp!, {r4 - r10, pc}


