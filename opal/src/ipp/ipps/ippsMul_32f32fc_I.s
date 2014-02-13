        .text
        .align  4
        .globl  _ippsMul_32f32fc_I


_ippsMul_32f32fc_I:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r10, r2
        beq     LBEU3
        cmp     r4, #0
        beq     LBEU3
        cmp     r10, #0
        ble     LBEU4
        cmp     r10, #4
        mov     r9, #0
        blt     LBEU1
        sub     r8, r10, #4
        sub     r7, r4, #0x14
        mov     r6, r5
        str     r10, [sp]
LBEU0:
        ldr     r0, [r6]
        ldr     r1, [r7, #0x14]
        add     r11, r9, #1
        add     r10, r4, r11, lsl #3
        bl      __mulsf3
        str     r0, [r7, #0x14]
        ldr     r0, [r6], #0xC
        ldr     r1, [r7, #0x18]
        bl      __mulsf3
        str     r0, [r7, #0x18]!
        ldr     r0, [r5, +r11, lsl #2]
        ldr     r1, [r4, +r11, lsl #3]
        bl      __mulsf3
        str     r0, [r4, +r11, lsl #3]
        ldr     r0, [r5, +r11, lsl #2]
        ldr     r1, [r10, #4]
        add     r11, r9, #2
        add     r9, r9, #3
        bl      __mulsf3
        str     r0, [r10, #4]
        ldr     r0, [r5, +r11, lsl #2]
        ldr     r1, [r4, +r11, lsl #3]
        add     r10, r4, r11, lsl #3
        bl      __mulsf3
        str     r0, [r4, +r11, lsl #3]
        ldr     r0, [r5, +r11, lsl #2]
        ldr     r1, [r10, #4]
        bl      __mulsf3
        cmp     r9, r8
        str     r0, [r10, #4]
        ble     LBEU0
        ldr     r10, [sp]
LBEU1:
        mov     r3, r9, lsl #3
        sub     r3, r3, #4
        add     r4, r3, r4
        add     r5, r5, r9, lsl #2
LBEU2:
        ldr     r0, [r5]
        ldr     r1, [r4, #4]
        add     r9, r9, #1
        bl      __mulsf3
        str     r0, [r4, #4]
        ldr     r0, [r5], #4
        ldr     r1, [r4, #8]
        bl      __mulsf3
        str     r0, [r4, #8]!
        cmp     r9, r10
        blt     LBEU2
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBEU3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LBEU4:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


