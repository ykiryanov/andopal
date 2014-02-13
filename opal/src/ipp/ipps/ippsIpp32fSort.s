        .text
        .align  4
        .globl  ownippsIpp32fSort


ownippsIpp32fSort:
        stmdb   sp!, {r4 - r11, lr}
        sub     r7, r1, #1
        cmp     r7, #0
        mov     r4, r0
        ble     LBHL3
        add     r8, r4, #4
LBHL0:
        cmp     r7, #0
        ble     LBHL2
        mov     r10, r8
        mov     r11, #0
        mov     r9, r4
LBHL1:
        ldr     r6, [r9]
        ldr     r5, [r10]
        mov     r0, r6
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        strgt   r5, [r9]
        strgt   r6, [r10]
        add     r11, r11, #1
        cmp     r11, r7
        add     r10, r10, #4
        add     r9, r9, #4
        blt     LBHL1
LBHL2:
        sub     r7, r7, #1
        cmp     r7, #0
        bgt     LBHL0
LBHL3:
        ldmia   sp!, {r4 - r11, pc}


