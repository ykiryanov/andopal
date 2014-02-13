        .text
        .align  4
        .globl  _ippsSqrt_64fc


_ippsSqrt_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r9, r0
        cmp     r9, #0
        mov     r11, r1
        mov     r10, r2
        beq     LAVR8
        cmp     r11, #0
        beq     LAVR8
        cmp     r10, #0
        ble     LAVR7
        cmp     r10, #0
        ble     LAVR4
        mov     r3, #0xFE, 12
        orr     r8, r3, #3, 4
LAVR0:
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
        ble     LAVR1
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp]
        str     r1, [sp, #4]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        bl      __adddf3
        bl      sqrt
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        bl      sqrt
        mov     r7, r0
        mov     r6, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
        str     r7, [r11]
        str     r6, [r11, #4]
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        b       LAVR3
LAVR1:
        mov     r0, r6
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LAVR5
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp, #4]
        str     r1, [sp]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
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
LAVR2:
        str     r0, [r11]
        str     r1, [r11, #4]
        str     r6, [r11, #8]
        str     r7, [r11, #0xC]
LAVR3:
        subs    r10, r10, #1
        add     r11, r11, #0x10
        add     r9, r9, #0x10
        bne     LAVR0
LAVR4:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVR5:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LAVR6
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        mov     r6, r0
        mov     r7, r1
        b       LAVR2
LAVR6:
        eor     r1, r5, #2, 2
        mov     r0, r4
        bl      sqrt
        mov     r6, r0
        eor     r7, r1, #2, 2
        b       LAVR2
LAVR7:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVR8:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


