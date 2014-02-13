        .text
        .align  4
        .globl  _ippsMax_32f


_ippsMax_32f:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r6, r1
        mov     r5, r2
        beq     LBIH3
        cmp     r5, #0
        beq     LBIH3
        cmp     r6, #0
        ble     LBIH4
        ldr     r4, [r0]
        cmp     r6, #6
        mov     r10, #0
        blt     LBIH1
        sub     r9, r6, #6
        add     r8, r0, #4
        str     r0, [sp]
LBIH0:
        ldr     r7, [r8, #-4]
        mov     r1, r4
        add     r10, r10, #5
        mov     r0, r7
        bl      __gtsf2
        ldr     r11, [r8]
        cmp     r0, #0
        movgt   r4, r7
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        ldr     r7, [r8, #4]
        cmp     r0, #0
        movgt   r4, r11
        mov     r1, r4
        mov     r0, r7
        bl      __gtsf2
        ldr     r11, [r8, #8]
        cmp     r0, #0
        movgt   r4, r7
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        ldr     r7, [r8, #0xC]
        cmp     r0, #0
        movgt   r4, r11
        mov     r1, r4
        mov     r0, r7
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r7
        cmp     r10, r9
        add     r8, r8, #0x14
        ble     LBIH0
        ldr     r0, [sp]
LBIH1:
        add     r8, r0, r10, lsl #2
LBIH2:
        ldr     r7, [r8], #4
        mov     r1, r4
        mov     r0, r7
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r7
        add     r10, r10, #1
        cmp     r10, r6
        blt     LBIH2
        mov     r0, #0
        str     r4, [r5]
        ldmia   sp!, {r1, r4 - r11, pc}
LBIH3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LBIH4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


