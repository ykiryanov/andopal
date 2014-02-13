        .text
        .align  4
        .globl  _ippsIIRSetTaps32f_16s


_ippsIIRSetTaps32f_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        beq     LBRC13
        cmp     r5, #0
        beq     LBRC13
        ldr     r3, [pc, #0x3B8]
        ldr     r2, [r5]
        sub     r12, r3, #1
        cmp     r12, r2
        beq     LBRC0
        cmp     r3, r2
        beq     LBRC0
        mvn     r0, #0x10
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBRC0:
        sub     r12, r3, #1
        cmp     r12, r2
        mov     r11, #0xC
        mov     r10, #8
        beq     LBRC7
        cmp     r3, r2
        mvnne   r0, #0x10
        bne     LBRC4
        ldr     r9, [r5, #0x28]
        cmp     r9, #0
        add     r2, r9, r9, lsl #2
        ble     LBRC2
        ldr     lr, [pc, #0x364]
        ldr     r3, [pc, #0x364]
        add     r12, r6, #0xC
        ldr     lr, [lr]
        mov     r8, #0
        mov     r1, r6
        mov     r0, #0x10
        mov     r7, r8
        mov     r4, #4
        str     r1, [sp, #8]
        str     r12, [sp, #0xC]
        str     r0, [sp, #4]
        str     lr, [sp, #0x14]
        str     r2, [sp]
        str     r10, [sp, #0x18]
LBRC1:
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x14]
        ldr     r10, [r2], #0x18
        str     r2, [sp, #0xC]
        mov     r0, r10
        bl      __eqsf2
        cmp     r0, #0
        beq     LBRC6
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0x14]
        ldr     r0, [r2], #0x18
        str     r2, [sp, #8]
        str     r0, [sp, #0x10]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBRC5
        ldr     r2, [pc, #0x2EC]
        mov     r1, r10
        ldr     r0, [r2]
        add     r2, r6, #4
        str     r2, [sp, #0x24]
        bl      __divsf3
        ldr     r1, [sp, #0x10]
        mov     r10, r0
        bl      __mulsf3
        ldr     r2, [r5, #4]
        add     r3, r6, #8
        str     r3, [sp, #0x10]
        str     r0, [r2, +r8]
        ldr     r2, [sp, #0x24]
        mov     r1, r10
        add     r8, r8, #0x14
        ldr     r0, [r2, +r7]
        add     r2, r6, #0x10
        str     r2, [sp, #0x24]
        add     r2, r6, #0x14
        str     r2, [sp, #0x28]
        bl      __mulsf3
        ldr     r2, [r5, #4]
        mov     r1, r10
        str     r0, [r2, +r4]
        ldr     r2, [sp, #0x10]
        add     r4, r4, #0x14
        ldr     r0, [r2, +r7]
        bl      __mulsf3
        ldr     r3, [r5, #4]
        ldr     r2, [sp, #0x18]
        mov     r1, r10
        str     r0, [r3, +r2]
        ldr     r3, [sp, #0x24]
        add     r2, r2, #0x14
        ldr     r0, [r3, +r7]
        str     r2, [sp, #0x18]
        bl      __mulsf3
        ldr     r2, [r5, #4]
        mov     r1, r10
        str     r0, [r2, +r11]
        ldr     r2, [sp, #0x28]
        add     r11, r11, #0x14
        ldr     r0, [r2, +r7]
        add     r7, r7, #0x18
        bl      __mulsf3
        ldr     r3, [sp, #4]
        ldr     r2, [r5, #4]
        subs    r9, r9, #1
        str     r0, [r2, +r3]
        add     r3, r3, #0x14
        str     r3, [sp, #4]
        bne     LBRC1
        ldr     r2, [sp]
LBRC2:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        bl      ownsConvert32fTo16s
LBRC3:
        add     r0, r0, #0xE
        str     r0, [r5, #0x30]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBRC4:
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBRC5:
        mvn     r0, #9
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBRC6:
        mvn     r0, #9
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBRC7:
        ldr     r2, [pc, #0x1D0]
        ldr     r7, [r5, #0x28]
        add     r9, r6, #4
        ldr     r1, [r2]
        ldr     r4, [r9, +r7, lsl #2]
        mov     r0, r4
        bl      __eqsf2
        cmp     r0, #0
        beq     LBRC12
        ldr     r3, [pc, #0x1B0]
        mov     r1, r4
        mov     r2, r7, lsl #1
        ldr     r0, [r3]
        add     r4, r2, #1
        add     r8, r7, #1
        bl      __divsf3
        ldr     r1, [r6]
        str     r0, [sp]
        bl      __mulsf3
        ldr     r3, [r5, #4]
        cmp     r8, #1
        str     r0, [r3]
        ble     LBRC11
        sub     r3, r7, #1
        add     r3, r3, #1
        cmp     r3, #4
        mov     r8, #1
        blt     LBRC9
        str     r4, [sp, #0x10]
        ldr     r4, [sp]
        sub     r3, r7, #3
        add     r1, r7, #1
        add     r0, r6, #8
        str     r7, [sp, #0x14]
        str     r6, [sp, #0x1C]
        str     r3, [sp, #0xC]
        str     r10, [sp, #0x18]
        str     r11, [sp, #0x20]
        mov     r6, r0
        mov     r7, r1
LBRC8:
        ldr     r0, [r6, #-4]
        mov     r1, r4
        mov     r11, r7, lsl #2
        bl      __mulsf3
        ldr     r2, [r5, #4]
        mov     r1, r4
        str     r0, [r2, +r8, lsl #2]
        ldr     r0, [r9, +r7, lsl #2]
        add     r10, r11, #4
        add     r11, r11, #8
        bl      __mulsf3
        ldr     r2, [r5, #4]
        mov     r1, r4
        str     r0, [r2, +r7, lsl #2]
        ldr     r0, [r6]
        add     r8, r8, #3
        add     r7, r7, #3
        bl      __mulsf3
        ldr     r3, [sp, #0x18]
        ldr     r2, [r5, #4]
        mov     r1, r4
        str     r0, [r3, +r2]
        ldr     r0, [r9, +r10]
        add     r3, r3, #0xC
        str     r3, [sp, #0x18]
        bl      __mulsf3
        ldr     r2, [r5, #4]
        mov     r1, r4
        str     r0, [r10, +r2]
        ldr     r0, [r6, #4]
        add     r6, r6, #0xC
        bl      __mulsf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [r5, #4]
        mov     r1, r4
        str     r0, [r2, +r3]
        ldr     r0, [r9, +r11]
        add     r2, r2, #0xC
        str     r2, [sp, #0x20]
        bl      __mulsf3
        ldr     r2, [sp, #0xC]
        cmp     r8, r2
        ldr     r2, [r5, #4]
        str     r0, [r11, +r2]
        ble     LBRC8
        ldr     r4, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r6, [sp, #0x1C]
LBRC9:
        add     r10, r7, #1
        add     r11, r8, r7
        ldr     r7, [sp]
        add     r6, r6, r8, lsl #2
LBRC10:
        ldr     r0, [r6], #4
        mov     r1, r7
        bl      __mulsf3
        ldr     r3, [r5, #4]
        mov     r1, r7
        str     r0, [r3, +r8, lsl #2]
        ldr     r0, [r9, +r11, lsl #2]
        add     r8, r8, #1
        bl      __mulsf3
        ldr     r3, [r5, #4]
        cmp     r8, r10
        str     r0, [r3, +r11, lsl #2]
        add     r11, r11, #1
        blt     LBRC10
LBRC11:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #0xC]
        mov     r2, r4
        bl      ownsConvert32fTo16s
        b       LBRC3
LBRC12:
        mvn     r0, #9
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBRC13:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x49493036
        .long   LBRC__2il0floatpacket.1
        .long   LBRC__2il0floatpacket.2


        .data
        .align  4


LBRC__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBRC__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


