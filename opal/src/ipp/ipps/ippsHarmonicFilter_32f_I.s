        .text
        .align  4
        .globl  _ippsHarmonicFilter_32f_I


_ippsHarmonicFilter_32f_I:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r2, #0
        mov     r4, r0
        mov     r5, r3
        beq     LDJW3
        cmp     r5, #0
        ble     LDJW4
        cmp     r5, #5
        rsb     r1, r1, #0
        mov     r10, #0
        addlt   r6, r2, r1, lsl #2
        blt     LDJW1
        add     r6, r2, r1, lsl #2
        sub     r9, r5, #5
        add     r8, r2, #4
        add     r7, r6, #4
        str     r2, [sp]
LDJW0:
        ldr     r0, [r7, #-4]
        ldr     r11, [r8, #-4]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r11, [r8]
        str     r0, [r8, #-4]
        ldr     r0, [r7]
        mov     r1, r4
        add     r10, r10, #4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8]
        ldr     r0, [r7, #4]
        ldr     r11, [r8, #4]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, #4]
        ldr     r0, [r7, #8]
        ldr     r11, [r8, #8]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, #8]
        cmp     r10, r9
        add     r7, r7, #0x10
        add     r8, r8, #0x10
        ble     LDJW0
        ldr     r2, [sp]
LDJW1:
        add     r7, r2, r10, lsl #2
LDJW2:
        ldr     r0, [r6, +r10, lsl #2]
        ldr     r8, [r7]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        add     r10, r10, #1
        str     r0, [r7], #4
        cmp     r10, r5
        blt     LDJW2
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LDJW3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LDJW4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


