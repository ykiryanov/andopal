        .text
        .align  4
        .globl  _ippsSubbandControllerInit_EC_16s


_ippsSubbandControllerInit_EC_16s:
        stmdb   sp!, {r1, r4 - r11, lr}
        ldr     r4, [sp, #0x28]
        mov     r5, r1
        cmp     r5, #0
        mov     r7, r2
        mov     r6, r3
        ble     LDKG1
        cmp     r7, #0
        ble     LDKG1
        cmp     r6, #0
        ble     LDKG1
        cmp     r4, #0x7D, 26
        beq     LDKG0
        cmp     r4, #0xFA, 26
        beq     LDKG0
        mvn     r0, #6
        ldmia   sp!, {r1, r4 - r11, pc}
LDKG0:
        cmp     r0, #0
        beq     LDKG2
        and     r12, r0, #0xF
        rsb     r12, r12, #0
        and     r12, r12, #0xF
        str     r5, [r12, +r0]
        add     r8, r0, r12
        str     r7, [r8, #4]
        str     r6, [r8, #8]
        str     r4, [r8, #0xC]
        add     r1, r5, r5, lsl #2
        add     r12, r7, r7, lsl #4
        add     r9, r8, #0x5C
        rsb     r12, r7, r12, lsl #2
        str     r12, [sp]
        mov     r0, r9
        add     r10, r9, r5, lsl #2
        bl      _ippsZero_32s
        str     r9, [r8, #0x10]
        str     r10, [r8, #0x14]
        add     r11, r10, r5, lsl #2
        str     r11, [r8, #0x18]
        ldr     r0, [sp]
        add     r11, r11, r5, lsl #2
        str     r11, [r8, #0x1C]
        mov     r0, r0, lsl #14
        add     r11, r11, r5, lsl #2
        str     r11, [r8, #0x20]
        mov     r1, r4
        bl      __intel_idiv
        rsb     r12, r7, r7, lsl #3
        rsb     r0, r0, #1, 18
        str     r0, [r8, #0x2C]
        rsb     r12, r7, r12, lsl #4
        mov     r9, #0x6A, 28
        mov     r0, r12, lsl #14
        mov     r1, r4
        bl      __intel_idiv
        rsb     r0, r0, #1, 18
        str     r0, [r8, #0x30]
        rsb     r12, r7, r7, lsl #2
        mov     r0, #1, 18
        add     r7, r7, r12, lsl #3
        str     r0, [r8, #0x44]
        mov     r0, r7, lsl #15
        mov     r1, r4
        bl      __intel_idiv
        mov     r1, r0
        rsb     r1, r1, #1, 18
        mov     r0, r7, lsl #16
        str     r1, [r8, #0x34]
        orr     r9, r9, #6, 18
        mul     r5, r5, r9
        mov     r1, r4
        bl      __intel_idiv
        mul     r6, r5, r6
        rsb     r0, r0, #1, 18
        str     r0, [r8, #0x38]
        mov     r0, #0xFF
        orr     r0, r0, #0x7F, 24
        str     r0, [r8, #0x3C]
        mov     r1, r6, asr #9
        mov     r0, #0
        add     r1, r6, r1, lsr #22
        str     r0, [r8, #0x28]
        str     r0, [r8, #0x58]
        mov     r1, r1, asr #10
        mov     r0, #1, 2
        str     r1, [r8, #0x48]
        str     r0, [r8, #0x24]
        mov     r0, #1, 2
        bl      __intel_idiv
        str     r0, [r8, #0x4C]
        mvn     r0, #0x1E
        str     r0, [r8, #0x50]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LDKG1:
        mvn     r0, #4
        ldmia   sp!, {r1, r4 - r11, pc}
LDKG2:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


