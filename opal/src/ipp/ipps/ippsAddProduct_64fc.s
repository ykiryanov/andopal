        .text
        .align  4
        .globl  _ippsAddProduct_64fc


_ippsAddProduct_64fc:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        mov     r4, r3
        beq     LDBL2
        cmp     r1, #0
        beq     LDBL2
        cmp     r2, #0
        beq     LDBL2
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r4, #0
        ble     LDBL1
        sub     r7, r1, #0xC
        sub     r6, r0, #4
        sub     r5, r2, #4
LDBL0:
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]
        ldr     r2, [r7, #0xC]
        ldr     r3, [r7, #0x10]
        ldr     r8, [r5, #4]
        ldr     r9, [r5, #8]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r10, [r6, #0xC]
        ldr     r11, [r6, #0x10]
        ldr     r2, [r7, #0x14]
        ldr     r3, [r7, #0x18]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        str     r0, [r5, #4]
        str     r1, [r5, #8]
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]
        ldr     r2, [r7, #0x14]
        ldr     r3, [r7, #0x18]
        ldr     r8, [r5, #0xC]
        ldr     r9, [r5, #0x10]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [r6, #0xC]
        ldr     r3, [r7, #0x10]
        ldr     r10, [r6, #0x10]!
        ldr     r11, [r7, #0xC]
        mov     r8, r0
        mov     r0, r2
        mov     r9, r1
        mov     r1, r10
        mov     r2, r11
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [r5, #0xC]
        str     r1, [r5, #0x10]!
        subs    r4, r4, #1
        add     r7, r7, #0x10
        bne     LDBL0
LDBL1:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDBL2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


