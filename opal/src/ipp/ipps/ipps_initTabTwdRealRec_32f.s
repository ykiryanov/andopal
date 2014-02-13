        .text
        .align  4
        .globl  _ipps_initTabTwdRealRec_32f


_ipps_initTabTwdRealRec_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r12, #1
        mov     lr, r12, lsl r0
        sub     r0, r2, r0
        mov     r2, lr, asr #1
        cmp     lr, #4
        add     lr, lr, r2, lsr #30
        mov     r4, r1
        mov     r6, r12, lsl r0
        mov     r5, lr, asr #2
        movgt   r12, r5
        add     r12, r3, r12, lsl #3
        and     r0, r12, #0x1F
        rsb     r0, r0, #0
        and     r0, r0, #0x1F
        add     r0, r12, r0
        cmp     r5, #0
        str     r0, [sp, #8]
        ble     LBYM3
        cmp     r5, #4
        mov     r1, #0
        mullt   r7, r6, r5
        movlt   r11, r1
        blt     LBYM1
        mul     r7, r6, r5
        sub     r2, r5, #4
        mov     r0, r6, lsl #1
        add     r9, r6, r6, lsl #1
        rsb     r12, r6, r7
        sub     lr, r7, r6, lsl #1
        mov     r8, r6
        str     r7, [sp, #0x18]
        str     r6, [sp, #0x1C]
        mov     r11, r1
        sub     r10, r3, #4
        str     lr, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r2, [sp, #0x14]
        str     r5, [sp, #4]
        str     r3, [sp]
        mov     r6, r0
        mov     r7, r1
LBYM0:
        ldr     r2, [sp, #0x1C]
        ldr     r12, [sp, #0x18]
        rsb     r3, r11, #0
        mul     r2, r2, r3
        mov     r3, #0xFE, 12
        orr     r5, r3, #3, 4
        add     r11, r11, #3
        add     r12, r12, r2
        ldr     r0, [r4, +r12, lsl #2]
        ldr     r12, [sp, #0xC]
        add     r12, r2, r12
        str     r12, [sp, #0x20]
        ldr     r12, [sp, #0x10]
        add     r12, r2, r12
        str     r12, [sp, #0x24]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r10, #4]
        ldr     r0, [r4, +r7, lsl #2]
        add     r7, r7, r9
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r5
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r10, #8]
        ldr     r2, [sp, #0x20]
        ldr     r0, [r4, +r2, lsl #2]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r10, #0xC]
        ldr     r0, [r4, +r8, lsl #2]
        add     r8, r8, r9
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r5
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r10, #0x10]
        ldr     r2, [sp, #0x24]
        ldr     r0, [r4, +r2, lsl #2]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r10, #0x14]
        ldr     r0, [r4, +r6, lsl #2]
        add     r6, r6, r9
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r5
        mov     r0, #0
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r2, [sp, #0x14]
        str     r0, [r10, #0x18]!
        cmp     r11, r2
        ble     LBYM0
        ldr     r7, [sp, #0x18]
        ldr     r5, [sp, #4]
        ldr     r6, [sp, #0x1C]
        ldr     r3, [sp]
LBYM1:
        mul     r8, r11, r6
        mov     r0, r11, lsl #3
        sub     r2, r0, #4
        mov     r0, #0xFE, 12
        add     r10, r2, r3
        orr     r9, r0, #3, 4
LBYM2:
        rsb     r0, r11, #0
        mla     r0, r6, r0, r7
        add     r11, r11, #1
        ldr     r0, [r4, +r0, lsl #2]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r9
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r10, #4]
        ldr     r0, [r4, +r8, lsl #2]
        add     r8, r8, r6
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r9
        mov     r0, #0
        bl      __subdf3
        bl      __truncdfsf2
        str     r0, [r10, #8]!
        cmp     r11, r5
        blt     LBYM2
LBYM3:
        ldr     r0, [sp, #8]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


