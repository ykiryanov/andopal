        .text
        .align  4
        .globl  _ippsMulPerm_64f


_ippsMulPerm_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        mov     r4, r3
        beq     LBEX4
        cmp     r6, #0
        beq     LBEX4
        cmp     r5, #0
        beq     LBEX4
        cmp     r4, #0
        ble     LBEX3
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        ldr     r2, [r6]
        ldr     r3, [r6, #4]
        bl      __muldf3
        tst     r4, #1
        str     r0, [r5]
        str     r1, [r5, #4]
        add     r11, r7, #8
        add     r10, r6, #8
        add     r12, r5, #8
        subne   r4, r4, #1
        bne     LBEX0
        ldr     r0, [r7, #8]
        ldr     r1, [r7, #0xC]
        ldr     r2, [r6, #8]
        ldr     r3, [r6, #0xC]
        bl      __muldf3
        str     r0, [r5, #8]
        str     r1, [r5, #0xC]
        sub     r4, r4, #2
        add     r11, r7, #0x10
        add     r10, r6, #0x10
        add     r12, r5, #0x10
LBEX0:
        mov     r0, r4, asr #1
        cmp     r0, #0
        ble     LBEX2
        mov     r9, #0
        sub     r8, r10, #0xC
        sub     r7, r11, #4
        sub     r6, r12, #4
        str     r0, [sp]
        str     r12, [sp, #4]
LBEX1:
        ldr     r0, [r11, +r9, lsl #4]
        ldr     r1, [r7, #8]
        ldr     r2, [r10, +r9, lsl #4]
        ldr     r3, [r8, #0x10]
        bl      __muldf3
        ldr     r3, [r7, #0xC]
        ldr     r12, [r7, #0x10]
        ldr     r2, [r8, #0x14]
        mov     r4, r0
        mov     r0, r3
        ldr     r3, [r8, #0x18]
        mov     r5, r1
        mov     r1, r12
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [sp, #4]
        str     r0, [r2, +r9, lsl #4]
        str     r1, [r6, #8]
        ldr     r0, [r11, +r9, lsl #4]
        ldr     r1, [r7, #8]
        ldr     r2, [r8, #0x14]
        ldr     r3, [r8, #0x18]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r10, +r9, lsl #4]
        ldr     r0, [r7, #0xC]
        ldr     r1, [r7, #0x10]!
        ldr     r3, [r8, #0x10]!
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]!
        ldr     r0, [sp]
        add     r9, r9, #1
        cmp     r9, r0
        blt     LBEX1
LBEX2:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBEX3:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBEX4:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


