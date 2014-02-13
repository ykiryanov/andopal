        .text
        .align  4
        .globl  _ipps_BitRev1_16


_ipps_BitRev1_16:
        stmdb   sp!, {r0, r4 - r11, lr}
        cmp     r1, #4
        ldmltia sp!, {r0, r4 - r11, pc}
        ldr     r3, [r2]
        ldr     lr, [r2, #4]
        mvn     r12, #0x1E, 4
        and     r1, r1, r12
        mov     r12, r3, asr #1
        cmp     r12, #0
        add     r3, r0, r1, lsl #3
        mov     r4, lr, asr #1
        add     r1, r2, #4
        ble     LCYL1
LCYL0:
        ldr     r1, [r0, +r12, lsl #4]
        ldr     r7, [r0, +r4, lsl #4]
        add     lr, r0, r4, lsl #4
        ldr     r8, [lr, #4]
        add     r5, r0, r12, lsl #4
        ldr     r6, [r5, #4]
        str     r7, [r0, +r12, lsl #4]
        str     r8, [r5, #4]
        ldr     r8, [lr, #0xC]
        ldr     r9, [r5, #8]
        ldr     r10, [r5, #0xC]
        ldr     r7, [lr, #8]
        str     r8, [r5, #0xC]
        mov     r11, r4, lsl #4
        str     r7, [r5, #8]
        str     r1, [r0, +r4, lsl #4]
        str     r6, [lr, #4]
        str     r10, [lr, #0xC]
        str     r9, [lr, #8]
        ldr     lr, [r3, +r4, lsl #4]
        mov     r1, r12, lsl #4
        add     r1, r1, #0x10
        add     r5, r0, r1
        ldr     r6, [r5, #4]
        ldr     r7, [r0, +r1]
        add     r9, r3, r4, lsl #4
        str     r7, [sp]
        ldr     r10, [r9, #4]
        str     lr, [r1, +r0]
        ldr     r8, [r5, #0xC]
        ldr     r7, [r5, #8]
        str     r10, [r5, #4]
        ldr     lr, [r9, #8]
        ldr     r10, [r9, #0xC]
        str     r10, [r5, #0xC]
        str     lr, [r5, #8]
        ldr     r5, [sp]
        add     lr, r3, r12, lsl #4
        str     r5, [r3, +r4, lsl #4]
        str     r6, [r9, #4]
        str     r7, [r9, #8]
        str     r8, [r9, #0xC]
        add     r4, r11, #0x10
        ldr     r10, [r0, +r4]
        ldr     r5, [r3, +r12, lsl #4]
        ldr     r6, [lr, #4]
        ldr     r7, [lr, #8]
        ldr     r8, [lr, #0xC]
        add     r9, r0, r4
        ldr     r11, [r9, #4]
        str     r10, [r3, +r12, lsl #4]
        add     r12, r1, r3
        str     r11, [lr, #4]
        ldr     r10, [r9, #8]
        ldr     r11, [r9, #0xC]
        str     r10, [lr, #8]
        add     r10, r3, r4
        str     r11, [lr, #0xC]
        str     r5, [r4, +r0]
        str     r6, [r9, #4]
        str     r7, [r9, #8]
        str     r8, [r9, #0xC]
        ldr     r6, [r4, +r3]
        ldr     r7, [r10, #4]
        ldr     lr, [r3, +r1]
        ldr     r5, [r12, #4]
        str     r6, [r3, +r1]
        str     r7, [r12, #4]
        ldr     r7, [r10, #8]
        ldr     r1, [r10, #0xC]
        ldr     r6, [r12, #8]
        str     r7, [r12, #8]
        ldr     r7, [r12, #0xC]
        str     r1, [r12, #0xC]
        str     lr, [r4, +r3]
        str     r5, [r10, #4]
        str     r6, [r10, #8]
        str     r7, [r10, #0xC]
        ldr     r1, [r2, #8]!
        ldr     lr, [r2, #4]
        mov     r12, r1, asr #1
        cmp     r12, #0
        add     r1, r2, #4
        mov     r4, lr, asr #1
        bgt     LCYL0
LCYL1:
        mov     r2, r12, lsl #4
        add     r8, r2, #0x10
        add     r2, r0, r8
        ldr     r9, [r3, +r12, lsl #4]
        ldr     lr, [r0, +r8]
        ldr     r4, [r2, #4]
        ldr     r5, [r2, #8]
        ldr     r6, [r2, #0xC]
        add     r7, r3, r12, lsl #4
        ldr     r10, [r7, #4]
        str     r9, [r8, +r0]
        str     r10, [r2, #4]
        ldr     r8, [r7, #8]
        ldr     r9, [r7, #0xC]
        str     r8, [r2, #8]
        str     r9, [r2, #0xC]
        str     lr, [r3, +r12, lsl #4]
        str     r4, [r7, #4]
        str     r5, [r7, #8]
        str     r6, [r7, #0xC]
        ldr     r2, [r1]
        mov     r12, r2, asr #1
        cmp     r12, #0
        addgt   r1, r1, #4
        bgt     LCYL1
        ldmia   sp!, {r0, r4 - r11, pc}


