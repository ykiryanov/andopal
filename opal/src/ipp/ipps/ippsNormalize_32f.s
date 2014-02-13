        .text
        .align  4
        .globl  _ippsNormalize_32f


_ippsNormalize_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r5, [sp, #0x70]
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        mov     r8, r2
        mov     r4, r3
        beq     LBBT12
        cmp     r7, #0
        beq     LBBT12
        cmp     r8, #1
        blt     LBBT11
        mov     r0, r5
        bl      __extendsfdf2
        mov     r12, #0x81, 12
        orr     r3, r12, #3, 4
        bic     r1, r1, #2, 2
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBBT10
        ldr     r12, [pc, #0x430]
        mov     r1, r5
        ldr     r0, [r12]
        bl      __divsf3
        cmp     r8, #8
        mov     r5, r0
        blt     LBBT5
        mov     r2, r8, asr #3
        cmp     r2, #0
        and     r1, r8, #7
        ble     LBBT1
        add     r9, r6, #0xC
        str     r9, [sp, #0x14]
        add     r9, r6, #0x10
        add     r3, r6, #0x18
        str     r9, [sp, #0x20]
        add     r9, r7, #0x14
        str     r3, [sp, #0x24]
        add     r3, r7, #0x1C
        str     r9, [sp, #0x1C]
        add     r12, r6, #8
        str     r3, [sp, #8]
        add     r9, r6, #0x14
        add     r3, r6, #0x1C
        add     r11, r6, #4
        str     r12, [sp, #4]
        str     r9, [sp, #0x18]
        str     r3, [sp, #0xC]
        add     r0, r7, #4
        add     lr, r7, #8
        add     r12, r7, #0xC
        mov     r3, r7
        add     r10, r7, #0x10
        add     r9, r7, #0x18
        str     r6, [sp, #0x10]
        str     r11, [sp, #0x40]
        str     r8, [sp, #0x2C]
        str     r7, [sp, #0x28]
        str     r6, [sp]
        ldr     r8, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
        ldr     r11, [sp, #4]
        str     r3, [sp, #0x34]
        str     r12, [sp, #0x44]
        str     lr, [sp, #0x48]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x30]
        str     r2, [sp, #0x38]
LBBT0:
        ldr     r2, [sp, #0x10]
        mov     r1, r4
        ldr     r0, [r2], #0x20
        str     r2, [sp, #0x10]
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [sp, #0x34]
        mov     r1, r4
        str     r0, [r2], #0x20
        ldr     r12, [sp, #0x40]
        ldr     r0, [r12]
        str     r2, [sp, #0x34]
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [sp, #0x3C]
        mov     r1, r4
        str     r0, [r2]
        ldr     r0, [r11], #0x20
        ldr     r2, [sp, #0x40]
        add     r2, r2, #0x20
        str     r2, [sp, #0x40]
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [sp, #0x48]
        mov     r1, r4
        str     r0, [r2]
        ldr     r2, [sp, #0x14]
        ldr     r0, [r2]
        ldr     r2, [sp, #0x3C]
        add     r2, r2, #0x20
        str     r2, [sp, #0x3C]
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [sp, #0x44]
        mov     r1, r4
        str     r0, [r2]
        ldr     r0, [r6], #0x20
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r10], #0x20
        ldr     r2, [sp, #0x48]
        ldr     r0, [r8], #0x20
        mov     r1, r4
        add     r2, r2, #0x20
        str     r2, [sp, #0x48]
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r7], #0x20
        ldr     r2, [sp, #0x24]
        mov     r1, r4
        ldr     r0, [r2]
        ldr     r2, [sp, #0x14]
        add     r2, r2, #0x20
        str     r2, [sp, #0x14]
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r9], #0x20
        ldr     r2, [sp, #0xC]
        mov     r1, r4
        ldr     r0, [r2]
        ldr     r2, [sp, #0x44]
        add     r2, r2, #0x20
        str     r2, [sp, #0x44]
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        ldr     r2, [sp, #8]
        str     r0, [r2], #0x20
        ldr     r12, [sp, #0x38]
        str     r2, [sp, #8]
        subs    r12, r12, #1
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0x24]
        ldr     r2, [sp, #0x38]
        add     r12, r12, #0x20
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0xC]
        add     r12, r12, #0x20
        str     r12, [sp, #0xC]
        bne     LBBT0
        ldr     r1, [sp, #0x30]
        ldr     r8, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        ldr     r6, [sp]
LBBT1:
        sub     r9, r8, r1
        cmp     r9, r8
        bge     LBBT9
        sub     r12, r8, r9
        cmp     r12, #6
        blt     LBBT3
        mov     r12, r9, lsl #2
        add     r12, r12, #4
        sub     r0, r8, #6
        add     r11, r12, r6
        str     r6, [sp]
        add     r10, r12, r7
        mov     r6, r0
LBBT2:
        ldr     r0, [r11, #-4]
        mov     r1, r4
        add     r9, r9, #5
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r10, #-4]
        ldr     r0, [r11]
        mov     r1, r4
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r10]
        ldr     r0, [r11, #4]
        mov     r1, r4
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r10, #4]
        ldr     r0, [r11, #8]
        mov     r1, r4
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r10, #8]
        ldr     r0, [r11, #0xC]
        mov     r1, r4
        add     r11, r11, #0x14
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r10, #0xC]
        cmp     r9, r6
        add     r10, r10, #0x14
        ble     LBBT2
        ldr     r6, [sp]
LBBT3:
        add     r6, r6, r9, lsl #2
        add     r7, r7, r9, lsl #2
LBBT4:
        ldr     r0, [r6], #4
        mov     r1, r4
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        add     r9, r9, #1
        str     r0, [r7], #4
        cmp     r9, r8
        blt     LBBT4
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBBT5:
        cmp     r8, #6
        mov     r9, #0
        blt     LBBT7
        sub     r0, r8, #6
        add     r10, r6, #4
        str     r6, [sp]
        add     r11, r7, #4
        mov     r6, r0
LBBT6:
        ldr     r0, [r10, #-4]
        mov     r1, r4
        add     r9, r9, #5
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r11, #-4]
        ldr     r0, [r10]
        mov     r1, r4
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r11]
        ldr     r0, [r10, #4]
        mov     r1, r4
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r11, #4]
        ldr     r0, [r10, #8]
        mov     r1, r4
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r11, #8]
        ldr     r0, [r10, #0xC]
        mov     r1, r4
        add     r10, r10, #0x14
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        str     r0, [r11, #0xC]
        cmp     r9, r6
        add     r11, r11, #0x14
        ble     LBBT6
        ldr     r6, [sp]
LBBT7:
        add     r6, r6, r9, lsl #2
        add     r7, r7, r9, lsl #2
LBBT8:
        ldr     r0, [r6], #4
        mov     r1, r4
        bl      __subsf3
        mov     r1, r5
        bl      __mulsf3
        add     r9, r9, #1
        str     r0, [r7], #4
        cmp     r9, r8
        blt     LBBT8
LBBT9:
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBBT10:
        mvn     r0, #9
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBBT11:
        mvn     r0, #5
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBBT12:
        mvn     r0, #7
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
        .long   LBBT__2il0floatpacket.1


        .data
        .align  4


LBBT__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


