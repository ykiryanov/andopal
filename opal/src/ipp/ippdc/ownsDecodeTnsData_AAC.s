        .text
        .align  4
        .globl  ownsDecodeTnsData_AAC


ownsDecodeTnsData_AAC:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     r6, [sp, #0x68]
        ldr     lr, [sp, #0x60]
        ldr     r12, [sp, #0x64]
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x6C]
        cmp     r2, #2
        mov     r5, r0
        str     r6, [sp, #0x34]
        ldr     r6, [sp, #0x70]
        mov     r4, r1
        str     r6, [sp, #0x38]
        mov     r11, #1
        beq     LGHG7
        mov     r7, #2
        mov     r1, #6
        mov     r0, #5
        mov     r2, #0xC
LGHG0:
        cmp     r11, #0
        ble     LGHG6
        mov     r9, r3
        mov     r8, lr
        mov     r6, #0
        mov     r10, r6
        str     r2, [sp]
        str     r0, [sp, #4]
        str     r1, [sp, #8]
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r3, [sp, #0x14]
LGHG1:
        mov     r0, r5
        mov     r2, r7
        mov     r1, r4
        bl      ownsGetBits_AAC
        cmp     r0, #0
        str     r0, [r9]
        beq     LGHG5
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        add     r0, r0, #3
        str     r0, [r8]
        ldr     r3, [r9]
        cmp     r3, #0
        ble     LGHG5
        str     r8, [sp, #0x2C]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x24]
        str     r11, [sp, #0x18]
        ldr     r11, [sp]
        ldr     r9, [sp, #8]
        ldr     r8, [sp, #0x30]
        ldr     r10, [sp, #0xC]
        mov     r0, #0
        str     r7, [sp, #0x1C]
        mov     r7, r0
LGHG2:
        mov     r0, r5
        mov     r2, r9
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r10], #4
        ldr     r2, [sp, #4]
        mov     r0, r5
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r8], #4
        ldr     r3, [r8, #-4]
        cmp     r3, r11
        bgt     LGHG8
        cmp     r3, #0
        beq     LGHG4
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        ldr     r3, [sp, #0x34]
        mov     r2, #1
        str     r0, [r3]
        mov     r0, r5
        mov     r1, r4
        bl      ownsGetBits_AAC
        ldr     r12, [r8, #-4]
        ldr     r3, [sp, #0x10]
        cmp     r12, #0
        ldr     r12, [sp, #0x34]
        ldr     r3, [r3, +r6, lsl #2]
        add     r12, r12, #4
        str     r12, [sp, #0x34]
        sub     r2, r3, r0
        ble     LGHG4
        ldr     r11, [sp, #0x38]
        mov     r1, #0
        rsb     r0, r2, #0x20
        str     r6, [sp, #0x20]
        str     r10, [sp, #0xC]
        mov     r9, r0
        mov     r10, r1
        mov     r6, r2
LGHG3:
        mov     r0, r5
        mov     r2, r6
        mov     r1, r4
        bl      ownsGetBits_AAC
        mov     r0, r0, lsl r9
        add     r11, r11, #1
        mov     r0, r0, asr r9
        strb    r0, [r11, #-1]
        ldr     r3, [r8, #-4]
        add     r10, r10, #1
        cmp     r10, r3
        blt     LGHG3
        str     r11, [sp, #0x38]
        ldr     r6, [sp, #0x20]
        ldr     r11, [sp]
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #0xC]
LGHG4:
        ldr     r3, [sp, #0x14]
        add     r7, r7, #1
        ldr     r3, [r3, +r6, lsl #2]
        cmp     r7, r3
        blt     LGHG2
        str     r8, [sp, #0x30]
        str     r10, [sp, #0xC]
        ldr     r8, [sp, #0x2C]
        ldr     r9, [sp, #0x28]
        ldr     r10, [sp, #0x24]
        ldr     r7, [sp, #0x1C]
        ldr     r11, [sp, #0x18]
LGHG5:
        add     r10, r10, #1
        cmp     r10, r11
        add     r6, r6, #1
        add     r9, r9, #4
        add     r8, r8, #4
        blt     LGHG1
LGHG6:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGHG7:
        mov     r7, r11
        mov     r1, #4
        mov     r0, #3
        mov     r11, #8
        mov     r2, #7
        b       LGHG0
LGHG8:
        mvn     r0, #0x9A
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}


