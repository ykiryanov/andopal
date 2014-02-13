        .text
        .align  4
        .globl  _ippsMul_32fc_I


_ippsMul_32fc_I:
        stmdb   sp!, {r4 - r11, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        beq     LBEF2
        cmp     r8, #0
        beq     LBEF2
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r2, #0
        sub     r10, r2, #1
        beq     LBEF1
LBEF0:
        ldr     r4, [r8]
        ldr     r6, [r9]
        ldr     r5, [r9, #4]
        ldr     r7, [r8, #4]
        mov     r0, r4
        mov     r1, r6
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r7
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r4
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r7
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        sub     r10, r10, #1
        str     r0, [r8, #4]
        str     r11, [r8], #8
        cmn     r10, #1
        add     r9, r9, #8
        bne     LBEF0
LBEF1:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBEF2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


