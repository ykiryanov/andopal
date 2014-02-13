        .text
        .align  4
        .globl  ownAddBackPredPBFH_8u_C1R


ownAddBackPredPBFH_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        str     r2, [sp, #8]
        ldr     lr, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        str     r3, [sp, #0xC]
        cmp     r3, #0
        ble     LFGM5
        sub     r4, r2, #5
LFGM0:
        ldrb    r8, [r0]
        cmp     r2, #0
        ble     LFGM4
        cmp     r2, #5
        mov     r7, #0
        blt     LFGM2
        mov     r6, r0
        sub     r5, lr, #1
        str     r1, [sp, #4]
        str     r0, [sp]
LFGM1:
        ldrb    r0, [r6, #1]
        ldrb    r10, [r7, +lr]
        ldrb    r1, [r5, #2]
        add     r8, r8, r0
        add     r11, r8, #1
        ldrb    r8, [r5, #3]
        ldrb    r9, [r5, #4]
        add     r11, r10, r11, asr #1
        mov     r10, r11, asr #1
        strb    r10, [r7, +lr]
        ldrb    r10, [r6, #2]
        add     r7, r7, #4
        cmp     r7, r4
        add     r0, r0, r10
        add     r0, r0, #1
        add     r0, r1, r0, asr #1
        mov     r0, r0, asr #1
        strb    r0, [r5, #2]
        ldrb    r0, [r6, #3]
        add     r10, r10, r0
        add     r10, r10, #1
        add     r10, r8, r10, asr #1
        mov     r1, r10, asr #1
        strb    r1, [r5, #3]
        ldrb    r8, [r6, #4]!
        add     r0, r0, r8
        add     r0, r0, #1
        add     r0, r9, r0, asr #1
        mov     r0, r0, asr #1
        strb    r0, [r5, #4]!
        ble     LFGM1
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LFGM2:
        add     r5, r7, r0
LFGM3:
        ldrb    r6, [r5, #1]!
        ldrb    r9, [r7, +lr]
        add     r8, r8, r6
        add     r8, r8, #1
        add     r9, r9, r8, asr #1
        mov     r8, r6
        mov     r9, r9, asr #1
        strb    r9, [r7, +lr]
        add     r7, r7, #1
        cmp     r7, r2
        blt     LFGM3
LFGM4:
        subs    r3, r3, #1
        add     r0, r1, r0
        add     lr, r12, lr
        bne     LFGM0
LFGM5:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


