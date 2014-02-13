        .text
        .align  4
        .globl  _ippsThreshold_LTInv_32f_I


_ippsThreshold_LTInv_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        mov     r9, r0
        cmp     r9, #0
        mov     r7, r1
        mov     r5, r2
        beq     LBMN23
        cmp     r7, #0
        ble     LBMN24
        ldr     r3, [pc, #0x794]
        mov     r0, r5
        ldr     r4, [r3]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        blt     LBMN9
        mov     r0, r5
        mov     r1, r4
        bl      __nesf2
        cmp     r0, #0
        mov     r10, #0
        beq     LBMN11
        mov     r0, r5
        bl      __extendsfdf2
        mov     r4, r1
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r5, r0
        mov     r0, #0
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
        mov     r6, r1
        eor     lr, r6, #2, 2
        subs    r12, r7, #2
        str     r0, [sp, #0x18]
        str     lr, [sp, #8]
        bmi     LBMN5
        add     r11, r9, #4
        mov     r8, r9
        str     r6, [sp, #0xC]
        str     r12, [sp, #0x1C]
        str     r10, [sp, #0x20]
        str     r7, [sp]
        str     r9, [sp, #4]
LBMN0:
        ldr     r0, [r8]
        bl      __extendsfdf2
        mov     r9, r0
        ldr     r0, [r11]
        mov     r10, r1
        bic     r12, r10, #2, 2
        str     r12, [sp, #0x40]
        bl      __extendsfdf2
        mov     r7, r1
        ldr     r1, [sp, #0x40]
        mov     r6, r0
        mov     r0, r9
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMN2
        bic     r1, r7, #2, 2
        mov     r0, r6
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMN1
        mov     r0, r9
        mov     r1, r10
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMN10
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11]
        b       LBMN4
LBMN1:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r9
        mov     r3, r10
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r8]
        mov     r0, r6
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r1, [sp, #8]
        ldrge   r1, [sp, #0xC]
        ldr     r0, [sp, #0x18]
        bl      __truncdfsf2
        str     r0, [r11]
        b       LBMN4
LBMN2:
        mov     r0, r9
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r1, [sp, #8]
        ldrge   r1, [sp, #0xC]
        ldr     r0, [sp, #0x18]
        bl      __truncdfsf2
        str     r0, [r8]
        bic     r1, r7, #2, 2
        mov     r0, r6
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMN3
        mov     r2, r6
        mov     r3, r7
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r11]
        b       LBMN4
LBMN3:
        mov     r0, r6
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r1, [sp, #8]
        ldrge   r1, [sp, #0xC]
        ldr     r0, [sp, #0x18]
        bl      __truncdfsf2
        str     r0, [r11]
LBMN4:
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x1C]
        add     r11, r11, #8
        add     r12, r12, #2
        str     r12, [sp, #0x20]
        cmp     r12, lr
        add     r8, r8, #8
        ble     LBMN0
        ldr     r6, [sp, #0xC]
        ldr     r10, [sp, #0x20]
        ldr     r7, [sp]
        ldr     r9, [sp, #4]
LBMN5:
        cmp     r10, r7
        mov     r8, #0
        blt     LBMN6
        mov     r0, r8
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBMN6:
        ldr     r0, [r9, +r10, lsl #2]
        mov     r12, r10, lsl #2
        str     r12, [sp]
        bl      __extendsfdf2
        mov     r11, r1
        mov     r7, r0
        bic     r1, r11, #2, 2
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBMN7
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r7
        mov     r3, r11
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r9, +r10, lsl #2]
        mov     r0, r8
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBMN7:
        mov     r0, r7
        mov     r1, r11
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r6, [sp, #8]
        ldr     r0, [sp, #0x18]
        mov     r1, r6
        bl      __truncdfsf2
        ldr     r1, [sp]
        str     r0, [r9, +r1]
LBMN8:
        mov     r0, r8
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBMN9:
        mvn     r0, #0x12
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBMN10:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        str     r1, [sp, #0x40]
        mov     r0, #0
        mov     r2, r9
        mov     r3, r10
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r8]
        ldr     r1, [sp, #0x40]
        mov     r0, #0
        mov     r2, r6
        mov     r3, r7
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r11]
        b       LBMN4
LBMN11:
        subs    r2, r7, #4
        movmi   r8, r10
        bmi     LBMN14
        mov     r8, r10
        add     r0, r9, #0xC
        add     r6, r9, #4
        add     r11, r9, #8
        mov     r5, r9
        str     r9, [sp, #4]
        str     r2, [sp, #0x18]
        str     r8, [sp, #0x14]
        str     r10, [sp, #0x20]
        str     r4, [sp, #0x1C]
        str     r7, [sp]
        mov     r9, r0
LBMN12:
        ldr     r0, [r5]
        bl      __extendsfdf2
        str     r1, [sp, #0x34]
        mov     r8, r0
        ldr     r0, [r6]
        bl      __extendsfdf2
        ldr     r2, [r11]
        str     r0, [sp, #0x30]
        mov     r10, r1
        str     r10, [sp, #0x40]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [r9]
        mov     r7, r0
        mov     r4, r1
        mov     r0, r2
        bl      __extendsfdf2
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x34]
        ldr     r2, [sp, #0x30]
        str     r0, [sp, #0x38]
        mov     r3, r10
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        str     r0, [sp, #0x24]
        mov     r10, r1
        str     r10, [sp, #0x28]
        mov     r0, r7
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        str     r0, [sp, #8]
        str     r1, [sp, #0x10]
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0xC]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMN18
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x2C]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r1, [sp, #0xC]
        mov     r10, r0
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMN17
        mov     r0, r10
        ldr     r3, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #8]
        bl      __muldf3
        ldr     r3, [sp, #0x28]
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x24]
        str     r0, [sp, #0x2C]
        mov     r0, r10
        bl      __muldf3
        str     r1, [sp, #0x28]
        mov     r10, r0
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x40]
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r5]
        ldr     r3, [sp, #0x34]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x10]
        mov     r2, r8
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r6]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        mov     r0, r10
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11]
        ldr     r1, [sp, #0x28]
        mov     r0, r10
        mov     r2, r7
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9]
LBMN13:
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x18]
        add     r6, r6, #0x10
        add     r1, r1, #4
        str     r1, [sp, #0x20]
        cmp     r1, r2
        add     r11, r11, #0x10
        add     r9, r9, #0x10
        add     r5, r5, #0x10
        ble     LBMN12
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x20]
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp]
        ldr     r9, [sp, #4]
LBMN14:
        cmp     r10, r7
        bge     LBMN8
        ldr     r6, [pc, #0x200]
        ldr     r5, [pc, #0x200]
        add     r11, r9, r10, lsl #2
LBMN15:
        ldr     r9, [r11]
        mov     r1, r4
        mov     r0, r9
        bl      __nesf2
        cmp     r0, #0
        ldreq   r0, [r5]
        moveq   r8, #4
        beq     LBMN16
        ldr     r0, [r6]
        mov     r1, r9
        bl      __divsf3
LBMN16:
        add     r10, r10, #1
        str     r0, [r11], #4
        cmp     r10, r7
        blt     LBMN15
        mov     r0, r8
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBMN17:
        ldr     r3, [sp, #0x34]
        mov     r0, #0
        mov     r12, #0xFF, 12
        orr     r10, r12, #3, 4
        mov     r1, r10
        mov     r2, r8
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r5]
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x40]
        mov     r0, #0
        mov     r1, r10
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r6]
        mov     r0, #0
        mov     r1, r10
        mov     r2, r7
        mov     r3, r4
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r11]
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        mov     r1, r10
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r9]
        b       LBMN13
LBMN18:
        mov     r0, r8
        ldr     r1, [sp, #0x34]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        ldreq   r12, [pc, #0x11C]
        ldreq   r0, [r12]
        beq     LBMN19
        ldr     r3, [sp, #0x34]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r8
        bl      __divdf3
        bl      __truncdfsf2
LBMN19:
        str     r0, [r5]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x40]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        ldreq   r12, [pc, #0xD8]
        ldreq   r0, [r12]
        beq     LBMN20
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x40]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
LBMN20:
        str     r0, [r6]
        mov     r0, r7
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        ldreq   r1, [pc, #0x94]
        ldreq   r0, [r1]
        beq     LBMN21
        mov     r2, r7
        mov     r3, r4
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
LBMN21:
        str     r0, [r11]
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        ldreq   r1, [pc, #0x50]
        ldreq   r0, [r1]
        beq     LBMN22
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        mov     r1, #0xFF, 12
        orr     r1, r1, #3, 4
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
LBMN22:
        str     r0, [r9]
        mov     r1, #4
        str     r1, [sp, #0x14]
        b       LBMN13
LBMN23:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBMN24:
        mvn     r0, #5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
        .long   LBMN__2il0floatpacket.1
        .long   LBMN__2il0floatpacket.2
        .long   ippConstantOfINF_32f


        .data
        .align  4


LBMN__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBMN__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


