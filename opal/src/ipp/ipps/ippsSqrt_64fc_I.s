        .text
        .align  4
        .globl  _ippsSqrt_64fc_I


_ippsSqrt_64fc_I:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r10, r1
        beq     LAVQ8
        cmp     r10, #0
        ble     LAVQ7
        cmp     r10, #0
        ble     LAVQ4
        mov     r2, #0xFE, 12
        orr     r8, r2, #3, 4
LAVQ0:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, #0
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r2
        mov     r1, r3
        mov     r3, r8
        mov     r2, #0
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAVQ1
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp]
        mov     r11, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp]
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        bl      sqrt
        mov     r6, r0
        mov     r7, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r6
        mov     r3, r7
        bl      __divdf3
        str     r6, [r9]
        str     r7, [r9, #4]
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        b       LAVQ3
LAVQ1:
        mov     r0, r6
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LAVQ5
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp]
        mov     r11, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp]
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        bl      sqrt
        mov     r6, r0
        mov     r7, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        eorlt   r7, r7, #2, 2
        mov     r0, r4
        mov     r1, r5
        mov     r2, r6
        mov     r3, r7
        bl      __divdf3
LAVQ2:
        str     r0, [r9]
        str     r1, [r9, #4]
        str     r6, [r9, #8]
        str     r7, [r9, #0xC]
LAVQ3:
        subs    r10, r10, #1
        add     r9, r9, #0x10
        bne     LAVQ0
LAVQ4:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAVQ5:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LAVQ6
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        mov     r6, r0
        mov     r7, r1
        b       LAVQ2
LAVQ6:
        eor     r1, r5, #2, 2
        mov     r0, r4
        bl      sqrt
        mov     r6, r0
        eor     r7, r1, #2, 2
        b       LAVQ2
LAVQ7:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LAVQ8:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


