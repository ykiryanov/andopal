        .text
        .align  4
        .globl  _ippsWinBlackman_32fc


_ippsWinBlackman_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r4, r2
        mov     r5, r3
        beq     LALV4
        cmp     r8, #0
        beq     LALV4
        cmp     r4, #3
        blt     LALV2
        sub     r0, r4, #1
        str     r0, [sp, #4]
        bl      __floatsidf
        ldr     r7, [pc, #0x468]
        ldr     r6, [pc, #0x468]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r6
        bl      __divdf3
        bl      cos
        add     lr, r9, r4, lsl #3
        add     r12, r8, r4, lsl #3
        cmp     r4, #3
        sub     r10, lr, #8
        str     r0, [sp]
        str     r1, [sp, #8]
        sub     r11, r12, #8
        beq     LALV5
        mov     r0, r5
        bl      __extendsfdf2
        mov     r2, #0
        mov     r7, r1
        mov     r3, #0xFF, 12
        mov     r5, r0
        orr     r6, r3, #3, 4
        mov     r3, r6
        bl      __adddf3
        sub     r3, r6, #1, 12
        str     r3, [sp, #0x30]
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [sp, #0x30]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
        mov     r1, r7
        mov     r0, r5
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #8]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r6
        bl      __subdf3
        bl      sqrt
        ldr     r12, [sp, #4]
        mov     r7, #0
        mov     lr, #1
        cmp     r12, #0
        mov     r12, r7
        movlt   r12, lr
        add     r12, r4, r12
        sub     r12, r12, #1
        movs    lr, r12, asr #1
        str     r0, [sp, #4]
        mov     r0, r1
        sub     r12, lr, #1
        moveq   r4, r7
        moveq   r5, r6
        beq     LALV1
        mov     r3, #0xFF, 12
        mov     r1, #0
        orr     r2, r3, #3, 4
        mov     r4, r1
        mov     r7, r4
        mov     r5, r2
        mov     r3, r7
        mov     r6, r5
        mov     lr, r3
        str     r7, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     lr, [sp, #0x30]
        str     r3, [sp, #0x2C]
        str     r12, [sp, #0x28]
        str     r0, [sp, #0x1C]
        mov     r6, r1
        mov     r7, r2
LALV0:
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        str     r12, [sp, #0x34]
        sub     r3, r12, #1, 12
        mov     r0, r4
        mov     r2, #0
        mov     r1, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x18]
        mov     r3, r1
        ldr     r1, [sp, #0x14]
        bl      __subdf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x10]
        mov     r4, r1
        ldr     r1, [sp, #0xC]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x38]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        ldr     r2, [r9]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
        ldr     r0, [r9, #4]
        ldr     r12, [sp, #0x28]
        add     r9, r9, #8
        sub     r12, r12, #1
        str     r12, [sp, #0x28]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        ldr     r0, [r10]
        add     r8, r8, #8
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11]
        ldr     r0, [r10, #4]
        sub     r10, r10, #8
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11, #4]
        ldr     r2, [sp]
        ldr     r3, [sp, #8]
        ldr     r0, [sp, #0x2C]
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x1C]
        mov     r4, r0
        ldr     r0, [sp, #0x30]
        mov     r5, r1
        mov     r1, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r3, [sp, #0x34]
        mov     r2, #0
        bl      __subdf3
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x2C]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x1C]
        str     r1, [sp, #0x24]
        mov     r1, r7
        bl      __muldf3
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x30]
        ldr     r2, [sp]
        ldr     r3, [sp, #8]
        mov     r7, r1
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x28]
        sub     r11, r11, #8
        cmn     r12, #1
        str     r0, [sp, #0x30]
        mov     r6, r1
        str     r4, [sp, #0x2C]
        mov     r7, r5
        bne     LALV0
        ldr     r7, [sp, #0x20]
        ldr     r6, [sp, #0x24]
LALV1:
        cmp     r8, r11
        beq     LALV3
        mov     r0, r4
        mov     r1, r5
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        bl      __subdf3
        mov     r4, r0
        ldr     r0, [sp, #0x10]
        mov     r5, r1
        ldr     r1, [sp, #0xC]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r5
        mov     r0, r4
        bl      __subdf3
        ldr     r2, [r9]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
        ldr     r0, [r9, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        ldr     r0, [r10]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11]
        ldr     r0, [r10, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11, #4]
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LALV2:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LALV3:
        ldr     r2, [r9]
        str     r2, [r8]
        ldr     r9, [r9, #4]
        str     r9, [r8, #4]
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LALV4:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LALV5:
        ldr     r2, [pc, #0x34]
        mov     r0, #0
        ldr     r2, [r2]
        str     r2, [r8, #4]
        str     r2, [r8]
        ldr     r3, [r9, #8]
        str     r3, [r8, #8]
        ldr     r9, [r9, #0xC]
        str     r9, [r8, #0xC]
        str     r2, [r12, #-4]
        str     r2, [r12, #-8]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   LALV__2il0floatpacket.1


        .data
        .align  4


LALV__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


