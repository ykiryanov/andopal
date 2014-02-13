        .text
        .align  4
        .globl  ownDownsampleFour_H263_8u_C1R


ownDownsampleFour_H263_8u_C1R:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r4, [sp, #0x28]
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        mov     r3, r3, asr #1
        cmp     r3, #0
        add     r4, r4, #1
        ble     LFFE3
        mov     r2, r2, asr #1
LFFE0:
        cmp     r2, #0
        ble     LFFE2
        add     r5, r1, r0
        sub     r5, r5, #1
        mov     r7, #0
        sub     r6, r0, #1
LFFE1:
        ldrb    r8, [r0, +r7, lsl #1]
        ldrb    r9, [r6, #2]!
        add     r10, r4, r8
        ldrb    r8, [r5, #1]
        add     r9, r10, r9
        ldrb    r10, [r5, #2]!
        add     r10, r8, r10
        add     r10, r9, r10
        mov     r8, r10, asr #2
        strb    r8, [r7, +lr]
        add     r7, r7, #1
        cmp     r7, r2
        blt     LFFE1
LFFE2:
        subs    r3, r3, #1
        add     lr, r12, lr
        add     r0, r0, r1, lsl #1
        bne     LFFE0
LFFE3:
        ldmia   sp!, {r4 - r10, pc}


