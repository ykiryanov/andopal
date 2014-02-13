        .text
        .align  4
        .globl  _ippsThreshold_LTInv_32f


_ippsThreshold_LTInv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r8, r2
        mov     r7, r3
        beq     LBMO24
        cmp     r6, #0
        beq     LBMO24
        cmp     r8, #0
        ble     LBMO25
        ldr     r12, [pc, #0x868]
        mov     r0, r7
        ldr     r4, [r12]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        blt     LBMO9
        mov     r0, r7
        mov     r1, r4
        bl      __nesf2
        cmp     r0, #0
        mov     r11, #0
        beq     LBMO11
        mov     r0, r7
        bl      __extendsfdf2
        mov     r3, r1
        mov     r12, #0xFF, 12
        str     r3, [sp, #0x2C]
        orr     r1, r12, #3, 4
        mov     r4, r0
        mov     r0, #0
        mov     r2, r4
        bl      __divdf3
        mov     r9, r1
        eor     r12, r9, #2, 2
        subs    r3, r8, #2
        str     r0, [sp, #0x1C]
        str     r12, [sp, #4]
        bmi     LBMO5
        mov     r0, r6
        mov     r12, r5
        str     r11, [sp, #0x24]
        add     r10, r5, #4
        add     r7, r6, #4
        str     r9, [sp, #0x14]
        str     r12, [sp, #0x28]
        str     r3, [sp, #0x20]
        str     r8, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r5, [sp, #8]
        mov     r11, r0
LBMO0:
        ldr     r1, [sp, #0x28]
        ldr     r0, [r1], #8
        str     r1, [sp, #0x28]
        bl      __extendsfdf2
        ldr     r2, [r10], #8
        mov     r8, r0
        mov     r9, r1
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r3, [sp, #0x2C]
        mov     r6, r1
        bic     r1, r9, #2, 2
        mov     r5, r0
        mov     r0, r8
        mov     r2, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMO2
        ldr     r3, [sp, #0x2C]
        bic     r1, r6, #2, 2
        mov     r0, r5
        mov     r2, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMO1
        mov     r0, r8
        mov     r1, r9
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        str     r1, [sp, #0x50]
        ldr     r3, [sp, #0x50]
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [sp, #0x18]
        str     r1, [sp]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMO10
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp]
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7]
        b       LBMO4
LBMO1:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r8
        mov     r3, r9
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r11]
        mov     r0, r5
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r1, [sp, #4]
        ldrge   r1, [sp, #0x14]
        ldr     r0, [sp, #0x1C]
        bl      __truncdfsf2
        str     r0, [r7]
        b       LBMO4
LBMO2:
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r1, [sp, #4]
        ldrge   r1, [sp, #0x14]
        ldr     r0, [sp, #0x1C]
        bl      __truncdfsf2
        str     r0, [r11]
        ldr     r3, [sp, #0x2C]
        bic     r1, r6, #2, 2
        mov     r0, r5
        mov     r2, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMO3
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r5
        mov     r3, r6
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r7]
        b       LBMO4
LBMO3:
        mov     r0, r5
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r1, [sp, #4]
        ldrge   r1, [sp, #0x14]
        ldr     r0, [sp, #0x1C]
        bl      __truncdfsf2
        str     r0, [r7]
LBMO4:
        ldr     r1, [sp, #0x24]
        ldr     r3, [sp, #0x20]
        add     r7, r7, #8
        add     r1, r1, #2
        str     r1, [sp, #0x24]
        cmp     r1, r3
        add     r11, r11, #8
        ble     LBMO0
        ldr     r9, [sp, #0x14]
        ldr     r11, [sp, #0x24]
        ldr     r8, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r5, [sp, #8]
LBMO5:
        cmp     r11, r8
        mov     r7, #0
        blt     LBMO6
        mov     r0, r7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBMO6:
        ldr     r0, [r5, +r11, lsl #2]
        mov     r10, r11, lsl #2
        bl      __extendsfdf2
        ldr     r3, [sp, #0x2C]
        mov     r8, r1
        mov     r5, r0
        bic     r1, r8, #2, 2
        mov     r2, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMO7
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r5
        mov     r3, r8
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r6, +r11, lsl #2]
        mov     r0, r7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBMO7:
        mov     r0, r5
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r9, [sp, #4]
        ldr     r0, [sp, #0x1C]
        mov     r1, r9
        bl      __truncdfsf2
        str     r0, [r6, +r10]
LBMO8:
        mov     r0, r7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBMO9:
        mvn     r0, #0x12
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBMO10:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        str     r1, [sp, #0x50]
        mov     r0, #0
        mov     r2, r8
        mov     r3, r9
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r11]
        ldr     r1, [sp, #0x50]
        mov     r0, #0
        mov     r2, r5
        mov     r3, r6
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r7]
        b       LBMO4
LBMO11:
        subs    r3, r8, #4
        movmi   r7, r11
        bmi     LBMO14
        mov     r7, r11
        add     r12, r5, #4
        str     r12, [sp, #4]
        add     r10, r5, #8
        add     r9, r5, #0xC
        add     r2, r6, #4
        add     r1, r6, #8
        add     r0, r6, #0xC
        mov     lr, r6
        mov     r12, r5
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x4C]
        str     r12, [sp, #0x20]
        str     r10, [sp, #0x48]
        str     r9, [sp, #0x30]
        str     lr, [sp, #0x34]
        str     r3, [sp, #0x28]
        str     r7, [sp]
        str     r11, [sp, #0x24]
        str     r4, [sp, #0x2C]
        str     r8, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r5, [sp, #8]
LBMO12:
        ldr     r1, [sp, #0x20]
        ldr     r0, [r1], #0x10
        str     r1, [sp, #0x20]
        bl      __extendsfdf2
        ldr     r12, [sp, #4]
        mov     r6, r1
        mov     r11, r0
        ldr     r2, [r12], #0x10
        str     r12, [sp, #4]
        str     r11, [sp, #0x50]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r12, [sp, #0x48]
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r12], #0x10
        str     r12, [sp, #0x48]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r12, [sp, #0x30]
        mov     r9, r0
        mov     r10, r1
        ldr     r2, [r12], #0x10
        str     r12, [sp, #0x30]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r7, r0
        mov     r8, r1
        mov     r0, r11
        mov     r1, r6
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x3C]
        mov     r11, r1
        str     r11, [sp, #0x40]
        mov     r0, r9
        mov     r1, r10
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x1C]
        mov     r3, r11
        bl      __muldf3
        str     r1, [sp, #0x18]
        mov     r11, r0
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMO19
        ldr     r3, [sp, #0x18]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r2, r11
        mov     r0, #0
        bl      __divdf3
        str     r1, [sp, #0x18]
        mov     r11, r0
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMO18
        mov     r0, r11
        ldr     r2, [sp, #0x38]
        ldr     r1, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        str     r0, [sp, #0x38]
        mov     r0, r11
        bl      __muldf3
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x1C]
        mov     r11, r0
        ldr     r0, [sp, #0x38]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x34]
        mov     r3, r6
        str     r0, [r12]
        ldr     r2, [sp, #0x50]
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x1C]
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x44]
        mov     r2, r7
        str     r0, [r12]
        ldr     r1, [sp, #0x40]
        mov     r0, r11
        mov     r3, r8
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x14]
        mov     r2, r9
        str     r0, [r12]
        ldr     r1, [sp, #0x40]
        mov     r0, r11
        mov     r3, r10
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x4C]
        str     r0, [r1]
LBMO13:
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        add     r0, r0, #4
        str     r0, [sp, #0x24]
        cmp     r0, r1
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x10
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x10
        str     r0, [sp, #0x34]
        ble     LBMO12
        ldr     r7, [sp]
        ldr     r11, [sp, #0x24]
        ldr     r4, [sp, #0x2C]
        ldr     r8, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r5, [sp, #8]
LBMO14:
        cmp     r11, r8
        bge     LBMO8
        ldr     r10, [pc, #0x234]
        ldr     r9, [pc, #0x234]
        add     r5, r5, r11, lsl #2
        add     r6, r6, r11, lsl #2
        str     r7, [sp]
LBMO15:
        ldr     r7, [r5], #4
        mov     r1, r4
        mov     r0, r7
        bl      __nesf2
        cmp     r0, #0
        beq     LBMO17
        ldr     r0, [r10]
        mov     r1, r7
        bl      __divsf3
LBMO16:
        add     r11, r11, #1
        str     r0, [r6], #4
        cmp     r11, r8
        blt     LBMO15
        ldr     r7, [sp]
        mov     r0, r7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBMO17:
        ldr     r0, [r9]
        mov     r3, #4
        str     r3, [sp]
        b       LBMO16
LBMO18:
        ldr     r2, [sp, #0x50]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        str     r1, [sp, #0x40]
        mov     r0, #0
        mov     r3, r6
        bl      __divdf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x34]
        mov     r2, r4
        str     r0, [r12]
        ldr     r1, [sp, #0x40]
        mov     r3, r5
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x44]
        mov     r2, r9
        str     r0, [r12]
        ldr     r1, [sp, #0x40]
        mov     r0, #0
        mov     r3, r10
        bl      __divdf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x14]
        mov     r2, r7
        str     r0, [r12]
        ldr     r1, [sp, #0x40]
        mov     r0, #0
        mov     r3, r8
        bl      __divdf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x4C]
        str     r0, [r1]
        b       LBMO13
LBMO19:
        ldr     r0, [sp, #0x50]
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        ldreq   r12, [pc, #0x12C]
        ldreq   r0, [r12]
        beq     LBMO20
        ldr     r2, [sp, #0x50]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r3, r6
        bl      __divdf3
        bl      __truncdfsf2
LBMO20:
        ldr     r12, [sp, #0x34]
        mov     r1, r5
        mov     r2, #0
        str     r0, [r12]
        mov     r0, r4
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        ldreq   r12, [pc, #0xE4]
        ldreq   r0, [r12]
        beq     LBMO21
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        bl      __truncdfsf2
LBMO21:
        ldr     r12, [sp, #0x44]
        mov     r1, r10
        mov     r2, #0
        str     r0, [r12]
        mov     r0, r9
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        ldreq   r12, [pc, #0x9C]
        ldreq   r0, [r12]
        beq     LBMO22
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r9
        mov     r3, r10
        bl      __divdf3
        bl      __truncdfsf2
LBMO22:
        ldr     r12, [sp, #0x14]
        mov     r1, r8
        mov     r2, #0
        str     r0, [r12]
        mov     r0, r7
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        ldreq   r0, [pc, #0x54]
        ldreq   r0, [r0]
        beq     LBMO23
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r7
        mov     r3, r8
        bl      __divdf3
        bl      __truncdfsf2
LBMO23:
        ldr     r1, [sp, #0x4C]
        str     r0, [r1]
        mov     r0, #4
        str     r0, [sp]
        b       LBMO13
LBMO24:
        mvn     r0, #7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBMO25:
        mvn     r0, #5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
        .long   LBMO__2il0floatpacket.1
        .long   LBMO__2il0floatpacket.2
        .long   ippConstantOfINF_32f


        .data
        .align  4


LBMO__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBMO__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


