        .text
        .align  4
        .globl  _ippsNorm_L1_32f


_ippsNorm_L1_32f:
        stmdb   sp!, {r4 - r9, lr}
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r5, r2
        beq     LBCC3
        cmp     r5, #0
        beq     LBCC3
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        ldr     r3, [pc, #0x90]
        cmp     r6, #6
        mov     r9, #0
        ldr     r0, [r3]
        blt     LBCC1
        sub     r8, r6, #6
        add     r7, r4, #4
LBCC0:
        ldr     r3, [r7, #-4]
        add     r9, r9, #5
        bic     r1, r3, #2, 2
        bl      __addsf3
        ldr     r3, [r7]
        bic     r1, r3, #2, 2
        bl      __addsf3
        ldr     r3, [r7, #4]
        bic     r1, r3, #2, 2
        bl      __addsf3
        ldr     r3, [r7, #8]
        bic     r1, r3, #2, 2
        bl      __addsf3
        ldr     r3, [r7, #0xC]
        bic     r1, r3, #2, 2
        bl      __addsf3
        cmp     r9, r8
        add     r7, r7, #0x14
        ble     LBCC0
LBCC1:
        add     r4, r4, r9, lsl #2
LBCC2:
        ldr     r3, [r4], #4
        bic     r1, r3, #2, 2
        bl      __addsf3
        add     r9, r9, #1
        cmp     r9, r6
        blt     LBCC2
        str     r0, [r5]
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LBCC3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}
        .long   LBCC__2il0floatpacket.1


        .data
        .align  4


LBCC__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


