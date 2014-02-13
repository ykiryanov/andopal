        .text
        .align  4
        .globl  _ippsSqr_64fc_I


_ippsSqr_64fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r10, r1
        beq     LAWJ3
        cmp     r10, #0
        ble     LAWJ2
        cmp     r10, #0
        ble     LAWJ1
        sub     r11, r0, #4
LAWJ0:
        ldr     r4, [r11, #4]
        ldr     r7, [r11, #8]
        ldr     r5, [r11, #0xC]
        ldr     r6, [r11, #0x10]
        mov     r0, r4
        mov     r2, r5
        mov     r1, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r0, [sp]
        str     r1, [sp, #4]
        mov     r0, r4
        mov     r1, r7
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r8, r0
        mov     r9, r1
        mov     r0, r4
        mov     r1, r7
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        str     r0, [r11, #4]
        str     r1, [r11, #8]
        ldr     r0, [sp]
        subs    r10, r10, #1
        str     r0, [r11, #0xC]
        ldr     r0, [sp, #4]
        str     r0, [r11, #0x10]!
        bne     LAWJ0
LAWJ1:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAWJ2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAWJ3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


