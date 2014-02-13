        .text
        .align  4
        .globl  _ippsNormDiff_Inf_32fc32f


_ippsNormDiff_Inf_32fc32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        cmp     r0, #0
        mov     r11, r3
        beq     LBBP3
        cmp     r1, #0
        beq     LBBP3
        cmp     r11, #0
        beq     LBBP3
        cmp     r2, #0
        ble     LBBP4
        ldr     lr, [pc, #0x290]
        bic     r12, r2, #1
        cmp     r12, #0
        ldr     r10, [lr]
        mov     r4, r10
        ble     LBBP1
        mov     r9, #0
        sub     r8, r1, #4
        sub     r7, r0, #4
        sub     r6, r1, #0xC
        sub     r5, r0, #0xC
        str     r12, [sp, #0x10]
        str     r10, [sp, #0x14]
        str     r11, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LBBP0:
        ldr     r1, [r6, #0xC]
        ldr     r0, [r5, #0xC]
        add     r9, r9, #2
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [r5, #0x10]!
        ldr     r1, [r6, #0x10]!
        bl      __subsf3
        ldr     r1, [r8, #0xC]
        str     r0, [sp, #0x18]
        ldr     r0, [r7, #0xC]
        bl      __subsf3
        str     r0, [sp, #0x1C]
        ldr     r1, [r8, #0x10]!
        ldr     r0, [r7, #0x10]!
        bl      __subsf3
        str     r0, [sp, #0x20]
        mov     r0, r10
        bl      __extendsfdf2
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x18]
        mov     r11, r1
        bl      __extendsfdf2
        ldr     r2, [sp, #0x24]
        str     r0, [sp, #0x18]
        mov     r10, r1
        mov     r0, r2
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        str     r0, [sp, #0x24]
        mov     r11, r1
        mov     r0, r2
        mov     r1, r10
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        mov     r10, r0
        ldr     r0, [sp, #0x1C]
        bl      __extendsfdf2
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x20]
        mov     r11, r1
        bl      __extendsfdf2
        ldr     r2, [sp, #0x24]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r0, r2
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0x24]
        mov     r11, r1
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        mov     r11, r0
        mov     r1, r4
        mov     r0, r10
        bl      __gtsf2
        ldr     r1, [sp, #0x14]
        cmp     r0, #0
        mov     r0, r11
        movgt   r4, r10
        bl      __gtsf2
        ldr     r2, [sp, #0x14]
        cmp     r0, #0
        movgt   r2, r11
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        cmp     r9, r2
        blt     LBBP0
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBBP1:
        tst     r2, #1
        beq     LBBP2
        sub     r12, r1, #8
        ldr     r1, [r12, +r2, lsl #3]
        sub     lr, r0, #8
        ldr     r0, [lr, +r2, lsl #3]
        add     r5, lr, r2, lsl #3
        add     r6, r12, r2, lsl #3
        bl      __subsf3
        ldr     r2, [r5, #4]
        ldr     r1, [r6, #4]
        mov     r5, r0
        mov     r0, r2
        bl      __subsf3
        mov     r6, r0
        mov     r0, r5
        bl      __extendsfdf2
        mov     r7, r0
        mov     r8, r1
        mov     r0, r6
        bl      __extendsfdf2
        mov     r5, r0
        mov     r6, r1
        mov     r0, r7
        mov     r2, r7
        mov     r1, r8
        mov     r3, r8
        bl      __muldf3
        mov     r7, r0
        mov     r8, r1
        mov     r2, r5
        mov     r0, r5
        mov     r3, r6
        mov     r1, r6
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        mov     r5, r0
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r5
LBBP2:
        mov     r0, r4
        mov     r1, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r10, r4
        mov     r0, #0
        str     r10, [r11]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBBP3:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBBP4:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
        .long   LBBP__2il0floatpacket.1


        .data
        .align  4


LBBP__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


