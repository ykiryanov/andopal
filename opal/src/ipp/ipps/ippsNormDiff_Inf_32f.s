        .text
        .align  4
        .globl  _ippsNormDiff_Inf_32f


_ippsNormDiff_Inf_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r6, r2
        mov     r5, r3
        beq     LBCV3
        cmp     r1, #0
        beq     LBCV3
        cmp     r5, #0
        beq     LBCV3
        cmp     r6, #0
        ble     LBCV4
        ldr     r12, [pc, #0x150]
        cmp     r6, #6
        mov     r10, #0
        ldr     r4, [r12]
        blt     LBCV1
        sub     r9, r6, #6
        add     r8, r0, #4
        add     r7, r1, #4
        str     r1, [sp, #4]
        str     r0, [sp]
LBCV0:
        ldr     r0, [r8, #-4]
        ldr     r1, [r7, #-4]
        add     r10, r10, #5
        bl      __subsf3
        bic     r11, r0, #2, 2
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        ldr     r1, [r7]
        cmp     r0, #0
        ldr     r0, [r8]
        movgt   r4, r11
        bl      __subsf3
        bic     r11, r0, #2, 2
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        cmp     r0, #0
        ldr     r0, [r8, #4]
        ldr     r1, [r7, #4]
        movgt   r4, r11
        bl      __subsf3
        bic     r11, r0, #2, 2
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        cmp     r0, #0
        ldr     r0, [r8, #8]
        ldr     r1, [r7, #8]
        movgt   r4, r11
        bl      __subsf3
        bic     r11, r0, #2, 2
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        cmp     r0, #0
        ldr     r0, [r8, #0xC]
        ldr     r1, [r7, #0xC]
        movgt   r4, r11
        add     r8, r8, #0x14
        bl      __subsf3
        bic     r11, r0, #2, 2
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r11
        cmp     r10, r9
        add     r7, r7, #0x14
        ble     LBCV0
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBCV1:
        add     r8, r0, r10, lsl #2
        add     r7, r1, r10, lsl #2
LBCV2:
        ldr     r0, [r8], #4
        ldr     r1, [r7], #4
        bl      __subsf3
        bic     r9, r0, #2, 2
        mov     r1, r4
        mov     r0, r9
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r9
        add     r10, r10, #1
        cmp     r10, r6
        blt     LBCV2
        mov     r0, #0
        str     r4, [r5]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBCV3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBCV4:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LBCV__2il0floatpacket.1


        .data
        .align  4


LBCV__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


