        .text
        .align  4
        .globl  ownAddBackPredPBHH_8u_C1R


ownAddBackPredPBHH_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        str     r2, [sp, #0x10]
        ldr     lr, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        str     r3, [sp, #0x14]
        cmp     r3, #0
        ble     LFGK5
        sub     r5, r2, #4
LFGK0:
        ldrb    r4, [r0]
        ldrb    r6, [r0, +r1]
        cmp     r2, #0
        add     r10, r1, r0
        add     r4, r4, r6
        ble     LFGK4
        cmp     r2, #4
        mov     r9, #0
        blt     LFGK2
        mov     r8, r10
        mov     r7, r0
        sub     r6, lr, #1
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LFGK1:
        ldrb    r0, [r8, #1]
        ldrb    r11, [r7, #1]
        ldrb    r3, [r9, +lr]
        ldrb    r1, [r6, #2]
        ldrb    r2, [r6, #3]
        add     r0, r11, r0
        add     r4, r4, r0
        add     r4, r4, #2
        add     r4, r3, r4, asr #2
        mov     r3, r4, asr #1
        strb    r3, [r9, +lr]
        ldrb    r3, [r8, #2]
        ldrb    r4, [r7, #2]
        add     r9, r9, #3
        cmp     r9, r5
        add     r3, r4, r3
        add     r0, r0, r3
        add     r0, r0, #2
        add     r0, r1, r0, asr #2
        mov     r0, r0, asr #1
        strb    r0, [r6, #2]
        ldrb    r0, [r8, #3]!
        ldrb    r1, [r7, #3]!
        add     r4, r1, r0
        add     r3, r3, r4
        add     r0, r3, #2
        add     r0, r2, r0, asr #2
        mov     r0, r0, asr #1
        strb    r0, [r6, #3]!
        ble     LFGK1
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LFGK2:
        add     r0, r9, r0
        add     r7, r9, r10
LFGK3:
        ldrb    r6, [r7, #1]!
        ldrb    r11, [r0, #1]!
        ldrb    r8, [r9, +lr]
        add     r6, r11, r6
        add     r4, r4, r6
        add     r4, r4, #2
        add     r8, r8, r4, asr #2
        mov     r4, r6
        mov     r8, r8, asr #1
        strb    r8, [r9, +lr]
        add     r9, r9, #1
        cmp     r9, r2
        blt     LFGK3
LFGK4:
        subs    r3, r3, #1
        add     lr, r12, lr
        mov     r0, r10
        bne     LFGK0
LFGK5:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


