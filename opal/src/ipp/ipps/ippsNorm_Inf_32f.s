        .text
        .align  4
        .globl  _ippsNorm_Inf_32f


_ippsNorm_Inf_32f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        beq     LBCH3
        cmp     r5, #0
        beq     LBCH3
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        ldr     r3, [pc, #0xF0]
        cmp     r6, #6
        mov     r10, #0
        ldr     r4, [r3]
        blt     LBCH1
        sub     r9, r6, #6
        add     r8, r7, #4
LBCH0:
        ldr     r3, [r8, #-4]
        mov     r1, r4
        add     r10, r10, #5
        bic     r11, r3, #2, 2
        mov     r0, r11
        bl      __gtsf2
        ldr     r3, [r8]
        cmp     r0, #0
        movgt   r4, r11
        bic     r11, r3, #2, 2
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        ldr     r3, [r8, #4]
        cmp     r0, #0
        movgt   r4, r11
        bic     r11, r3, #2, 2
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        ldr     r3, [r8, #8]
        cmp     r0, #0
        movgt   r4, r11
        bic     r11, r3, #2, 2
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        ldr     r3, [r8, #0xC]
        cmp     r0, #0
        movgt   r4, r11
        bic     r11, r3, #2, 2
        mov     r1, r4
        mov     r0, r11
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r11
        cmp     r10, r9
        add     r8, r8, #0x14
        ble     LBCH0
LBCH1:
        add     r7, r7, r10, lsl #2
LBCH2:
        ldr     r0, [r7], #4
        add     r10, r10, #1
        bic     r8, r0, #2, 2
        mov     r1, r4
        mov     r0, r8
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r8
        cmp     r10, r6
        blt     LBCH2
        mov     r0, #0
        str     r4, [r5]
        ldmia   sp!, {r4 - r11, pc}
LBCH3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   LBCH__2il0floatpacket.1


        .data
        .align  4


LBCH__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


