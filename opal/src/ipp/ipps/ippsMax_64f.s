        .text
        .align  4
        .globl  _ippsMax_64f


_ippsMax_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r10, r1
        mov     r6, r2
        beq     LBIG3
        cmp     r6, #0
        beq     LBIG3
        cmp     r10, #0
        ble     LBIG4
        ldr     r5, [r0]
        ldr     r4, [r0, #4]
        cmp     r10, #6
        mov     r9, #0
        blt     LBIG1
        sub     r8, r10, #6
        sub     r7, r0, #4
        str     r10, [sp, #4]
        str     r0, [sp]
LBIG0:
        ldr     r10, [r7, #8]
        ldr     r11, [r7, #4]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        bl      __gtdf2
        cmp     r0, #0
        movgt   r4, r10
        movgt   r5, r11
        ldr     r10, [r7, #0x10]
        ldr     r11, [r7, #0xC]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        bl      __gtdf2
        cmp     r0, #0
        movgt   r4, r10
        movgt   r5, r11
        ldr     r11, [r7, #0x18]
        ldr     r10, [r7, #0x14]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r11
        mov     r0, r10
        bl      __gtdf2
        cmp     r0, #0
        movgt   r4, r11
        movgt   r5, r10
        ldr     r11, [r7, #0x20]
        ldr     r10, [r7, #0x1C]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r11
        mov     r0, r10
        bl      __gtdf2
        cmp     r0, #0
        movgt   r4, r11
        movgt   r5, r10
        ldr     r10, [r7, #0x24]
        ldr     r11, [r7, #0x28]!
        mov     r2, r5
        mov     r3, r4
        mov     r0, r10
        mov     r1, r11
        bl      __gtdf2
        cmp     r0, #0
        add     r9, r9, #5
        movgt   r5, r10
        movgt   r4, r11
        cmp     r9, r8
        ble     LBIG0
        ldr     r10, [sp, #4]
        ldr     r0, [sp]
LBIG1:
        mov     r12, r9, lsl #3
        sub     r12, r12, #4
        add     r11, r12, r0
LBIG2:
        ldr     r7, [r11, #4]
        ldr     r8, [r11, #8]!
        mov     r2, r5
        mov     r3, r4
        mov     r0, r7
        mov     r1, r8
        bl      __gtdf2
        cmp     r0, #0
        movgt   r5, r7
        movgt   r4, r8
        add     r9, r9, #1
        cmp     r9, r10
        blt     LBIG2
        mov     r0, #0
        str     r5, [r6]
        str     r4, [r6, #4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBIG3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBIG4:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


