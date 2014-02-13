        .text
        .align  4
        .globl  _ippsMaxEvery_32f_I


_ippsMaxEvery_32f_I:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r5, r1
        mov     r4, r2
        beq     LBGB3
        cmp     r5, #0
        beq     LBGB3
        cmp     r4, #0
        ble     LBGB4
        cmp     r4, #6
        mov     r9, #0
        blt     LBGB1
        sub     r8, r4, #6
        add     r7, r0, #4
        add     r6, r5, #4
        str     r0, [sp]
LBGB0:
        ldr     r11, [r6, #-4]
        ldr     r10, [r7, #-4]
        add     r9, r9, #5
        mov     r1, r11
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r10
        str     r11, [r6, #-4]
        ldr     r11, [r6]
        ldr     r10, [r7]
        mov     r1, r11
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r10
        str     r11, [r6]
        ldr     r11, [r6, #4]
        ldr     r10, [r7, #4]
        mov     r1, r11
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r10
        str     r11, [r6, #4]
        ldr     r11, [r6, #8]
        ldr     r10, [r7, #8]
        mov     r1, r11
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r10
        str     r11, [r6, #8]
        ldr     r11, [r6, #0xC]
        ldr     r10, [r7, #0xC]
        add     r7, r7, #0x14
        mov     r1, r11
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        movgt   r11, r10
        str     r11, [r6, #0xC]
        cmp     r9, r8
        add     r6, r6, #0x14
        ble     LBGB0
        ldr     r0, [sp]
LBGB1:
        add     r6, r0, r9, lsl #2
        add     r8, r5, r9, lsl #2
LBGB2:
        ldr     r5, [r8]
        ldr     r7, [r6], #4
        mov     r1, r5
        add     r9, r9, #1
        mov     r0, r7
        bl      __gtsf2
        cmp     r0, #0
        movgt   r5, r7
        str     r5, [r8], #4
        cmp     r9, r4
        blt     LBGB2
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBGB3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LBGB4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


