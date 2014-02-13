        .text
        .align  4
        .globl  _ippsWinHann_32f


_ippsWinHann_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r8, r2
        beq     LALH4
        cmp     r9, #0
        beq     LALH4
        cmp     r8, #3
        blt     LALH2
        sub     r7, r8, #1
        mov     r0, r7
        bl      __floatsidf
        ldr     r5, [pc, #0x2CC]
        ldr     r4, [pc, #0x2CC]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        bl      cos
        add     lr, r10, r8, lsl #2
        add     r12, r9, r8, lsl #2
        sub     lr, lr, #4
        cmp     r8, #3
        str     lr, [sp, #4]
        mov     r5, r0
        mov     r6, r1
        sub     r11, r12, #4
        beq     LALH5
        mov     r0, r5
        mov     r1, r6
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r12, #0xFF, 12
        orr     r4, r12, #3, 4
        mov     r0, #0
        mov     r1, r4
        bl      __subdf3
        bl      sqrt
        cmp     r7, #0
        mov     r12, #0
        mov     lr, r12
        mov     r7, #1
        movlt   lr, r7
        add     lr, r8, lr
        sub     lr, lr, #1
        movs    r7, lr, asr #1
        sub     lr, r7, #1
        moveq   r8, r12
        moveq   r7, r4
        beq     LALH1
        mov     r8, r12
        mov     r7, r4
        mov     r3, r8
        str     r5, [sp, #0x14]
        mov     r2, r3
        str     r6, [sp, #0x10]
        mov     r5, r4
        str     lr, [sp]
        str     r12, [sp, #0x18]
        str     r1, [sp, #8]
        str     r0, [sp, #0xC]
        mov     r4, r2
        mov     r6, r3
LALH0:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        str     r1, [sp, #0x1C]
        mov     r0, #0
        mov     r2, r8
        mov     r3, r7
        bl      __subdf3
        ldr     r12, [sp, #0x1C]
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [r10], #4
        mov     r7, r0
        mov     r8, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r7
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9], #4
        ldr     r12, [sp, #4]
        ldr     r0, [r12], #-4
        str     r12, [sp, #4]
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, r7
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11], #-4
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        mov     r0, r6
        mov     r1, r5
        bl      __muldf3
        mov     r8, r1
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r7, r0
        mov     r0, r4
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r8
        mov     r0, r7
        bl      __subdf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r8, r0
        mov     r7, r1
        mov     r0, r6
        mov     r1, r5
        bl      __muldf3
        mov     r6, r1
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        mov     r5, r0
        mov     r0, r4
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp]
        sub     r12, r12, #1
        cmn     r12, #1
        str     r12, [sp]
        mov     r4, r0
        str     r1, [sp, #0x18]
        mov     r6, r8
        mov     r5, r7
        bne     LALH0
LALH1:
        cmp     r9, r11
        beq     LALH3
        mov     r0, #0
        mov     r12, #0xFF, 12
        orr     r4, r12, #3, 4
        mov     r2, r8
        mov     r3, r7
        mov     r1, r4
        bl      __subdf3
        sub     r3, r4, #1, 12
        mov     r2, #0
        bl      __muldf3
        ldr     r10, [r10]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9]
        ldr     r12, [sp, #4]
        ldr     r0, [r12]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LALH2:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LALH3:
        ldr     r10, [r10]
        str     r10, [r9]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LALH4:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LALH5:
        ldr     r2, [pc, #0x24]
        mov     r0, #0
        ldr     r2, [r2]
        str     r2, [r9]
        ldr     r10, [r10, #4]
        str     r10, [r9, #4]
        str     r2, [r12, #-4]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   LALH__2il0floatpacket.1


        .data
        .align  4


LALH__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


