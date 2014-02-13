        .text
        .align  4
        .globl  _ippsNormDiff_Inf_16s32f


_ippsNormDiff_Inf_16s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r6, r2
        mov     r5, r3
        beq     LBCX3
        cmp     r1, #0
        beq     LBCX3
        cmp     r5, #0
        beq     LBCX3
        cmp     r6, #0
        ble     LBCX4
        ldr     r12, [pc, #0x154]
        cmp     r6, #5
        mov     r10, #0
        ldr     r4, [r12]
        blt     LBCX1
        sub     r9, r6, #5
        mov     r8, r0
        mov     r7, r1
        str     r1, [sp, #4]
        str     r0, [sp]
LBCX0:
        ldrsh   r12, [r8]
        ldrsh   r0, [r7]
        add     r10, r10, #4
        sub     r0, r12, r0
        bl      __floatsidf
        bic     r1, r1, #2, 2
        bl      __truncdfsf2
        mov     r11, r0
        mov     r1, r4
        bl      __gtsf2
        ldrsh   r12, [r8, #2]
        cmp     r0, #0
        ldrsh   r0, [r7, #2]
        movgt   r4, r11
        sub     r0, r12, r0
        bl      __floatsidf
        bic     r1, r1, #2, 2
        bl      __truncdfsf2
        mov     r11, r0
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ldrsh   r0, [r7, #4]
        ldrsh   r12, [r8, #4]
        movgt   r4, r11
        sub     r0, r12, r0
        bl      __floatsidf
        bic     r1, r1, #2, 2
        bl      __truncdfsf2
        mov     r11, r0
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ldrsh   r0, [r7, #6]
        ldrsh   r12, [r8, #6]
        movgt   r4, r11
        add     r8, r8, #8
        add     r7, r7, #8
        sub     r0, r12, r0
        bl      __floatsidf
        bic     r1, r1, #2, 2
        bl      __truncdfsf2
        mov     r11, r0
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r11
        cmp     r10, r9
        ble     LBCX0
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBCX1:
        add     r8, r0, r10, lsl #1
        add     r7, r1, r10, lsl #1
LBCX2:
        ldrsh   r0, [r8], #2
        ldrsh   r12, [r7], #2
        add     r10, r10, #1
        sub     r0, r0, r12
        bl      __floatsidf
        bic     r1, r1, #2, 2
        bl      __truncdfsf2
        mov     r9, r0
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r9
        cmp     r10, r6
        blt     LBCX2
        mov     r0, #0
        str     r4, [r5]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBCX3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBCX4:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LBCX__2il0floatpacket.1


        .data
        .align  4


LBCX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


