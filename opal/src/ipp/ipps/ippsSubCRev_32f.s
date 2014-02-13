        .text
        .align  4
        .globl  _ippsSubCRev_32f


_ippsSubCRev_32f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r2
        mov     r6, r3
        beq     LAUX3
        cmp     r7, #0
        beq     LAUX3
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r6, #6
        mov     r11, #0
        blt     LAUX1
        sub     r10, r6, #6
        add     r9, r5, #4
        add     r8, r7, #4
LAUX0:
        ldr     r1, [r9, #-4]
        mov     r0, r4
        add     r11, r11, #5
        bl      __subsf3
        str     r0, [r8, #-4]
        ldr     r1, [r9]
        mov     r0, r4
        bl      __subsf3
        str     r0, [r8]
        ldr     r1, [r9, #4]
        mov     r0, r4
        bl      __subsf3
        str     r0, [r8, #4]
        ldr     r1, [r9, #8]
        mov     r0, r4
        bl      __subsf3
        str     r0, [r8, #8]
        ldr     r1, [r9, #0xC]
        mov     r0, r4
        add     r9, r9, #0x14
        bl      __subsf3
        str     r0, [r8, #0xC]
        cmp     r11, r10
        add     r8, r8, #0x14
        ble     LAUX0
LAUX1:
        add     r5, r5, r11, lsl #2
        add     r7, r7, r11, lsl #2
LAUX2:
        ldr     r1, [r5], #4
        mov     r0, r4
        bl      __subsf3
        add     r11, r11, #1
        str     r0, [r7], #4
        cmp     r11, r6
        blt     LAUX2
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAUX3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


