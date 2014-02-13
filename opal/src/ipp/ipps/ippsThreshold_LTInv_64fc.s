        .text
        .align  4
        .globl  _ippsThreshold_LTInv_64fc


_ippsThreshold_LTInv_64fc:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x24
        ldr     r8, [r11, #4]
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        mov     r7, r2
        mov     r6, r3
        beq     LBMI11
        cmp     r5, #0
        beq     LBMI11
        cmp     r7, #0
        ble     LBMI12
        mov     r0, r6
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBMI3
        mov     r0, r6
        mov     r1, r8
        mov     r2, r6
        mov     r3, r8
        bl      __muldf3
        mov     r10, r0
        mov     r9, r1
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMI6
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r6
        mov     r3, r8
        bl      __divdf3
        cmp     r7, #0
        ble     LBMI5
        mov     r2, #0
        str     r8, [r11, #-0x40]
        str     r7, [r11, #-0x38]
        str     r1, [r11, #-0x4C]
        str     r0, [r11, #-0x48]
        str     r9, [r11, #-0x3C]
        str     r10, [r11, #-0x34]
        str     r6, [r11, #-0x44]
        mov     r8, r2
        mov     r7, r5
LBMI0:
        ldr     r2, [r4]
        str     r2, [r11, #-0x30]
        ldr     r3, [r4, #4]
        mov     r0, r2
        str     r3, [r11, #-0x2C]
        ldr     r5, [r4, #8]
        ldr     r6, [r4, #0xC]
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r5
        mov     r1, r6
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x3C]
        mov     r10, r0
        mov     r9, r1
        bl      __ltdf2
        cmp     r0, #0
        bge     LBMI1
        mov     r0, r10
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMI4
        mov     r0, r10
        mov     r1, r9
        bl      sqrt
        ldr     r2, [r11, #-0x44]
        ldr     r3, [r11, #-0x40]
        bl      __muldf3
        mov     r10, r0
        mov     r9, r1
LBMI1:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r2, r10
        mov     r3, r9
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r10, r0
        mov     r9, r1
        bl      __muldf3
        mov     r2, r1
        eor     r1, r6, #2, 2
        str     r0, [r7]
        str     r2, [r7, #4]
        mov     r0, r5
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
LBMI2:
        ldr     r3, [r11, #-0x38]
        add     r8, r8, #1
        add     r7, r7, #0x10
        cmp     r8, r3
        add     r4, r4, #0x10
        blt     LBMI0
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LBMI3:
        mvn     r0, #0x12
        ldmdb   r11, {r4 - r11, sp, pc}
LBMI4:
        ldr     r3, [r11, #-0x48]
        str     r3, [r7]
        ldr     r3, [r11, #-0x4C]
        str     r3, [r7, #4]
        mov     r3, #0
        str     r3, [r7, #8]
        str     r3, [r7, #0xC]
        b       LBMI2
LBMI5:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LBMI6:
        cmp     r7, #0
        ble     LBMI10
        ldr     r3, [pc, #0x12C]
        mov     r0, #0
        mov     r6, r0
        str     r0, [r11, #-0x2C]
        str     r7, [r11, #-0x38]
LBMI7:
        ldr     r2, [r4]
        str     r2, [r11, #-0x30]
        ldr     r3, [r4, #4]
        mov     r0, r2
        str     r3, [r11, #-0x34]
        ldr     r7, [r4, #8]
        ldr     r8, [r4, #0xC]
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r7
        mov     r1, r8
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        mov     r10, r0
        mov     r9, r1
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMI9
        mov     r2, r10
        mov     r3, r9
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x34]
        eor     r10, r8, #2, 2
        mov     r8, r0
        mov     r9, r1
        bl      __muldf3
        str     r0, [r5]
        str     r1, [r5, #4]
        mov     r0, r7
        mov     r1, r10
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        str     r0, [r5, #8]
        str     r1, [r5, #0xC]
LBMI8:
        ldr     r2, [r11, #-0x38]
        add     r6, r6, #1
        add     r5, r5, #0x10
        cmp     r6, r2
        add     r4, r4, #0x10
        blt     LBMI7
        ldr     r0, [r11, #-0x2C]
        ldmdb   r11, {r4 - r11, sp, pc}
LBMI9:
        ldr     r3, [pc, #0x3C]
        mov     r12, #0
        str     r12, [r5, #8]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        str     r12, [r5, #0xC]
        str     r2, [r5]
        mov     r2, #4
        str     r3, [r5, #4]
        str     r2, [r11, #-0x2C]
        b       LBMI8
LBMI10:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LBMI11:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}
LBMI12:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
        .long   ippConstantOfINF_64f


