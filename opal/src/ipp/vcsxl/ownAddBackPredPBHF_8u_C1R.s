        .text
        .align  4
        .globl  ownAddBackPredPBHF_8u_C1R


ownAddBackPredPBHF_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     lr, [sp, #0x3C]
        str     r2, [sp, #0x10]
        ldr     r12, [sp, #0x40]
        str     r3, [sp, #0x14]
        cmp     r2, #0
        ble     LFGL3
        mov     r9, #0
LFGL0:
        ldrb    r5, [r9, +r0]
        add     r4, r0, r9
        cmp     r3, #0
        add     r7, r9, lr
        add     r4, r1, r4
        ble     LFGL4
        cmp     r3, #4
        movlt   r6, #0
        blt     LFGL2
        mov     r6, #0
        sub     r8, r3, #4
        str     lr, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
LFGL1:
        ldrb    r0, [r4]
        ldrb    r3, [r7]
        add     r6, r6, #3
        add     r5, r5, r0
        add     lr, r5, #1
        cmp     r6, r8
        add     r11, r1, r4
        add     lr, r3, lr, asr #1
        add     r2, r12, r7
        add     r5, r1, r11
        mov     lr, lr, asr #1
        strb    lr, [r7]
        ldrb    lr, [r4, +r1]
        ldrb    r10, [r7, +r12]
        add     r3, r12, r2
        add     r0, r0, lr
        add     r0, r0, #1
        add     r4, r1, r5
        add     r0, r10, r0, asr #1
        mov     r0, r0, asr #1
        strb    r0, [r7, +r12]
        ldrb    r5, [r11, +r1]
        ldrb    r0, [r2, +r12]
        add     r7, r12, r3
        add     lr, lr, r5
        add     r3, lr, #1
        add     r3, r0, r3, asr #1
        mov     r0, r3, asr #1
        strb    r0, [r2, +r12]
        ble     LFGL1
        ldr     lr, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LFGL2:
        ldrb    r8, [r4], +r1
        ldrb    r10, [r7]
        add     r5, r5, r8
        add     r11, r5, #1
        mov     r5, r8
        add     r6, r6, #1
        add     r11, r10, r11, asr #1
        cmp     r6, r3
        mov     r8, r11, asr #1
        strb    r8, [r7], +r12
        blt     LFGL2
        add     r9, r9, #1
        cmp     r9, r2
        blt     LFGL0
LFGL3:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LFGL4:
        add     r9, r9, #1
        cmp     r9, r2
        blt     LFGL0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


