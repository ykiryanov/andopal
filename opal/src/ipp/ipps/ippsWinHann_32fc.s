        .text
        .align  4
        .globl  _ippsWinHann_32fc


_ippsWinHann_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r7, r2
        beq     LALF4
        cmp     r8, #0
        beq     LALF4
        cmp     r7, #3
        blt     LALF2
        sub     r0, r7, #1
        str     r0, [sp]
        bl      __floatsidf
        ldr     r5, [pc, #0x364]
        ldr     r4, [pc, #0x364]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        bl      cos
        add     lr, r9, r7, lsl #3
        add     r12, r8, r7, lsl #3
        cmp     r7, #3
        sub     r10, lr, #8
        mov     r5, r0
        mov     r6, r1
        sub     r11, r12, #8
        beq     LALF5
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
        ldr     r12, [sp]
        str     r0, [sp]
        cmp     r12, #0
        mov     r0, r1
        mov     r1, #0
        mov     r12, r1
        mov     lr, #1
        movlt   r12, lr
        add     r12, r7, r12
        sub     r12, r12, #1
        movs    lr, r12, asr #1
        sub     r12, lr, #1
        moveq   r2, r1
        moveq   r7, r4
        beq     LALF1
        mov     r2, r1
        mov     r7, r4
        mov     r3, r2
        str     r6, [sp, #8]
        mov     lr, r3
        str     r5, [sp, #0xC]
        mov     r6, r4
        str     lr, [sp, #0x10]
        str     r3, [sp, #0x18]
        str     r12, [sp, #0x14]
        str     r0, [sp, #4]
        mov     r5, r1
        mov     r4, r2
LALF0:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        str     r1, [sp, #0x1C]
        mov     r3, r7
        mov     r2, r4
        mov     r0, #0
        bl      __subdf3
        ldr     r2, [sp, #0x1C]
        sub     r3, r2, #1, 12
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [r9]
        mov     r4, r0
        mov     r7, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r7
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
        ldr     r12, [sp, #0x14]
        ldr     r0, [r9, #4]
        add     r9, r9, #8
        sub     r12, r12, #1
        str     r12, [sp, #0x14]
        bl      __extendsfdf2
        mov     r3, r7
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        ldr     r0, [r10]
        add     r8, r8, #8
        bl      __extendsfdf2
        mov     r3, r7
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11]
        ldr     r0, [r10, #4]
        sub     r10, r10, #8
        bl      __extendsfdf2
        mov     r3, r7
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11, #4]
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        mov     r4, r0
        ldr     r0, [sp, #0x10]
        mov     r7, r1
        mov     r1, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r7
        bl      __subdf3
        mov     r4, r0
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        mov     r7, r1
        mov     r1, r6
        bl      __muldf3
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r6, r1
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        sub     r11, r11, #8
        cmn     r12, #1
        str     r0, [sp, #0x10]
        mov     r5, r1
        str     r4, [sp, #0x18]
        mov     r6, r7
        bne     LALF0
        mov     r2, r4
LALF1:
        cmp     r8, r11
        beq     LALF3
        mov     r12, #0xFF, 12
        orr     r4, r12, #3, 4
        mov     r1, r4
        mov     r3, r7
        mov     r0, #0
        bl      __subdf3
        sub     r3, r4, #1, 12
        mov     r2, #0
        bl      __muldf3
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
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LALF2:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LALF3:
        ldr     r2, [r9]
        str     r2, [r8]
        ldr     r9, [r9, #4]
        str     r9, [r8, #4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LALF4:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LALF5:
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
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   LALF__2il0floatpacket.1


        .data
        .align  4


LALF__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


