        .text
        .align  4
        .globl  _ippsNormDiff_L1_32f


_ippsNormDiff_L1_32f:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r7, r1
        mov     r6, r2
        mov     r5, r3
        beq     LBCQ3
        cmp     r7, #0
        beq     LBCQ3
        cmp     r5, #0
        beq     LBCQ3
        cmp     r6, #0
        ble     LBCQ4
        ldr     r12, [pc, #0x114]
        cmp     r6, #6
        mov     r11, #0
        ldr     r4, [r12]
        blt     LBCQ1
        sub     r10, r6, #6
        add     r9, r0, #4
        add     r8, r7, #4
        str     r0, [sp]
LBCQ0:
        ldr     r1, [r8, #-4]
        ldr     r0, [r9, #-4]
        add     r11, r11, #5
        bl      __subsf3
        bic     r1, r0, #2, 2
        mov     r0, r4
        bl      __addsf3
        mov     r4, r0
        ldr     r1, [r8]
        ldr     r0, [r9]
        bl      __subsf3
        bic     r1, r0, #2, 2
        mov     r0, r4
        bl      __addsf3
        ldr     r1, [r9, #4]
        ldr     r2, [r8, #4]
        mov     r4, r0
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        bic     r1, r0, #2, 2
        mov     r0, r4
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [r9, #8]
        ldr     r1, [r8, #8]
        bl      __subsf3
        bic     r1, r0, #2, 2
        mov     r0, r4
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [r9, #0xC]
        ldr     r1, [r8, #0xC]
        add     r9, r9, #0x14
        add     r8, r8, #0x14
        bl      __subsf3
        bic     r1, r0, #2, 2
        mov     r0, r4
        bl      __addsf3
        cmp     r11, r10
        mov     r4, r0
        ble     LBCQ0
        ldr     r0, [sp]
LBCQ1:
        add     r8, r0, r11, lsl #2
        add     r7, r7, r11, lsl #2
LBCQ2:
        ldr     r0, [r8], #4
        ldr     r1, [r7], #4
        bl      __subsf3
        bic     r1, r0, #2, 2
        mov     r0, r4
        bl      __addsf3
        add     r11, r11, #1
        cmp     r11, r6
        mov     r4, r0
        blt     LBCQ2
        mov     r0, #0
        str     r4, [r5]
        ldmia   sp!, {r1, r4 - r11, pc}
LBCQ3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LBCQ4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   LBCQ__2il0floatpacket.1


        .data
        .align  4


LBCQ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


