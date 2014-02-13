        .text
        .align  4
        .globl  _ippsAddProduct_64f


_ippsAddProduct_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        cmp     r0, #0
        mov     r4, r3
        beq     LDBM3
        cmp     r1, #0
        beq     LDBM3
        cmp     r2, #0
        beq     LDBM3
        cmp     r4, #0
        ble     LDBM4
        cmp     r4, #5
        mov     r9, #0
        blt     LDBM1
        sub     r8, r4, #5
        sub     r7, r1, #4
        sub     r6, r0, #4
        sub     r5, r2, #4
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDBM0:
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]
        ldr     r10, [r5, #4]
        ldr     r11, [r5, #8]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r5, #4]
        str     r1, [r5, #8]
        ldr     r0, [r6, #0xC]
        ldr     r1, [r6, #0x10]
        ldr     r2, [r7, #0xC]
        ldr     r3, [r7, #0x10]
        ldr     r10, [r5, #0xC]
        ldr     r11, [r5, #0x10]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r5, #0xC]
        str     r1, [r5, #0x10]
        ldr     r0, [r6, #0x14]
        ldr     r1, [r6, #0x18]
        ldr     r2, [r7, #0x14]
        ldr     r3, [r7, #0x18]
        ldr     r10, [r5, #0x14]
        ldr     r11, [r5, #0x18]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r5, #0x14]
        str     r1, [r5, #0x18]
        ldr     r0, [r6, #0x1C]
        ldr     r1, [r6, #0x20]!
        ldr     r2, [r7, #0x1C]
        ldr     r3, [r7, #0x20]!
        ldr     r10, [r5, #0x1C]
        ldr     r11, [r5, #0x20]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        add     r9, r9, #4
        str     r0, [r5, #0x1C]
        str     r1, [r5, #0x20]!
        cmp     r9, r8
        ble     LDBM0
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDBM1:
        mov     r12, r9, lsl #3
        sub     r12, r12, #4
        add     r5, r12, r1
        add     r8, r12, r0
        add     r10, r12, r2
LDBM2:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]!
        ldr     r2, [r5, #4]
        ldr     r3, [r5, #8]!
        ldr     r6, [r10, #4]
        ldr     r7, [r10, #8]
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        add     r9, r9, #1
        str     r0, [r10, #4]
        str     r1, [r10, #8]!
        cmp     r9, r4
        blt     LDBM2
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDBM3:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDBM4:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


