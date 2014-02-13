        .text
        .align  4
        .globl  _ippsVectorRamp_32f


_ippsVectorRamp_32f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r5, r2
        mov     r4, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r11, pc}
        cmp     r7, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r7, #6
        mov     r6, #0
        blt     LBAA1
        sub     r10, r7, #6
        mov     r9, r8
LBAA0:
        mov     r0, r6
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r9], #0x14
        add     r11, r6, #1
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r8, +r11, lsl #2]
        add     r11, r6, #2
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r8, +r11, lsl #2]
        add     r11, r6, #3
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [r8, +r11, lsl #2]
        add     r11, r6, #4
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        add     r6, r6, #5
        cmp     r6, r10
        str     r0, [r8, +r11, lsl #2]
        ble     LBAA0
LBAA1:
        add     r8, r8, r6, lsl #2
LBAA2:
        mov     r0, r6
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        add     r6, r6, #1
        str     r0, [r8], #4
        cmp     r6, r7
        blt     LBAA2
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}


