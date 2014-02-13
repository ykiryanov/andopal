        .text
        .align  4
        .globl  _ippsMulPerm_64f_I


_ippsMulPerm_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LBEW4
        cmp     r5, #0
        beq     LBEW4
        cmp     r4, #0
        ble     LBEW3
        ldr     r2, [r6]
        ldr     r3, [r6, #4]
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        bl      __muldf3
        tst     r4, #1
        str     r0, [r5]
        str     r1, [r5, #4]
        add     r3, r6, #8
        add     r11, r5, #8
        subne   r4, r4, #1
        bne     LBEW0
        ldr     r2, [r6, #8]
        ldr     r3, [r6, #0xC]
        ldr     r0, [r5, #8]
        ldr     r1, [r5, #0xC]
        bl      __muldf3
        str     r0, [r5, #8]
        str     r1, [r5, #0xC]
        sub     r4, r4, #2
        add     r3, r6, #0x10
        add     r11, r5, #0x10
LBEW0:
        mov     r0, r4, asr #1
        cmp     r0, #0
        ble     LBEW2
        sub     r1, r3, #0xC
        mov     r10, #0
        sub     r9, r11, #4
        str     r1, [sp, #8]
        str     r0, [sp]
        str     r3, [sp, #4]
LBEW1:
        ldr     r0, [r11, +r10, lsl #4]
        ldr     r2, [sp, #8]
        str     r0, [sp, #0xC]
        ldr     r0, [r9, #8]
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #4]
        ldr     r3, [sp, #0x10]
        ldr     r0, [r0, +r10, lsl #4]
        str     r0, [sp, #0x14]
        ldr     r0, [r2, #0x10]
        str     r0, [sp, #0x18]
        ldr     r7, [r2, #0x14]
        ldr     r6, [r2, #0x18]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        add     r2, r2, #0x10
        str     r2, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r4, [r9, #0xC]
        ldr     r5, [r9, #0x10]
        bl      __muldf3
        str     r0, [sp, #0x1C]
        mov     r8, r1
        mov     r2, r4
        mov     r3, r5
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x1C]
        mov     r3, r1
        mov     r1, r8
        bl      __subdf3
        str     r0, [sp, #0x1C]
        mov     r8, r1
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        str     r2, [r11, +r10, lsl #4]
        str     r0, [r9, #0xC]
        str     r8, [r9, #8]
        str     r1, [r9, #0x10]!
        ldr     r0, [sp]
        add     r10, r10, #1
        cmp     r10, r0
        blt     LBEW1
LBEW2:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBEW3:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBEW4:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


