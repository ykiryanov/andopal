        .text
        .align  4
        .globl  _ippiDeinterlaceFilterTriangle_8u_C1R


_ippiDeinterlaceFilterTriangle_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r7, [sp, #0x50]
        ldr     lr, [sp, #0x54]
        mov     r9, r0
        cmp     r9, #0
        mov     r5, r1
        mov     r8, r2
        mov     r4, r3
        beq     LLLF19
        cmp     r8, #0
        beq     LLLF19
        ldr     r10, [sp, #0x4C]
        cmp     r10, #3
        blt     LLLF18
        ldr     r12, [sp, #0x48]
        cmp     r12, #1
        blt     LLLF18
        cmp     r7, #1, 24
        mov     r6, #1, 24
        movhi   r7, r6
        rsb     r6, r7, #1, 24
        subs    lr, lr, #0x10
        mov     r6, r6, lsr #1
        beq     LLLF12
        adds    lr, lr, #0xC
        beq     LLLF8
        adds    r10, lr, #3
        mov     lr, #1
        beq     LLLF4
        add     r1, sp, #0x1C
        mov     r0, sp
        str     r12, [sp, #0x1C]
        str     lr, [sp, #0x20]
        mov     r2, #8
        bl      __intel_memcpy
        mov     r2, r8
        mov     r0, r9
        mov     r3, r4
        mov     r1, r5
        bl      _ippiCopy_8u_C1R
        ldr     r12, [sp, #0x4C]
        add     r9, r5, r9
        add     r8, r4, r8
        sub     lr, r12, #1
        cmp     lr, #1
        ldrle   r12, [sp, #0x48]
        ble     LLLF3
        ldr     r12, [sp, #0x48]
        sub     lr, lr, #1
LLLF0:
        cmp     r12, #0
        addle   r10, r5, r9
        ble     LLLF2
        add     r10, r5, r9
        mov     r1, #0
        sub     r0, r9, r5
        mov     r11, r10
        str     r5, [sp, #8]
LLLF1:
        ldrb    r5, [r1, +r9]
        ldrb    r3, [r11], #1
        ldrb    r2, [r0], #1
        mul     r5, r7, r5
        add     r3, r2, r3
        mla     r5, r6, r3, r5
        mov     r5, r5, lsr #8
        strb    r5, [r1, +r8]
        add     r1, r1, #1
        cmp     r1, r12
        blt     LLLF1
        ldr     r5, [sp, #8]
LLLF2:
        subs    lr, lr, #1
        mov     r9, r10
        add     r8, r4, r8
        bne     LLLF0
LLLF3:
        str     r12, [sp, #0x1C]
        add     r1, sp, #0x1C
        mov     r0, sp
        mov     r12, #1
        str     r12, [sp, #0x20]
        mov     r2, #8
        bl      __intel_memcpy
        mov     r3, r4
        mov     r2, r8
        mov     r1, r5
        mov     r0, r9
        bl      _ippiCopy_8u_C1R
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LLLF4:
        add     r1, sp, #0xC
        mov     r0, sp
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x10]
        mov     r2, #8
        bl      __intel_memcpy
        mov     r2, r8
        mov     r3, r4
        mov     r1, r5
        mov     r0, r9
        bl      _ippiCopy_8u_C1R
        ldr     r12, [sp, #0x4C]
        add     r0, r5, r9
        add     r8, r4, r8
        sub     r2, r12, #1
        cmp     r2, #1
        ble     LLLF17
        ldr     r12, [sp, #0x48]
        sub     r2, r2, #1
LLLF5:
        cmp     r12, #0
        addle   lr, r5, r0
        ble     LLLF7
        add     lr, r5, r0
        mov     r11, #0
        sub     r10, r0, r5
        mov     r9, lr
        str     r5, [sp, #8]
LLLF6:
        ldrb    r1, [r11, +r0]
        ldrb    r3, [r9], #1
        ldrb    r5, [r10], #1
        mul     r1, r7, r1
        add     r3, r5, r3
        mla     r1, r6, r3, r1
        mov     r1, r1, lsr #8
        strb    r1, [r11, +r8]
        add     r11, r11, #1
        cmp     r11, r12
        blt     LLLF6
        ldr     r5, [sp, #8]
LLLF7:
        subs    r2, r2, #1
        mov     r0, lr
        add     r8, r4, r8
        bne     LLLF5
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LLLF8:
        sub     r10, r10, #1
        cmn     r10, #1
        sub     r0, r9, r5
        sub     r8, r8, r4
        ble     LLLF17
        add     r2, r10, #1
LLLF9:
        cmp     r12, #0
        addle   lr, r5, r0
        ble     LLLF11
        add     lr, r5, r0
        mov     r11, #0
        sub     r10, r0, r5
        mov     r9, lr
        str     r5, [sp, #8]
LLLF10:
        ldrb    r1, [r11, +r0]
        ldrb    r3, [r9], #1
        ldrb    r5, [r10], #1
        mul     r1, r7, r1
        add     r3, r5, r3
        mla     r1, r6, r3, r1
        mov     r1, r1, lsr #8
        strb    r1, [r11, +r8]
        add     r11, r11, #1
        cmp     r11, r12
        blt     LLLF10
        ldr     r5, [sp, #8]
LLLF11:
        subs    r2, r2, #1
        mov     r0, lr
        add     r8, r4, r8
        bne     LLLF9
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LLLF12:
        sub     r10, r10, #1
        cmn     r10, #1
        sub     r9, r9, r5
        sub     r8, r8, r4
        ble     LLLF16
        add     lr, r10, #1
LLLF13:
        cmp     r12, #0
        addle   r10, r5, r9
        ble     LLLF15
        add     r10, r5, r9
        mov     r1, #0
        sub     r0, r9, r5
        mov     r11, r10
        str     r5, [sp, #8]
LLLF14:
        ldrb    r5, [r1, +r9]
        ldrb    r3, [r11], #1
        ldrb    r2, [r0], #1
        mul     r5, r7, r5
        add     r3, r2, r3
        mla     r5, r6, r3, r5
        mov     r5, r5, lsr #8
        strb    r5, [r1, +r8]
        add     r1, r1, #1
        cmp     r1, r12
        blt     LLLF14
        ldr     r5, [sp, #8]
LLLF15:
        subs    lr, lr, #1
        mov     r9, r10
        add     r8, r4, r8
        bne     LLLF13
LLLF16:
        str     r12, [sp, #0x14]
        add     r1, sp, #0x14
        mov     r0, sp
        mov     r12, #1
        str     r12, [sp, #0x18]
        mov     r2, #8
        bl      __intel_memcpy
        mov     r3, r4
        mov     r2, r8
        mov     r1, r5
        mov     r0, r9
        bl      _ippiCopy_8u_C1R
LLLF17:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LLLF18:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LLLF19:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


