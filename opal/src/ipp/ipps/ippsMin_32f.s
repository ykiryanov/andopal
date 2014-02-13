        .text
        .align  4
        .globl  _ippsMin_32f


_ippsMin_32f:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r6, r1
        mov     r5, r2
        beq     LBHH3
        cmp     r5, #0
        beq     LBHH3
        cmp     r6, #0
        ble     LBHH4
        ldr     r4, [r0]
        cmp     r6, #6
        mov     r10, #0
        blt     LBHH1
        sub     r9, r6, #6
        add     r8, r0, #4
        str     r0, [sp]
LBHH0:
        ldr     r7, [r8, #-4]
        mov     r1, r4
        add     r10, r10, #5
        mov     r0, r7
        bl      __ltsf2
        ldr     r11, [r8]
        cmp     r0, #0
        movlt   r4, r7
        mov     r1, r4
        mov     r0, r11
        bl      __ltsf2
        ldr     r7, [r8, #4]
        cmp     r0, #0
        movlt   r4, r11
        mov     r1, r4
        mov     r0, r7
        bl      __ltsf2
        ldr     r11, [r8, #8]
        cmp     r0, #0
        movlt   r4, r7
        mov     r1, r4
        mov     r0, r11
        bl      __ltsf2
        ldr     r7, [r8, #0xC]
        cmp     r0, #0
        movlt   r4, r11
        mov     r1, r4
        mov     r0, r7
        bl      __ltsf2
        cmp     r0, #0
        movlt   r4, r7
        cmp     r10, r9
        add     r8, r8, #0x14
        ble     LBHH0
        ldr     r0, [sp]
LBHH1:
        add     r8, r0, r10, lsl #2
LBHH2:
        ldr     r7, [r8], #4
        mov     r1, r4
        mov     r0, r7
        bl      __ltsf2
        cmp     r0, #0
        movlt   r4, r7
        add     r10, r10, #1
        cmp     r10, r6
        blt     LBHH2
        mov     r0, #0
        str     r4, [r5]
        ldmia   sp!, {r1, r4 - r11, pc}
LBHH3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LBHH4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


