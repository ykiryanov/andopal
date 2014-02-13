        .text
        .align  4
        .globl  _ippsWinBlackman_32f


_ippsWinBlackman_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r11, r0
        cmp     r11, #0
        mov     r10, r1
        mov     r4, r2
        mov     r5, r3
        beq     LALX4
        cmp     r10, #0
        beq     LALX4
        cmp     r4, #3
        blt     LALX2
        sub     r0, r4, #1
        str     r0, [sp]
        bl      __floatsidf
        ldr     r7, [pc, #0x400]
        ldr     r6, [pc, #0x400]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r6
        bl      __divdf3
        bl      cos
        add     lr, r11, r4, lsl #2
        sub     lr, lr, #4
        add     r12, r10, r4, lsl #2
        str     lr, [sp, #0x18]
        sub     lr, r12, #4
        cmp     r4, #3
        mov     r7, r0
        mov     r8, r1
        str     lr, [sp, #0x30]
        beq     LALX5
        mov     r0, r5
        bl      __extendsfdf2
        mov     r9, r1
        mov     r5, r0
        mov     r12, #0xFF, 12
        orr     r6, r12, #3, 4
        mov     r2, #0
        mov     r3, r6
        bl      __adddf3
        sub     r3, r6, #1, 12
        str     r3, [sp, #0x28]
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [sp, #0x28]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
        mov     r1, r9
        mov     r0, r5
        mov     r2, #0
        bl      __muldf3
        str     r0, [sp, #8]
        str     r1, [sp, #4]
        mov     r0, r7
        mov     r1, r8
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r6
        bl      __subdf3
        bl      sqrt
        ldr     r12, [sp]
        mov     r9, #0
        mov     lr, #1
        cmp     r12, #0
        mov     r12, r9
        movlt   r12, lr
        add     r12, r4, r12
        sub     r12, r12, #1
        movs    lr, r12, asr #1
        str     r0, [sp]
        mov     r0, r1
        sub     r12, lr, #1
        moveq   r5, r9
        moveq   r4, r6
        beq     LALX1
        mov     lr, #0xFF, 12
        mov     r1, #0
        orr     r3, lr, #3, 4
        mov     r5, r1
        mov     r9, r5
        mov     r4, r3
        mov     lr, r9
        mov     r6, r4
        mov     r2, lr
        str     r9, [sp, #0x28]
        str     r6, [sp, #0x20]
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x2C]
        str     r12, [sp, #0x14]
        str     r0, [sp, #0x24]
        mov     r7, r1
        mov     r6, r2
        mov     r9, r3
        mov     r8, lr
LALX0:
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        str     r12, [sp, #0x34]
        mov     r0, r5
        mov     r2, #0
        mov     r1, r4
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        bl      __subdf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x20]
        mov     r4, r0
        ldr     r0, [sp, #8]
        mov     r5, r1
        ldr     r1, [sp, #4]
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r5
        mov     r0, r4
        bl      __subdf3
        ldr     r2, [r11], #4
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r10], #4
        ldr     r12, [sp, #0x18]
        ldr     r0, [r12], #-4
        str     r12, [sp, #0x18]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x30]
        mov     r1, r9
        str     r0, [r12]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x1C]
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0x24]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        mov     r5, r0
        mov     r4, r1
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r3, [sp, #0x34]
        mov     r2, #0
        bl      __subdf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0x24]
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x20]
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x1C]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        mov     r6, r0
        mov     r7, r1
        sub     r12, r12, #1
        cmn     r12, #1
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x30]
        mov     r8, r5
        mov     r9, r4
        sub     r12, r12, #4
        str     r12, [sp, #0x30]
        bne     LALX0
        ldr     r9, [sp, #0x28]
        ldr     r6, [sp, #0x20]
LALX1:
        ldr     r12, [sp, #0x30]
        cmp     r10, r12
        beq     LALX3
        mov     r0, r5
        mov     r1, r4
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x10]
        mov     r3, r1
        ldr     r1, [sp, #0xC]
        bl      __subdf3
        mov     r4, r0
        ldr     r0, [sp, #8]
        mov     r5, r1
        ldr     r1, [sp, #4]
        mov     r2, r9
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r5
        mov     r0, r4
        bl      __subdf3
        ldr     r11, [r11]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r11
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r10]
        ldr     r12, [sp, #0x18]
        ldr     r0, [r12]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x30]
        str     r0, [r1]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LALX2:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LALX3:
        ldr     r11, [r11]
        str     r11, [r10]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LALX4:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LALX5:
        ldr     r2, [pc, #0x24]
        mov     r0, #0
        ldr     r2, [r2]
        str     r2, [r10]
        ldr     r11, [r11, #4]
        str     r11, [r10, #4]
        str     r2, [r12, #-4]
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   LALX__2il0floatpacket.1


        .data
        .align  4


LALX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


