        .text
        .align  4
        .globl  _ippsGainControl_G729_32f_I


_ippsGainControl_G729_32f_I:
        stmdb   sp!, {r4 - r9, lr}
        mov     r7, r3
        cmp     r7, #0
        mov     r5, r0
        mov     r4, r1
        beq     LDIY1
        cmp     r2, #0
        beq     LDIY1
        ldr     r6, [r7]
        add     r8, r2, #4
        mov     r9, #0
LDIY0:
        mov     r0, r6
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r8, #-4]
        mov     r6, r0
        bl      __mulsf3
        str     r0, [r8, #-4]
        mov     r1, r4
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r8]
        mov     r6, r0
        bl      __mulsf3
        str     r0, [r8]
        mov     r0, r6
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r8, #4]
        mov     r6, r0
        bl      __mulsf3
        str     r0, [r8, #4]
        mov     r0, r6
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r8, #8]
        mov     r6, r0
        bl      __mulsf3
        add     r9, r9, #4
        str     r0, [r8, #8]
        cmp     r9, #0x28
        add     r8, r8, #0x10
        blt     LDIY0
        mov     r0, #0
        str     r6, [r7]
        ldmia   sp!, {r4 - r9, pc}
LDIY1:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


