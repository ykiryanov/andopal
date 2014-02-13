        .text
        .align  4
        .globl  _ippsFIRMRGetStateSize32s_16s


_ippsFIRMRGetStateSize32s_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r7, r3
        cmp     r7, #0
        mov     r6, r0
        mov     r4, r1
        mov     r8, r2
        beq     LBUD10
        cmp     r6, #0
        ble     LBUD9
        cmp     r4, #1
        blt     LBUD7
        cmp     r8, #1
        blt     LBUD7
        cmp     r4, #1
        beq     LBUD8
LBUD0:
        add     r12, r6, r4
        sub     r0, r12, #1
        mov     r1, r4
        bl      __intel_idiv
        add     r12, r8, r8, lsl #1
        add     r5, r6, r12
        mov     r10, r0
        mov     r0, r5
        mov     r1, r4
        bl      __intel_imod
        cmp     r0, #0
        ble     LBUD2
LBUD1:
        add     r5, r5, #1
        mov     r0, r5
        mov     r1, r4
        bl      __intel_imod
        cmp     r0, #0
        bgt     LBUD1
LBUD2:
        cmp     r10, #0
        mov     r9, #0
        blt     LBUD4
LBUD3:
        add     r9, r9, r8, lsl #2
        cmp     r10, r9
        bge     LBUD3
LBUD4:
        add     r12, r8, r10
        sub     r0, r12, #1
        mov     r1, r8
        bl      __intel_idiv
        mul     r0, r4, r0
        add     r11, r9, #1
        mov     r9, r4, lsl #2
        mov     r1, r9
        str     r0, [sp, #4]
        bl      __intel_imod
        cmp     r0, #0
        ble     LBUD6
        str     r6, [sp]
        ldr     r6, [sp, #4]
LBUD5:
        add     r6, r4, r6
        mov     r0, r6
        mov     r1, r9
        bl      __intel_imod
        cmp     r0, #0
        add     r11, r11, r8
        bgt     LBUD5
        ldr     r6, [sp]
LBUD6:
        add     r9, r9, #1
        add     r10, r11, r10
        mov     r2, r9, lsl #2
        mov     r12, r5, lsl #3
        add     lr, r2, #0xF
        mov     r6, r6, lsl #1
        mov     r5, r5, lsl #5
        add     r0, r12, #0xF
        add     r10, r10, #1
        add     r2, r6, #0xF
        add     r12, r5, #0xF
        mov     r10, r10, lsl #1
        bic     r2, r2, #0xF
        bic     lr, lr, #0xF
        bic     r0, r0, #0xF
        bic     r12, r12, #0xF
        add     r10, r10, #0xF
        add     r2, r12, r2
        add     lr, r0, lr
        bic     r10, r10, #0xF
        add     r2, lr, r2
        add     r10, r2, r10
        add     r0, r10, #0x82, 26
        str     r0, [r7]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBUD7:
        mvn     r0, #0x1C
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBUD8:
        cmp     r8, #1
        bne     LBUD0
        mov     r0, r6
        mov     r1, r7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsFIRGetStateSize32s_16s
LBUD9:
        mvn     r0, #0x19
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBUD10:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


