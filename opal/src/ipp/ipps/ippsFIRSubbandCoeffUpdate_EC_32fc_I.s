        .text
        .align  4
        .globl  _ippsFIRSubbandCoeffUpdate_EC_32fc_I


_ippsFIRSubbandCoeffUpdate_EC_32fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x8F, 30
        sub     sp, sp, #6, 18
        add     r10, sp, #6, 18
        ldr     r10, [r10, #0x260]
        add     r11, sp, #6, 18
        ldr     r11, [r11, #0x264]
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r7, r2
        mov     r4, r3
        beq     LDKV11
        cmp     r8, #0
        beq     LDKV11
        cmp     r7, #0
        beq     LDKV11
        cmp     r4, #0
        beq     LDKV11
        cmp     r11, #1
        blt     LDKV7
        mov     lr, #1
        orr     lr, lr, #1, 20
        cmp     lr, r11
        blt     LDKV7
        cmp     r10, #1
        blt     LDKV6
        cmp     r10, #0xFF
        bgt     LDKV6
        cmp     r11, #0
        ble     LDKV10
        mov     r5, r9
        mov     r6, r11
LDKV0:
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LDKV12
        subs    r6, r6, #1
        add     r5, r5, #8
        bne     LDKV0
        cmp     r10, #0
        ble     LDKV8
LDKV1:
        mov     r6, #0
        mov     r5, r11, lsl #1
LDKV2:
        cmp     r11, #0
        ble     LDKV4
        ldr     lr, [r8, +r6, lsl #2]
        mov     r1, #0
        sub     r0, r7, #4
        sub     r2, lr, #4
        sub     r3, r9, #4
        mov     lr, r1
        str     r6, [sp, #0x14]
        str     r10, [sp]
        str     r7, [sp, #4]
        str     r8, [sp, #8]
        str     r9, [sp, #0xC]
        str     r5, [sp, #0x18]
        str     r11, [sp, #0x1C]
        str     r4, [sp, #0x10]
        mov     r8, r0
        mov     r10, r1
        mov     r9, r2
        mov     r7, r3
        mov     r6, lr
LDKV3:
        ldr     r0, [r8, #4]
        ldr     r5, [r7, #8]
        ldr     r4, [r7, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [r8, #8]!
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x24]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r3, [r9, #4]
        add     r5, sp, #1, 16
        str     r0, [sp, #0x28]
        add     r5, r5, #0x4F, 30
        str     r3, [r5]
        ldr     r5, [r9, #8]!
        add     r2, sp, #1, 16
        add     r2, r2, #5, 26
        eor     r11, r5, #2, 2
        mov     r0, r3
        str     r11, [r2]
        mov     r4, r1
        bl      __extendsfdf2
        mov     r5, r0
        mov     r0, r11
        mov     r11, r1
        bl      __extendsfdf2
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x20]
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x24]
        mov     r2, r5
        mov     r3, r11
        bl      __muldf3
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x28]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        str     r1, [sp, #0x38]
        mov     r1, r4
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x38]
        bl      __subdf3
        add     r2, sp, #0x3C
        str     r0, [r2, +r10, lsl #4]
        add     r2, r2, r6
        str     r1, [r2, #4]
        ldr     r0, [sp, #0x28]
        mov     r1, r4
        mov     r2, r5
        mov     r3, r11
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        add     r4, sp, #0x44
        str     r0, [r4, +r10, lsl #4]
        add     r4, r4, r6
        str     r1, [r4, #4]
        ldr     r4, [sp, #0x1C]
        add     r10, r10, #1
        cmp     r10, r4
        add     r7, r7, #8
        add     r6, r6, #0x10
        blt     LDKV3
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x14]
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp]
        ldr     r4, [sp, #0x10]
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #0xC]
LDKV4:
        add     r1, sp, #1, 16
        add     r0, sp, #0x3C
        add     r1, r1, #0x4F, 30
        mov     r2, r5
        bl      _ippsConvert_64f32f
        cmp     r11, #0
        ble     LDKV9
        mov     r2, #0
        mov     r1, r2
        mov     r0, r6, lsl #2
        str     r7, [sp, #4]
        str     r8, [sp, #8]
        str     r9, [sp, #0xC]
        str     r10, [sp]
        mov     r7, r0
        mov     r8, r1
        mov     r9, r2
LDKV5:
        ldr     r10, [r4, +r7]
        add     lr, sp, #1, 16
        add     lr, lr, #0x4F, 30
        ldr     r1, [lr, +r8, lsl #3]
        ldr     r0, [r10, +r8, lsl #3]
        bl      __addsf3
        str     r0, [r10, +r8, lsl #3]
        ldr     r10, [r4, +r7]
        add     lr, sp, #1, 16
        add     lr, lr, #5, 26
        ldr     r1, [lr, +r8, lsl #3]
        add     r10, r9, r10
        ldr     r0, [r10, #4]
        add     r9, r9, #8
        add     r8, r8, #1
        bl      __addsf3
        cmp     r8, r11
        str     r0, [r10, #4]
        blt     LDKV5
        ldr     r10, [sp]
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #0xC]
        add     r6, r6, #1
        cmp     r6, r10
        blt     LDKV2
        b       LDKV8
LDKV6:
        add     sp, sp, #0x8F, 30
        mvn     r0, #6
        add     sp, sp, #6, 18
        ldmia   sp!, {r4 - r11, pc}
LDKV7:
        add     sp, sp, #0x8F, 30
        mvn     r0, #0x76
        add     sp, sp, #6, 18
        ldmia   sp!, {r4 - r11, pc}
LDKV8:
        add     sp, sp, #0x8F, 30
        mov     r0, #0
        add     sp, sp, #6, 18
        ldmia   sp!, {r4 - r11, pc}
LDKV9:
        add     r6, r6, #1
        cmp     r6, r10
        blt     LDKV2
        b       LDKV8
LDKV10:
        cmp     r10, #0
        bgt     LDKV1
        b       LDKV8
LDKV11:
        add     sp, sp, #0x8F, 30
        mvn     r0, #7
        add     sp, sp, #6, 18
        ldmia   sp!, {r4 - r11, pc}
LDKV12:
        add     sp, sp, #0x8F, 30
        mvn     r0, #5
        add     sp, sp, #6, 18
        ldmia   sp!, {r4 - r11, pc}


