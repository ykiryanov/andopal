        .text
        .align  4
        .globl  _ippsMul_32f32fc


_ippsMul_32f32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        mov     r4, r3
        beq     LBEV3
        cmp     r6, #0
        beq     LBEV3
        cmp     r5, #0
        beq     LBEV3
        cmp     r4, #0
        ble     LBEV4
        cmp     r4, #4
        mov     r11, #0
        blt     LBEV1
        sub     r12, r4, #4
        sub     r10, r6, #0x14
        sub     r9, r5, #0x14
        mov     r8, r7
        str     r12, [sp, #4]
        str     r4, [sp]
LBEV0:
        ldr     r1, [r10, #0x14]
        ldr     r0, [r8]
        add     r4, r11, #1
        bl      __mulsf3
        str     r0, [r9, #0x14]
        ldr     r0, [r8], #0xC
        ldr     r1, [r10, #0x18]!
        bl      __mulsf3
        str     r0, [r9, #0x18]!
        ldr     r0, [r7, +r4, lsl #2]
        ldr     r1, [r6, +r4, lsl #3]
        add     r3, r6, r4, lsl #3
        str     r3, [sp, #8]
        bl      __mulsf3
        str     r0, [r5, +r4, lsl #3]
        ldr     r3, [sp, #8]
        ldr     r0, [r7, +r4, lsl #2]
        ldr     r1, [r3, #4]
        add     r4, r5, r4, lsl #3
        bl      __mulsf3
        str     r0, [r4, #4]
        add     r4, r11, #2
        ldr     r0, [r7, +r4, lsl #2]
        ldr     r1, [r6, +r4, lsl #3]
        add     r3, r6, r4, lsl #3
        str     r3, [sp, #8]
        bl      __mulsf3
        str     r0, [r5, +r4, lsl #3]
        ldr     r3, [sp, #8]
        ldr     r0, [r7, +r4, lsl #2]
        add     r11, r11, #3
        ldr     r1, [r3, #4]
        add     r4, r5, r4, lsl #3
        bl      __mulsf3
        ldr     r3, [sp, #4]
        str     r0, [r4, #4]
        cmp     r11, r3
        ble     LBEV0
        ldr     r4, [sp]
LBEV1:
        mov     r12, r11, lsl #3
        sub     r12, r12, #4
        add     r6, r12, r6
        add     r5, r12, r5
        add     r7, r7, r11, lsl #2
LBEV2:
        ldr     r0, [r7]
        ldr     r1, [r6, #4]
        add     r11, r11, #1
        bl      __mulsf3
        str     r0, [r5, #4]
        ldr     r0, [r7], #4
        ldr     r1, [r6, #8]!
        bl      __mulsf3
        str     r0, [r5, #8]!
        cmp     r11, r4
        blt     LBEV2
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBEV3:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBEV4:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


