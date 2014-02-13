        .text
        .align  4
        .globl  _ippsRandUniform_8u


_ippsRandUniform_8u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        cmp     r0, #0
        beq     LAYW6
        cmp     r2, #0
        beq     LAYW6
        cmp     r1, #0
        ble     LAYW5
        ldr     r3, [r2]
        cmp     r3, #0x23
        beq     LAYW0
        mvn     r0, #0x10
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAYW0:
        ldr     r5, [r2, #0x10]
        ldr     r4, [r2, #0x14]
        ldr     r9, [r2, #0x18]
        ldr     r10, [r2, #0x1C]
        ldr     r7, [r2, #0x20]
        ldr     lr, [r2, #0x24]
        ldr     r6, [r2, #0x28]
        ldr     r12, [r2, #0x2C]
        ldr     r8, [r2, #0x30]
        cmp     r1, #0
        ble     LAYW4
        str     r12, [sp, #0x10]
        str     lr, [sp, #0x14]
        str     r10, [sp, #8]
        str     r9, [sp, #4]
        str     r2, [sp]
        str     r1, [sp, #0x18]
        str     r0, [sp, #0xC]
LAYW1:
        ldr     lr, [sp, #0x10]
        ldr     r9, [pc, #0x114]
        ldr     r12, [pc, #0x114]
        sub     lr, r6, lr
        add     lr, lr, r8
        mul     r7, r7, r9
        str     r6, [sp, #0x10]
        mov     r8, lr, asr #31
        and     r6, r8, #0x12
        sub     r11, lr, r6
        add     r7, r7, r12
        add     r0, r7, r11
        bl      __floatsidf
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        ldr     r6, [sp, #0x14]
        cmp     r0, #0
        str     r11, [sp, #0x14]
        ble     LAYW2
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        b       LAYW3
LAYW2:
        mov     r0, r5
        mov     r1, r4
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
LAYW3:
        bl      __fixunsdfsi
        ldr     r12, [sp, #0xC]
        strb    r0, [r12], #1
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x18]
        subs    r12, r12, #1
        str     r12, [sp, #0x18]
        bne     LAYW1
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0x14]
        ldr     r2, [sp]
LAYW4:
        mov     r0, #0
        str     r7, [r2, #0x20]
        str     lr, [r2, #0x24]
        str     r6, [r2, #0x28]
        str     r12, [r2, #0x2C]
        str     r8, [r2, #0x30]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAYW5:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAYW6:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00010dcd
        .long   0x3c6ef373


