        .text
        .align  4
        .globl  _ippsMulPack_64f


_ippsMulPack_64f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r4, r2
        mov     r7, r3
        beq     LBFD3
        cmp     r6, #0
        beq     LBFD3
        cmp     r4, #0
        beq     LBFD3
        cmp     r7, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        ldr     r2, [r6]
        ldr     r3, [r6, #4]
        bl      __muldf3
        tst     r7, #1
        str     r0, [r4]
        str     r1, [r4, #4]
        subne   r7, r7, #1
        bne     LBFD0
        sub     lr, r5, #8
        ldr     r0, [lr, +r7, lsl #3]
        add     lr, lr, r7, lsl #3
        ldr     r1, [lr, #4]
        sub     r12, r6, #8
        add     lr, r12, r7, lsl #3
        ldr     r2, [r12, +r7, lsl #3]
        ldr     r3, [lr, #4]
        bl      __muldf3
        sub     r12, r4, #8
        str     r0, [r12, +r7, lsl #3]
        add     r12, r12, r7, lsl #3
        str     r1, [r12, #4]
        sub     r7, r7, #2
LBFD0:
        mov     r7, r7, asr #1
        cmp     r7, #0
        ble     LBFD2
        sub     r6, r6, #4
        add     r5, r5, #4
        add     r4, r4, #4
        mov     r8, #0
LBFD1:
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #8]
        ldr     r2, [r6, #0xC]
        ldr     r3, [r6, #0x10]
        bl      __muldf3
        ldr     r2, [r5, #0xC]
        ldr     r11, [r5, #0x10]
        ldr     r12, [r6, #0x14]
        ldr     r3, [r6, #0x18]
        mov     r9, r0
        mov     r0, r2
        mov     r10, r1
        mov     r2, r12
        mov     r1, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r10
        bl      __subdf3
        str     r0, [r4, #4]
        str     r1, [r4, #8]
        ldr     r0, [r5, #4]
        ldr     r1, [r5, #8]
        ldr     r2, [r6, #0x14]
        ldr     r3, [r6, #0x18]
        bl      __muldf3
        ldr     r2, [r5, #0xC]
        ldr     r3, [r6, #0x10]
        ldr     r12, [r6, #0xC]
        ldr     r11, [r5, #0x10]!
        mov     r9, r0
        mov     r0, r2
        mov     r10, r1
        mov     r2, r12
        mov     r1, r11
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        add     r8, r8, #1
        str     r0, [r4, #0xC]
        str     r1, [r4, #0x10]!
        cmp     r8, r7
        add     r6, r6, #0x10
        blt     LBFD1
LBFD2:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBFD3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


