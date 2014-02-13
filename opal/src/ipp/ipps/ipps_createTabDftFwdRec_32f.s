        .text
        .align  4
        .globl  _ipps_createTabDftFwdRec_32f


_ipps_createTabDftFwdRec_32f:
        stmdb   sp!, {r4 - r11, lr}
        add     r2, r0, #3
        mov     r8, r1
        mov     r2, r2, asr #1
        add     r2, r0, r2, lsr #30
        add     r0, r2, #3
        mov     r6, r0, asr #2
        mov     r0, r6, lsl #3
        bl      _ippsMalloc_8u
        mov     r5, r0
        cmp     r5, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r11, pc}
        cmp     r6, #0
        ble     LCIY3
        mov     r2, #0xFE, 12
        cmp     r6, #5
        orr     r4, r2, #3, 4
        mov     r7, #0
        blt     LCIY1
        sub     r11, r6, #5
        sub     r10, r8, #4
        sub     r9, r5, #4
LCIY0:
        ldr     r0, [r10, #4]
        add     r7, r7, #4
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #4]
        ldr     r0, [r10, #8]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r9, #8]
        ldr     r0, [r10, #0xC]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #0xC]
        ldr     r0, [r10, #0x10]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r9, #0x10]
        ldr     r0, [r10, #0x14]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #0x14]
        ldr     r0, [r10, #0x18]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r9, #0x18]
        ldr     r0, [r10, #0x1C]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #0x1C]
        ldr     r0, [r10, #0x20]!
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r9, #0x20]!
        cmp     r7, r11
        ble     LCIY0
LCIY1:
        mov     r2, r7, lsl #3
        sub     r2, r2, #4
        add     r9, r2, r8
        add     r8, r2, r5
LCIY2:
        ldr     r0, [r9, #4]
        add     r7, r7, #1
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        ldr     r0, [r9, #8]!
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r8, #8]!
        cmp     r7, r6
        blt     LCIY2
LCIY3:
        mov     r0, r5
        ldmia   sp!, {r4 - r11, pc}


