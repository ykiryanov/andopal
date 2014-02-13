        .text
        .align  4
        .globl  _ippsSqrt_32fc_I


_ippsSqrt_32fc_I:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r10, r1
        beq     LAVV8
        cmp     r10, #0
        ble     LAVV7
        cmp     r10, #0
        ble     LAVV4
        mov     r2, #0xFE, 12
        orr     r8, r2, #3, 4
LAVV0:
        ldr     r0, [r9]
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [r9, #4]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r2
        bl      __extendsfdf2
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
        ble     LAVV1
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp]
        mov     r11, r1
        mov     r2, r4
        mov     r3, r5
        mov     r0, r4
        mov     r1, r5
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
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r7
        bl      __truncdfsf2
        str     r0, [r9]
        mov     r0, r4
        mov     r1, r5
        bl      __truncdfsf2
        b       LAVV3
LAVV1:
        mov     r0, r6
        mov     r1, r7
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LAVV5
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
LAVV2:
        bl      __truncdfsf2
        str     r0, [r9]
        mov     r0, r6
        mov     r1, r7
        bl      __truncdfsf2
LAVV3:
        str     r0, [r9, #4]
        subs    r10, r10, #1
        add     r9, r9, #8
        bne     LAVV0
LAVV4:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAVV5:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LAVV6
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        mov     r6, r0
        mov     r7, r1
        b       LAVV2
LAVV6:
        eor     r1, r5, #2, 2
        mov     r0, r4
        bl      sqrt
        mov     r6, r0
        eor     r7, r1, #2, 2
        b       LAVV2
LAVV7:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LAVV8:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


