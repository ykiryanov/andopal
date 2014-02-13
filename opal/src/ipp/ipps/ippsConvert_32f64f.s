        .text
        .align  4
        .globl  _ippsConvert_32f64f


_ippsConvert_32f64f:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r10, r2
        beq     LCXA3
        cmp     r4, #0
        beq     LCXA3
        cmp     r10, #0
        ble     LCXA4
        cmp     r10, #6
        mov     r9, #0
        blt     LCXA1
        sub     r8, r10, #6
        sub     r7, r4, #0x24
        mov     r6, r5
        str     r10, [sp]
LCXA0:
        ldr     r0, [r6], #0x14
        add     r10, r9, #1
        bl      __extendsfdf2
        str     r0, [r7, #0x24]
        str     r1, [r7, #0x28]!
        ldr     r0, [r5, +r10, lsl #2]
        bl      __extendsfdf2
        str     r0, [r4, +r10, lsl #3]
        add     r10, r4, r10, lsl #3
        str     r1, [r10, #4]
        add     r10, r9, #2
        ldr     r0, [r5, +r10, lsl #2]
        add     r11, r4, r10, lsl #3
        bl      __extendsfdf2
        str     r0, [r4, +r10, lsl #3]
        str     r1, [r11, #4]
        add     r10, r9, #3
        ldr     r0, [r5, +r10, lsl #2]
        add     r11, r4, r10, lsl #3
        bl      __extendsfdf2
        str     r0, [r4, +r10, lsl #3]
        str     r1, [r11, #4]
        add     r10, r9, #4
        ldr     r0, [r5, +r10, lsl #2]
        add     r9, r9, #5
        bl      __extendsfdf2
        str     r0, [r4, +r10, lsl #3]
        add     r10, r4, r10, lsl #3
        cmp     r9, r8
        str     r1, [r10, #4]
        ble     LCXA0
        ldr     r10, [sp]
LCXA1:
        mov     r3, r9, lsl #3
        sub     r3, r3, #4
        add     r4, r3, r4
        add     r5, r5, r9, lsl #2
LCXA2:
        ldr     r0, [r5], #4
        add     r9, r9, #1
        bl      __extendsfdf2
        str     r0, [r4, #4]
        str     r1, [r4, #8]!
        cmp     r9, r10
        blt     LCXA2
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LCXA3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LCXA4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


