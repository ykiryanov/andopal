        .text
        .align  4
        .globl  _ippsDiv_64fc


_ippsDiv_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r11, r2
        beq     LCHE3
        cmp     r9, #0
        beq     LCHE3
        cmp     r11, #0
        beq     LCHE3
        cmp     r3, #0
        ble     LCHE4
        cmp     r3, #0
        mov     r0, #0
        addle   sp, sp, #0x24
        ldmleia sp!, {r4 - r11, pc}
        ldr     r12, [pc, #0x1D0]
        str     r0, [sp]
        str     r3, [sp, #4]
LCHE0:
        ldr     r5, [r10]
        ldr     r4, [r10, #4]
        ldr     r7, [r10, #8]
        ldr     r6, [r10, #0xC]
        mov     r0, r5
        mov     r1, r4
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #8]
        mov     r8, r1
        mov     r0, r7
        mov     r1, r6
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #8]
        mov     r3, r8
        bl      __adddf3
        str     r1, [sp, #8]
        mov     r8, r0
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LCHE2
        mov     r2, r8
        ldr     r3, [sp, #8]
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r1, [sp, #8]
        ldr     r2, [r9]
        mov     r8, r0
        mov     r0, r5
        str     r2, [sp, #0xC]
        ldr     r12, [r9, #4]
        mov     r1, r4
        str     r12, [sp, #0x10]
        ldr     r12, [r9, #8]
        ldr     r3, [sp, #0x10]
        str     r12, [sp, #0x14]
        ldr     r12, [r9, #0xC]
        str     r12, [sp, #0x18]
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x20]
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        bl      __adddf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        ldr     r3, [sp, #8]
        mov     r2, r8
        bl      __muldf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r3, [sp, #8]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r8
        bl      __muldf3
LCHE1:
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r3, [sp, #4]
        add     r9, r9, #0x10
        add     r11, r11, #0x10
        subs    r3, r3, #1
        str     r3, [sp, #4]
        add     r10, r10, #0x10
        bne     LCHE0
        ldr     r0, [sp]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LCHE2:
        ldr     r3, [pc, #0x30]
        ldr     r0, [r3]
        ldr     r1, [r3, #4]
        mov     r3, #6
        str     r3, [sp]
        str     r0, [r11]
        str     r1, [r11, #4]
        b       LCHE1
LCHE3:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LCHE4:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   ippConstantOfNAN_64f


