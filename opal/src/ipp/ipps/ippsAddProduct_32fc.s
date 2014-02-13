        .text
        .align  4
        .globl  _ippsAddProduct_32fc


_ippsAddProduct_32fc:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        mov     r4, r3
        beq     LDBO2
        cmp     r1, #0
        beq     LDBO2
        cmp     r2, #0
        beq     LDBO2
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r4, #0
        ble     LDBO1
        add     r7, r1, #4
        sub     r6, r0, #4
        sub     r5, r2, #4
LDBO0:
        ldr     r1, [r7, #-4]
        ldr     r0, [r6, #4]
        ldr     r8, [r5, #4]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #8]
        ldr     r2, [r7]
        mov     r8, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [r5, #4]
        ldr     r0, [r6, #4]
        ldr     r1, [r7]
        ldr     r8, [r5, #8]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [r6, #8]!
        ldr     r2, [r7, #-4]
        mov     r8, r0
        mov     r0, r1
        add     r7, r7, #8
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r5, #8]!
        subs    r4, r4, #1
        bne     LDBO0
LDBO1:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LDBO2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


