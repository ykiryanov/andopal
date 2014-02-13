        .text
        .align  4
        .globl  _ippsSubCRev_64f


_ippsSubCRev_64f:
        stmdb   sp!, {r1, r4 - r11, lr}
        ldr     r11, [sp, #0x28]
        cmp     r0, #0
        mov     r5, r1
        mov     r4, r2
        mov     r6, r3
        beq     LAUT3
        cmp     r6, #0
        beq     LAUT3
        cmp     r11, #0
        ble     LAUT4
        cmp     r11, #6
        mov     r10, #0
        blt     LAUT1
        sub     r9, r11, #6
        sub     r8, r6, #4
        sub     r7, r0, #4
        str     r0, [sp]
LAUT0:
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        str     r0, [r8, #4]
        str     r1, [r8, #8]
        ldr     r2, [r7, #0xC]
        ldr     r3, [r7, #0x10]
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        str     r0, [r8, #0xC]
        str     r1, [r8, #0x10]
        ldr     r2, [r7, #0x14]
        ldr     r3, [r7, #0x18]
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        str     r0, [r8, #0x14]
        str     r1, [r8, #0x18]
        ldr     r2, [r7, #0x1C]
        ldr     r3, [r7, #0x20]
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        str     r0, [r8, #0x1C]
        str     r1, [r8, #0x20]
        ldr     r2, [r7, #0x24]
        ldr     r3, [r7, #0x28]!
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        add     r10, r10, #5
        str     r0, [r8, #0x24]
        str     r1, [r8, #0x28]!
        cmp     r10, r9
        ble     LAUT0
        ldr     r0, [sp]
LAUT1:
        mov     r12, r10, lsl #3
        sub     r12, r12, #4
        add     r6, r12, r6
        add     r7, r12, r0
LAUT2:
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]!
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        add     r10, r10, #1
        str     r0, [r6, #4]
        str     r1, [r6, #8]!
        cmp     r10, r11
        blt     LAUT2
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAUT3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LAUT4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


