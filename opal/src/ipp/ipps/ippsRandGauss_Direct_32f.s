        .text
        .align  4
        .globl  _ippsRandGauss_Direct_32f


_ippsRandGauss_Direct_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r11, [sp, #0x64]
        cmp     r0, #0
        str     r0, [sp, #0x20]
        mov     r8, r1
        str     r2, [sp, #0x18]
        mov     r6, r3
        beq     LAZT5
        cmp     r11, #0
        beq     LAZT5
        cmp     r8, #0
        ble     LAZT6
        ldr     r7, [r11]
        ldr     r2, [pc, #0x424]
        ldr     r0, [pc, #0x424]
        ldr     r10, [pc, #0x424]
        mvn     r12, #0
        str     r12, [sp, #8]
        mul     r12, r7, r2
        str     r11, [sp, #0x10]
        str     r6, [sp, #0x14]
        add     r9, r12, r0
        mul     r2, r9, r2
        str     r8, [sp, #0x1C]
        mov     r8, r0
        add     r2, r2, r0
        str     r2, [sp, #0xC]
LAZT0:
        ldr     r0, [pc, #0x3EC]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #8]
        mul     r10, r10, r0
        sub     r1, r9, r1
        str     r7, [sp, #0xC]
        add     r1, r2, r1
        add     r10, r10, r8
        mul     r6, r10, r0
        mov     r4, r1, asr #31
        and     r2, r4, #0x12
        sub     r11, r1, r2
        add     r0, r10, r11
        sub     r7, r7, r9
        mvn     r5, #0xF6
        bl      __floatsidf
        add     r4, r7, r4
        bic     r5, r5, #2, 24
        add     r10, r6, r8
        mov     r2, r5
        mvn     r3, #0xC2, 8
        mov     r12, r4, asr #31
        str     r12, [sp, #8]
        and     r7, r12, #0x12
        bl      __muldf3
        sub     r7, r4, r7
        mov     r4, r1
        add     r2, r10, r7
        str     r4, [sp, #4]
        mov     r6, r0
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r5
        mvn     r3, #0xC2, 8
        bl      __muldf3
        mov     r9, r1
        mov     r5, r0
        str     r5, [sp, #0x3C]
        str     r9, [sp]
        mov     r1, r4
        mov     r3, r4
        mov     r0, r6
        mov     r2, r6
        bl      __muldf3
        str     r0, [sp, #0x38]
        mov     r4, r1
        mov     r0, r5
        mov     r2, r5
        mov     r1, r9
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        mov     r3, r4
        bl      __adddf3
        mov     r12, #0xFF, 12
        orr     r3, r12, #3, 4
        mov     r5, r0
        mov     r4, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        mov     r9, r11
        bge     LAZT0
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LAZT0
        str     r6, [sp, #0x24]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        mov     r1, r4
        mov     r0, r5
        bl      log
        mov     r2, #0
        mov     r3, #3, 2
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
        bl      sqrt
        cmp     r8, #1
        mov     r5, r0
        mov     r4, r1
        ble     LAZT3
        mov     r0, r6
        bl      __extendsfdf2
        str     r10, [sp, #0x28]
        str     r7, [sp, #0x30]
        str     r11, [sp, #0x10]
        str     r6, [sp, #0x14]
        ldr     r6, [sp]
        ldr     r7, [sp, #4]
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x20]
        str     r9, [sp, #0x2C]
        str     r1, [sp, #0x38]
        mov     r9, r0
LAZT1:
        mov     r0, r9
        ldr     r1, [sp, #0x38]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        mov     r4, r0
        mov     r5, r1
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        mov     r1, r10
        bl      __addsf3
        str     r0, [r11]
        ldr     r2, [sp, #0x24]
        mov     r0, r4
        mov     r1, r5
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        mov     r1, r10
        bl      __addsf3
        str     r0, [r11, #4]
        str     r9, [sp, #0x34]
        str     r8, [sp, #0x1C]
        str     r11, [sp, #0x20]
        ldr     r9, [sp, #0x28]
        ldr     r11, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
LAZT2:
        ldr     r0, [pc, #0x1E4]
        ldr     r1, [sp, #0xC]
        ldr     r5, [pc, #0x1E0]
        mul     r9, r9, r0
        ldr     r2, [sp, #8]
        sub     r1, r11, r1
        str     r8, [sp, #0xC]
        add     r1, r2, r1
        add     r9, r9, r5
        mul     r7, r9, r0
        mov     r6, r1, asr #31
        and     r2, r6, #0x12
        sub     r10, r1, r2
        add     r0, r9, r10
        sub     r8, r8, r11
        mvn     r4, #0xF6
        bl      __floatsidf
        add     r9, r7, r5
        bic     r4, r4, #2, 24
        mov     r2, r4
        mvn     r3, #0xC2, 8
        add     r6, r8, r6
        mov     r12, r6, asr #31
        str     r12, [sp, #8]
        and     r8, r12, #0x12
        sub     r8, r6, r8
        bl      __muldf3
        add     r2, r9, r8
        mov     r5, r0
        str     r5, [sp, #0x24]
        mov     r7, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mvn     r3, #0xC2, 8
        bl      __muldf3
        mov     r4, r0
        str     r4, [sp, #0x3C]
        mov     r6, r1
        mov     r0, r5
        mov     r2, r5
        mov     r1, r7
        mov     r3, r7
        bl      __muldf3
        mov     r5, r0
        mov     r11, r1
        mov     r0, r4
        mov     r2, r4
        mov     r1, r6
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r11
        bl      __adddf3
        mov     r12, #0xFF, 12
        orr     r3, r12, #3, 4
        mov     r5, r0
        mov     r4, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        mov     r11, r10
        bge     LAZT2
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LAZT2
        str     r8, [sp, #0x30]
        str     r11, [sp, #0x2C]
        str     r9, [sp, #0x28]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
        ldr     r9, [sp, #0x34]
        ldr     r10, [sp, #0x18]
        mov     r1, r4
        mov     r0, r5
        bl      log
        mov     r2, #0
        mov     r3, #3, 2
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
        bl      sqrt
        sub     r8, r8, #2
        cmp     r8, #1
        mov     r5, r0
        mov     r4, r1
        add     r11, r11, #8
        bgt     LAZT1
        str     r6, [sp]
        str     r11, [sp, #0x20]
        ldr     r7, [sp, #0x30]
        ldr     r11, [sp, #0x10]
        ldr     r6, [sp, #0x14]
LAZT3:
        cmp     r8, #0
        beq     LAZT4
        mov     r0, r6
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp]
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x18]
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        str     r0, [r1]
LAZT4:
        mov     r0, #0
        str     r7, [r11]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAZT5:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAZT6:
        mvn     r0, #5
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9


