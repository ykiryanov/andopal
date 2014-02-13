        .text
        .align  4
        .globl  _ippsVectorRamp_64f


_ippsVectorRamp_64f:
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
        blt     LAZX1
        sub     r10, r7, #6
        sub     r9, r8, #0x24
LAZX0:
        mov     r0, r6
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        bl      __extendsfdf2
        str     r0, [r9, #0x24]
        str     r1, [r9, #0x28]!
        add     r11, r6, #1
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        bl      __extendsfdf2
        str     r0, [r8, +r11, lsl #3]
        add     r11, r8, r11, lsl #3
        str     r1, [r11, #4]
        add     r11, r6, #2
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        bl      __extendsfdf2
        str     r0, [r8, +r11, lsl #3]
        add     r11, r8, r11, lsl #3
        str     r1, [r11, #4]
        add     r11, r6, #3
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        bl      __extendsfdf2
        str     r0, [r8, +r11, lsl #3]
        add     r11, r8, r11, lsl #3
        str     r1, [r11, #4]
        add     r11, r6, #4
        mov     r0, r11
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        bl      __extendsfdf2
        str     r0, [r8, +r11, lsl #3]
        add     r6, r6, #5
        add     r11, r8, r11, lsl #3
        cmp     r6, r10
        str     r1, [r11, #4]
        ble     LAZX0
LAZX1:
        mov     r12, r6, lsl #3
        sub     r12, r12, #4
        add     r8, r12, r8
LAZX2:
        mov     r0, r6
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        bl      __extendsfdf2
        add     r6, r6, #1
        str     r0, [r8, #4]
        str     r1, [r8, #8]!
        cmp     r6, r7
        blt     LAZX2
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}


