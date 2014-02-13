        .text
        .align  4
        .globl  _ippsSubC_64f


_ippsSubC_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #4
        ldr     r8, [sp, #0x28]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        mov     r7, r3
        beq     LAUL4
        cmp     r7, #0
        beq     LAUL4
        cmp     r8, #0
        ble     LAUL5
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LAUL3
        cmp     r8, #6
        mov     r9, #0
        blt     LAUL1
        sub     r0, r8, #6
        sub     r10, r6, #4
        str     r6, [sp]
        sub     r11, r7, #4
        mov     r6, r0
LAUL0:
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        str     r0, [r11, #4]
        str     r1, [r11, #8]
        ldr     r0, [r10, #0xC]
        ldr     r1, [r10, #0x10]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        str     r0, [r11, #0xC]
        str     r1, [r11, #0x10]
        ldr     r0, [r10, #0x14]
        ldr     r1, [r10, #0x18]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        str     r0, [r11, #0x14]
        str     r1, [r11, #0x18]
        ldr     r0, [r10, #0x1C]
        ldr     r1, [r10, #0x20]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        str     r0, [r11, #0x1C]
        str     r1, [r11, #0x20]
        ldr     r0, [r10, #0x24]
        ldr     r1, [r10, #0x28]!
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        add     r9, r9, #5
        str     r0, [r11, #0x24]
        str     r1, [r11, #0x28]!
        cmp     r9, r6
        ble     LAUL0
        ldr     r6, [sp]
LAUL1:
        mov     r12, r9, lsl #3
        sub     r12, r12, #4
        add     r7, r12, r7
        add     r6, r12, r6
LAUL2:
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]!
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        add     r9, r9, #1
        str     r0, [r7, #4]
        str     r1, [r7, #8]!
        cmp     r9, r8
        blt     LAUL2
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LAUL3:
        mov     r0, r6
        mov     r2, r8
        mov     r1, r7
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsCopy_64f
LAUL4:
        mvn     r0, #7
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LAUL5:
        mvn     r0, #5
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}


