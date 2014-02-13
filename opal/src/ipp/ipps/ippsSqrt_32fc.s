        .text
        .align  4
        .globl  _ippsSqrt_32fc


_ippsSqrt_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r7, r0
        cmp     r7, #0
        mov     r9, r1
        mov     r8, r2
        beq     LAVW8
        cmp     r9, #0
        beq     LAVW8
        cmp     r8, #0
        ble     LAVW7
        cmp     r8, #0
        ble     LAVW4
        mov     r3, #0xFE, 12
        orr     r6, r3, #3, 4
LAVW0:
        ldr     r0, [r7]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [r7, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r6
        mov     r2, #0
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        mov     r1, r11
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAVW1
        mov     r0, r10
        mov     r1, r11
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        str     r0, [sp]
        str     r1, [sp, #4]
        mov     r2, r4
        mov     r3, r5
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        bl      __adddf3
        bl      sqrt
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        mov     r11, r0
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r11
        mov     r3, r10
        bl      __divdf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r11
        mov     r1, r10
        bl      __truncdfsf2
        str     r0, [r9]
        mov     r0, r4
        mov     r1, r5
        bl      __truncdfsf2
        b       LAVW3
LAVW1:
        mov     r0, r10
        mov     r1, r11
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LAVW5
        mov     r0, r10
        mov     r1, r11
        mov     r2, r10
        mov     r3, r11
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
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        bl      sqrt
        mov     r10, r0
        mov     r11, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        eorlt   r11, r11, #2, 2
        mov     r0, r4
        mov     r1, r5
        mov     r2, r10
        mov     r3, r11
        bl      __divdf3
LAVW2:
        bl      __truncdfsf2
        str     r0, [r9]
        mov     r0, r10
        mov     r1, r11
        bl      __truncdfsf2
LAVW3:
        str     r0, [r9, #4]
        subs    r8, r8, #1
        add     r9, r9, #8
        add     r7, r7, #8
        bne     LAVW0
LAVW4:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVW5:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LAVW6
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        mov     r10, r0
        mov     r11, r1
        b       LAVW2
LAVW6:
        eor     r1, r5, #2, 2
        mov     r0, r4
        bl      sqrt
        mov     r10, r0
        eor     r11, r1, #2, 2
        b       LAVW2
LAVW7:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVW8:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


