        .text
        .align  4
        .globl  _ippsFixedCodebookSearch_G729E_32f


_ippsFixedCodebookSearch_G729E_32f:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #8
        ldr     r5, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0x1C]
        mov     r4, r3
        mov     r3, r0
        mov     r0, r1
        cmp     r4, #0
        mov     r1, r2
        beq     LDLW1
        cmp     r1, #0
        beq     LDLW1
        cmp     r0, #0
        beq     LDLW1
        cmp     r5, #0
        beq     LDLW1
        cmp     lr, #0
        beq     LDLW1
        cmp     r12, #0
        beq     LDLW1
        cmp     r3, #0
        str     r12, [sp, #4]
        str     lr, [sp]
        bne     LDLW0
        mov     r3, r5
        mov     r2, r4
        bl      ownACELP_10i40_35bits_32f
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LDLW0:
        mov     r3, r5
        mov     r2, r4
        bl      ownACELP_12i40_44bits_32f
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LDLW1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}


