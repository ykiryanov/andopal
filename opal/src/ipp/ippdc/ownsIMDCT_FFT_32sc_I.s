        .text
        .align  4
        .globl  ownsIMDCT_FFT_32sc_I


ownsIMDCT_FFT_32sc_I:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #8
        mov     r7, r1
        sub     r12, r7, #3
        mov     r6, #1
        mov     r12, r6, lsl r12
        sub     r12, r12, #1
        mov     r5, r3
        rsb     lr, r12, r12, lsl #2
        add     r3, r2, r12, lsl #2
        add     lr, r2, lr, lsl #2
        add     r12, r2, r12, lsl #3
        str     lr, [sp, #4]
        str     r12, [sp]
        mov     r4, r0
        bl      LGGV_ownssplitcore_32sc_I_AAC
        ldrb    r2, [r5]
        ldrb    r1, [r5, #1]
        sub     r7, r7, #1
        mov     r7, r6, lsl r7
        cmp     r2, #0
        add     r12, r4, r7, lsl #3
        ble     LGGV1
LGGV0:
        ldr     r6, [r4, +r1, lsl #3]
        ldr     r7, [r4, +r2, lsl #3]
        mov     lr, r2, lsl #3
        str     r6, [r4, +r2, lsl #3]
        add     lr, lr, #8
        str     r7, [r4, +r1, lsl #3]
        ldr     r8, [r4, +lr]
        ldr     r7, [r12, +r1, lsl #3]
        mov     r6, r1, lsl #3
        add     r6, r6, #8
        str     r7, [r4, +lr]
        str     r8, [r12, +r1, lsl #3]
        ldr     r7, [r4, +r6]
        ldr     r8, [r12, +r2, lsl #3]
        str     r7, [r12, +r2, lsl #3]
        add     r7, r4, r2, lsl #3
        add     r2, r12, r2, lsl #3
        str     r8, [r6, +r4]
        ldr     r8, [r6, +r12]
        ldr     r9, [lr, +r12]
        str     r8, [lr, +r12]
        add     r8, r4, r1, lsl #3
        add     r1, r12, r1, lsl #3
        str     r9, [r6, +r12]
        ldr     r10, [r8, #4]
        ldr     r9, [r7, #4]
        str     r10, [r7, #4]
        str     r9, [r8, #4]
        add     r9, lr, r4
        ldr     r8, [r1, #4]
        ldr     r7, [r9, #4]
        add     lr, r12, lr
        str     r8, [r9, #4]
        str     r7, [r1, #4]
        add     r7, r4, r6
        ldr     r8, [r7, #4]
        ldr     r1, [r2, #4]
        add     r6, r12, r6
        str     r8, [r2, #4]
        str     r1, [r7, #4]
        ldr     r1, [r6, #4]
        ldr     r2, [lr, #4]
        str     r1, [lr, #4]
        str     r2, [r6, #4]
        ldrb    r2, [r5, #2]!
        ldrb    r1, [r5, #1]
        cmp     r2, #0
        bgt     LGGV0
LGGV1:
        mov     r1, r2, lsl #3
        add     r1, r1, #8
        ldr     lr, [r12, +r2, lsl #3]
        ldr     r6, [r4, +r1]
        str     lr, [r4, +r1]
        add     r1, r1, r4
        add     lr, r12, r2, lsl #3
        str     r6, [r12, +r2, lsl #3]
        ldr     r6, [lr, #4]
        ldr     r2, [r1, #4]
        str     r6, [r1, #4]
        str     r2, [lr, #4]
        ldrb    r2, [r5, #1]!
        cmp     r2, #0
        bgt     LGGV1
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LGGV_ownssplitcore_32sc_I_AAC:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x64
        ldr     r8, [sp, #0x88]
        ldr     r7, [sp, #0x8C]
        sub     lr, r1, #1
        mov     r6, #1
        mov     r1, r6, lsl r1
        cmp     lr, #0
        mov     r4, r1, lsl #1
        ble     LGGV14
        ldr     r9, [pc, #0x76C]
        mov     r12, #0
        sub     r5, r1, #1
        str     r7, [sp, #0x44]
        str     r8, [sp, #0x40]
        str     r3, [sp, #0x3C]
        str     r2, [sp, #0x38]
        str     r0, [sp, #0x24]
LGGV2:
        mov     r4, r4, asr #1
        cmp     r1, #0
        mov     r7, r4, lsl #1
        mov     r8, r6, lsl r12
        mov     r0, r4, asr #2
        mov     r2, r4, asr #3
        mov     r9, r7
        ble     LGGV6
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x24]
        mov     r3, #0
        str     r7, [sp, #8]
        str     r8, [sp, #0xC]
        str     r5, [sp, #0x14]
        str     r12, [sp, #0x18]
        str     lr, [sp, #0x1C]
LGGV3:
        cmp     r3, r1
        bge     LGGV5
        str     r9, [sp]
        str     r4, [sp, #0x20]
        str     r1, [sp, #4]
LGGV4:
        add     r12, r0, r3
        ldr     r1, [r2, +r3, lsl #3]
        add     lr, r0, r12
        ldr     r11, [r2, +lr, lsl #3]
        add     r4, r0, lr
        add     r5, r2, r3, lsl #3
        add     r6, r2, lr, lsl #3
        add     r7, r1, r11
        str     r7, [r2, +r3, lsl #3]
        sub     r1, r1, r11
        ldr     r11, [sp]
        add     r7, r2, r12, lsl #3
        ldr     r8, [r7, #4]
        add     r3, r11, r3
        ldr     r11, [sp, #4]
        add     r9, r2, r4, lsl #3
        ldr     r10, [r9, #4]
        cmp     r3, r11
        add     r11, r8, r10
        str     r11, [r7, #4]
        sub     r8, r8, r10
        add     r7, r1, r8
        str     r7, [r2, +lr, lsl #3]
        ldr     lr, [r2, +r12, lsl #3]
        ldr     r7, [r2, +r4, lsl #3]
        sub     r1, r1, r8
        add     r8, lr, r7
        str     r8, [r2, +r12, lsl #3]
        str     r1, [r2, +r4, lsl #3]
        ldr     r1, [r6, #4]
        ldr     r12, [r5, #4]
        sub     lr, lr, r7
        sub     r4, r12, r1
        sub     r7, r4, lr
        add     r1, r12, r1
        str     r1, [r5, #4]
        str     r7, [r6, #4]
        add     r4, lr, r4
        str     r4, [r9, #4]
        blt     LGGV4
        ldr     r9, [sp]
        ldr     r4, [sp, #0x20]
        ldr     r1, [sp, #4]
LGGV5:
        rsb     r3, r4, r9, lsl #1
        cmp     r3, r1
        mov     r9, r9, lsl #2
        blt     LGGV3
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        mov     r6, #1
LGGV6:
        cmp     r0, #1
        ble     LGGV13
        cmp     r5, #0
        mov     r3, r7
        ble     LGGV10
        str     r12, [sp, #0x18]
        str     lr, [sp, #0x1C]
        ldr     r12, [pc, #0x604]
        ldr     lr, [sp, #0x24]
        mov     r9, #0
        str     r7, [sp, #8]
        str     r8, [sp, #0xC]
        str     r0, [sp, #0x30]
LGGV7:
        add     r0, r2, r9
        cmp     r0, r1
        bge     LGGV9
        str     r3, [sp, #0x34]
        str     r2, [sp, #0x10]
        str     r5, [sp, #0x14]
        str     r4, [sp, #0x20]
        str     r1, [sp, #4]
LGGV8:
        ldr     r1, [sp, #0x30]
        ldr     r6, [lr, +r0, lsl #3]
        add     r10, lr, r0, lsl #3
        add     r8, r1, r0
        add     r4, r1, r8
        ldr     r2, [lr, +r4, lsl #3]
        add     r1, r1, r4
        add     r5, lr, r4, lsl #3
        add     r7, lr, r1, lsl #3
        add     r3, r6, r2
        str     r3, [lr, +r0, lsl #3]
        ldr     r11, [lr, +r8, lsl #3]
        ldr     r3, [lr, +r1, lsl #3]
        sub     r2, r6, r2
        add     r6, lr, r8, lsl #3
        add     r9, r11, r3
        str     r9, [lr, +r8, lsl #3]
        ldr     r8, [r10, #4]
        ldr     r9, [r5, #4]
        sub     r3, r11, r3
        ldr     r11, [sp, #0x34]
        add     r0, r11, r0
        ldr     r11, [sp, #4]
        cmp     r0, r11
        add     r11, r8, r9
        str     r11, [r10, #4]
        ldr     r10, [r6, #4]
        ldr     r11, [r7, #4]
        sub     r9, r8, r9
        sub     r8, r9, r3
        add     r9, r3, r9
        sub     r3, r10, r11
        str     r3, [sp, #0x28]
        str     r9, [sp, #0x2C]
        add     r11, r10, r11
        str     r11, [r6, #4]
        ldr     r6, [sp, #0x28]
        add     r3, r2, r3
        mov     r8, r8, lsl #1
        smull   r9, r8, r12, r8
        sub     r2, r6, r2
        ldr     r6, [sp, #0x2C]
        mov     r3, r3, lsl #1
        smull   r9, r3, r12, r3
        mov     r6, r6, lsl #1
        smull   r9, r6, r12, r6
        mov     r2, r2, lsl #1
        smull   r9, r2, r12, r2
        add     r9, r3, r8
        sub     r8, r8, r3
        add     r3, r6, r2
        str     r9, [lr, +r4, lsl #3]
        str     r8, [r5, #4]
        sub     r2, r2, r6
        str     r3, [lr, +r1, lsl #3]
        str     r2, [r7, #4]
        blt     LGGV8
        ldr     r3, [sp, #0x34]
        ldr     r2, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        ldr     r4, [sp, #0x20]
        ldr     r1, [sp, #4]
LGGV9:
        rsb     r9, r4, r3, lsl #1
        cmp     r9, r5
        mov     r3, r3, lsl #2
        blt     LGGV7
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #0xC]
        ldr     r0, [sp, #0x30]
        ldr     r12, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        mov     r6, #1
LGGV10:
        cmp     r2, #1
        ble     LGGV13
        cmp     r5, #0
        ble     LGGV13
        cmp     r1, #0
        ble     LGGV19
        mov     r9, #0
LGGV11:
        cmp     r2, #1
        add     r11, r0, r9
        ble     LGGV21
        str     r12, [sp, #0x18]
        str     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x24]
        mov     r6, #1
        add     r10, r9, #1
        mvn     r3, #0
        str     r10, [sp, #0x2C]
        str     r6, [sp, #0x34]
        str     r11, [sp, #0x28]
        str     r9, [sp]
        str     r7, [sp, #8]
        str     r8, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r0, [sp, #0x30]
        str     r5, [sp, #0x14]
        str     r4, [sp, #0x20]
        str     r1, [sp, #4]
LGGV12:
        ldr     r1, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
        ldr     r2, [sp, #0x2C]
        ldr     r5, [lr, +r1, lsl #3]
        add     r0, r0, r1
        ldr     r1, [sp, #0x30]
        add     r10, lr, r2, lsl #3
        add     r4, r1, r0
        ldr     r7, [lr, +r4, lsl #3]
        ldr     r1, [sp, #0xC]
        add     r3, r1, r3
        ldr     r1, [sp, #0x30]
        add     r1, r1, r4
        str     r1, [sp, #0x48]
        add     r1, r5, r7
        str     r1, [lr, +r2, lsl #3]
        ldr     r2, [sp, #0x48]
        ldr     r8, [sp, #0x28]
        ldr     r1, [lr, +r0, lsl #3]
        ldr     r6, [lr, +r2, lsl #3]
        add     r2, lr, r2, lsl #3
        str     r2, [sp, #0x4C]
        ldr     r2, [sp, #0x34]
        sub     r5, r5, r7
        sub     r7, r1, r6
        sub     r2, r8, r2
        add     r6, r1, r6
        str     r6, [lr, +r0, lsl #3]
        ldr     r11, [r10, #4]
        add     r1, lr, r4, lsl #3
        str     r1, [sp, #0x50]
        ldr     r9, [r1, #4]
        add     r1, lr, r0, lsl #3
        ldr     r0, [sp, #0x30]
        sub     r8, r11, r9
        add     r9, r11, r9
        str     r9, [r10, #4]
        ldr     r9, [sp, #0x4C]
        ldr     r10, [r1, #4]
        add     r6, r0, r2
        ldr     r9, [r9, #4]
        sub     r11, r7, r8
        add     r8, r7, r8
        str     r8, [sp, #0x54]
        mov     r7, r11, lsl #2
        add     r8, r10, r9
        str     r8, [r1, #4]
        ldr     r1, [sp, #0x40]
        ldr     r8, [r12, +r3, lsl #2]
        add     r0, r0, r6
        ldr     r1, [r1, +r3, lsl #2]
        sub     r10, r10, r9
        add     r9, r5, r10
        sub     r5, r5, r10
        rsb     r1, r1, #0
        smull   r1, r11, r7, r1
        mov     r9, r9, lsl #2
        str     r11, [sp, #0x58]
        str     r9, [sp, #0x60]
        smull   r9, r11, r9, r8
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x54]
        ldr     r10, [sp, #0x5C]
        mov     r8, r1, lsl #2
        ldr     r1, [sp, #0x30]
        adds    r10, r9, r10
        ldr     r9, [sp, #0x58]
        mov     r10, r5, lsl #2
        add     r1, r1, r0
        adc     r9, r11, r9
        str     r9, [lr, +r4, lsl #3]
        ldr     r4, [sp, #0x40]
        ldr     r9, [r12, +r3, lsl #2]
        ldr     r5, [sp, #0x60]
        ldr     r4, [r4, +r3, lsl #2]
        rsb     r9, r9, #0
        smull   r7, r9, r7, r9
        rsb     r4, r4, #0
        smull   r4, r5, r5, r4
        str     r5, [sp, #0x60]
        add     r5, lr, r6, lsl #3
        str     r7, [sp, #0x5C]
        add     r7, lr, r2, lsl #3
        str     r4, [sp, #0x58]
        ldr     r11, [sp, #0x58]
        add     r4, lr, r0, lsl #3
        str     r4, [sp, #0x54]
        ldr     r4, [sp, #0x5C]
        adds    r11, r4, r11
        ldr     r4, [sp, #0x60]
        adc     r9, r9, r4
        ldr     r4, [sp, #0x50]
        str     r9, [r4, #4]
        ldr     r4, [sp, #0x3C]
        ldr     r9, [r4, +r3, lsl #2]
        ldr     r4, [sp, #0x44]
        ldr     r4, [r4, +r3, lsl #2]
        smull   r9, r11, r10, r9
        str     r11, [sp, #0x58]
        str     r4, [sp, #0x60]
        add     r4, lr, r1, lsl #3
        str     r9, [sp, #0x5C]
        ldr     r9, [sp, #0x2C]
        add     r9, r9, #1
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #0x60]
        smull   r9, r11, r8, r9
        str     r11, [sp, #0x60]
        str     r9, [sp, #0x50]
        ldr     r9, [sp, #0x34]
        ldr     r11, [sp, #0x50]
        add     r9, r9, #1
        str     r9, [sp, #0x34]
        ldr     r9, [sp, #0x5C]
        adds    r11, r9, r11
        ldr     r9, [sp, #0x58]
        ldr     r11, [sp, #0x60]
        adc     r9, r9, r11
        ldr     r11, [sp, #0x48]
        str     r9, [lr, +r11, lsl #3]
        ldr     r9, [sp, #0x44]
        ldr     r11, [r9, +r3, lsl #2]
        ldr     r9, [sp, #0x3C]
        ldr     r9, [r9, +r3, lsl #2]
        rsb     r11, r11, #0
        smull   r10, r11, r10, r11
        smull   r9, r8, r8, r9
        adds    r10, r9, r10
        adc     r11, r8, r11
        ldr     r8, [sp, #0x4C]
        str     r11, [r8, #4]
        ldr     r10, [lr, +r2, lsl #3]
        ldr     r11, [lr, +r0, lsl #3]
        add     r8, r10, r11
        str     r8, [lr, +r2, lsl #3]
        ldr     r8, [lr, +r1, lsl #3]
        ldr     r9, [lr, +r6, lsl #3]
        sub     r2, r10, r11
        add     r10, r9, r8
        str     r10, [lr, +r6, lsl #3]
        ldr     r6, [sp, #0x54]
        ldr     r11, [r7, #4]
        sub     r8, r9, r8
        ldr     r10, [r6, #4]
        add     r6, r11, r10
        str     r6, [r7, #4]
        ldr     r6, [r5, #4]
        ldr     r9, [r4, #4]
        sub     r11, r11, r10
        sub     r7, r8, r11
        add     r11, r8, r11
        str     r11, [sp, #0x60]
        add     r8, r6, r9
        str     r8, [r5, #4]
        ldr     r8, [r12, +r3, lsl #2]
        ldr     r5, [sp, #0x40]
        sub     r6, r6, r9
        rsb     r8, r8, #0
        add     r9, r2, r6
        ldr     r5, [r5, +r3, lsl #2]
        mov     r7, r7, lsl #2
        smull   r8, r10, r7, r8
        mov     r9, r9, lsl #2
        smull   r5, r11, r9, r5
        sub     r6, r2, r6
        ldr     r2, [sp, #0x60]
        adds    r8, r5, r8
        adc     r10, r11, r10
        str     r10, [lr, +r0, lsl #3]
        ldr     r0, [sp, #0x40]
        mov     r2, r2, lsl #2
        mov     r6, r6, lsl #2
        ldr     r5, [r0, +r3, lsl #2]
        ldr     r0, [r12, +r3, lsl #2]
        rsb     r0, r0, #0
        smull   r9, r0, r9, r0
        rsb     r5, r5, #0
        smull   r7, r5, r7, r5
        adds    r9, r7, r9
        adc     r0, r5, r0
        ldr     r5, [sp, #0x54]
        str     r0, [r5, #4]
        ldr     r5, [sp, #0x3C]
        ldr     r0, [sp, #0x44]
        ldr     r7, [r5, +r3, lsl #2]
        ldr     r0, [r0, +r3, lsl #2]
        rsb     r7, r7, #0
        smull   r8, r7, r2, r7
        rsb     r0, r0, #0
        smull   r5, r0, r6, r0
        adds    r8, r5, r8
        adc     r7, r0, r7
        str     r7, [lr, +r1, lsl #3]
        ldr     r0, [sp, #0x44]
        ldr     r1, [r0, +r3, lsl #2]
        ldr     r0, [sp, #0x3C]
        ldr     r0, [r0, +r3, lsl #2]
        rsb     r1, r1, #0
        smull   r2, r1, r2, r1
        smull   r6, r0, r6, r0
        adds    r6, r2, r6
        adc     r0, r1, r0
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x34]
        str     r0, [r4, #4]
        cmp     r1, r2
        blt     LGGV12
        ldr     r9, [sp]
        ldr     r7, [sp, #8]
        ldr     r1, [sp, #4]
        str     r12, [sp, #0x38]
        str     lr, [sp, #0x24]
        ldr     r8, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0x30]
        ldr     r5, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        add     r9, r7, r9
        cmp     r9, r1
        blt     LGGV11
        b       LGGV19
LGGV13:
        add     r12, r12, #1
        cmp     r12, lr
        blt     LGGV2
        ldr     r0, [sp, #0x24]
LGGV14:
        cmp     r1, #0
        ble     LGGV18
        mov     r2, #0
        mov     r12, #4
        add     r3, r0, #8
LGGV15:
        cmp     r2, r1
        bge     LGGV17
LGGV16:
        ldr     r5, [r3, +r2, lsl #3]
        ldr     r6, [r0, +r2, lsl #3]
        add     lr, r0, r2, lsl #3
        add     r4, r3, r2, lsl #3
        add     r5, r5, r6
        str     r5, [r0, +r2, lsl #3]
        ldr     r7, [r3, +r2, lsl #3]
        ldr     r5, [r4, #4]
        sub     r6, r6, r7
        str     r6, [r3, +r2, lsl #3]
        ldr     r6, [lr, #4]
        add     r2, r12, r2
        cmp     r2, r1
        add     r5, r5, r6
        str     r5, [lr, #4]
        ldr     lr, [r4, #4]
        sub     r6, r6, lr
        str     r6, [r4, #4]
        blt     LGGV16
LGGV17:
        mov     r2, r12, lsl #1
        sub     r2, r2, #2
        cmp     r2, r1
        mov     r12, r12, lsl #2
        blt     LGGV15
LGGV18:
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
LGGV19:
        rsb     r9, r4, r7, lsl #1
        cmp     r9, r5
        mov     r7, r7, lsl #2
        bge     LGGV20
        cmp     r9, r1
        bge     LGGV19
        b       LGGV11
LGGV20:
        mov     r6, #1
        b       LGGV13
LGGV21:
        add     r9, r7, r9
        cmp     r9, r1
        blt     LGGV11
        b       LGGV19
        .long   0x5a82799a


