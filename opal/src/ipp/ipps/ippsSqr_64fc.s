        .text
        .align  4
        .globl  _ippsSqr_64fc


_ippsSqr_64fc:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r9, r2
        beq     LAWK3
        cmp     r1, #0
        beq     LAWK3
        cmp     r9, #0
        ble     LAWK2
        cmp     r9, #0
        ble     LAWK1
        sub     r11, r0, #4
        sub     r10, r1, #4
LAWK0:
        ldr     r6, [r11, #0xC]
        ldr     r5, [r11, #0x10]
        ldr     r8, [r11, #4]
        ldr     r7, [r11, #8]
        mov     r2, r6
        mov     r3, r5
        mov     r0, r8
        mov     r1, r7
        bl      __subdf3
        str     r0, [sp]
        mov     r4, r1
        mov     r0, r8
        mov     r1, r7
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp]
        mov     r3, r4
        bl      __muldf3
        str     r0, [r10, #4]
        str     r1, [r10, #8]
        ldr     r0, [r11, #4]
        ldr     r1, [r11, #8]
        ldr     r2, [r11, #0xC]
        ldr     r3, [r11, #0x10]!
        bl      __muldf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r0, [r10, #0xC]
        str     r1, [r10, #0x10]!
        subs    r9, r9, #1
        bne     LAWK0
LAWK1:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAWK2:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LAWK3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


