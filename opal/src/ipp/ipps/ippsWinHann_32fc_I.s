        .text
        .align  4
        .globl  _ippsWinHann_32fc_I


_ippsWinHann_32fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        beq     LALE5
        cmp     r4, #3
        blt     LALE3
        sub     r5, r4, #1
        mov     r0, r5
        bl      __floatsidf
        ldr     r8, [pc, #0x31C]
        ldr     r6, [pc, #0x31C]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r8
        mov     r1, r6
        bl      __divdf3
        bl      cos
        add     r12, r7, r4, lsl #3
        cmp     r4, #3
        mov     r10, r0
        mov     r11, r1
        sub     r8, r12, #8
        beq     LALE4
        mov     r0, r10
        mov     r1, r11
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r12, #0xFF, 12
        orr     r9, r12, #3, 4
        mov     r0, #0
        mov     r1, r9
        bl      __subdf3
        bl      sqrt
        cmp     r5, #0
        mov     r12, #0
        mov     lr, r12
        mov     r5, #1
        movlt   lr, r5
        add     lr, r4, lr
        sub     lr, lr, #1
        mov     r2, r1
        movs    lr, lr, asr #1
        sub     r1, lr, #1
        moveq   r6, r12
        moveq   r5, r9
        beq     LALE1
        mov     r6, r12
        mov     r5, r9
        mov     r3, r6
        str     r11, [sp, #0xC]
        str     r10, [sp, #8]
        mov     r4, r3
        str     r12, [sp, #0x10]
        str     r2, [sp]
        str     r0, [sp, #4]
        mov     r11, r1
        mov     r10, r3
LALE0:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        str     r1, [sp, #0x14]
        mov     r2, r6
        mov     r3, r5
        mov     r0, #0
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        sub     r3, r2, #1, 12
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [r7]
        mov     r5, r0
        mov     r6, r1
        sub     r11, r11, #1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [r7, #4]
        str     r0, [r7]
        mov     r0, r1
        bl      __extendsfdf2
        mov     r3, r6
        mov     r2, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #4]
        ldr     r0, [r8]
        add     r7, r7, #8
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [r8, #4]
        str     r0, [r8]
        mov     r0, r1
        bl      __extendsfdf2
        mov     r3, r6
        mov     r2, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        mov     r6, r1
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        mov     r5, r0
        mov     r0, r4
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        mov     r6, r0
        mov     r5, r1
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        mov     r10, r1
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        mov     r9, r0
        mov     r0, r4
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        cmn     r11, #1
        sub     r8, r8, #8
        mov     r4, r0
        str     r1, [sp, #0x10]
        mov     r10, r6
        mov     r9, r5
        bne     LALE0
LALE1:
        cmp     r7, r8
        beq     LALE2
        mov     r12, #0xFF, 12
        orr     r4, r12, #3, 4
        mov     r2, r6
        mov     r0, #0
        mov     r1, r4
        mov     r3, r5
        bl      __subdf3
        sub     r3, r4, #1, 12
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [r7]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [r7, #4]
        str     r0, [r7]
        mov     r0, r1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #4]
        ldr     r0, [r8]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [r8, #4]
        str     r0, [r8]
        mov     r0, r1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
LALE2:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LALE3:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LALE4:
        ldr     r1, [pc, #0x30]
        mov     r0, #0
        ldr     r1, [r1]
        str     r1, [r7, #4]
        str     r1, [r7]
        str     r1, [r12, #-4]
        str     r1, [r12, #-8]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LALE5:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   LALE__2il0floatpacket.1


        .data
        .align  4


LALE__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


