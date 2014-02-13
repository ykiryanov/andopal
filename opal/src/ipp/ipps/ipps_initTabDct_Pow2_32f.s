        .text
        .align  4
        .globl  _ipps_initTabDct_Pow2_32f


_ipps_initTabDct_Pow2_32f:
        stmdb   sp!, {r0, r4 - r11, lr}
        mov     r11, r0
        cmp     r11, #8
        mov     r5, r1
        ble     LCRW3
        ldr     r10, [pc, #0xB8]
        ldr     r9, [pc, #0xB8]
        mov     r2, #0xFE, 12
        orr     r4, r2, #3, 4
        mov     r7, #1
        mov     r6, #0
LCRW0:
        mov     r0, r11, lsl #1
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r9
        bl      __divdf3
        cmp     r11, #0
        mov     r2, r6
        movlt   r2, r7
        add     r3, r11, r2
        mov     r2, r3, asr #1
        cmp     r2, #0
        ble     LCRW2
        str     r11, [sp]
        mov     r8, #1
        mov     r10, r0
        mov     r9, r1
        mov     r11, r2
LCRW1:
        mov     r0, r8
        bl      __floatsidf
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        bl      cos
        mov     r2, r0
        mov     r3, r1
        mov     r1, r4
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r5], #4
        subs    r11, r11, #1
        add     r8, r8, #2
        bne     LCRW1
        ldr     r9, [pc, #0x18]
        ldr     r10, [pc, #0x10]
        ldr     r11, [sp]
LCRW2:
        mov     r11, r11, asr #1
        cmp     r11, #8
        bgt     LCRW0
LCRW3:
        ldmia   sp!, {r0, r4 - r11, pc}
        .long   0x54442d18
        .long   0x400921fb


