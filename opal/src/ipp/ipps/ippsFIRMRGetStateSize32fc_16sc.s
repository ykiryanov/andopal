        .text
        .align  4
        .globl  _ippsFIRMRGetStateSize32fc_16sc


_ippsFIRMRGetStateSize32fc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #4
        mov     r8, r3
        cmp     r8, #0
        mov     r5, r0
        mov     r4, r1
        mov     r9, r2
        beq     LBXL10
        cmp     r5, #0
        ble     LBXL9
        cmp     r4, #1
        blt     LBXL7
        cmp     r9, #1
        blt     LBXL7
        cmp     r4, #1
        beq     LBXL8
LBXL0:
        add     r12, r5, r4
        sub     r0, r12, #1
        mov     r1, r4
        bl      __intel_idiv
        mov     r10, r0
        mov     r0, r5
        mov     r1, r4
        bl      __intel_imod
        cmp     r0, #0
        str     r5, [sp]
        ble     LBXL2
        ldr     r6, [sp]
LBXL1:
        add     r6, r6, #1
        mov     r0, r6
        mov     r1, r4
        bl      __intel_imod
        cmp     r0, #0
        bgt     LBXL1
        str     r6, [sp]
LBXL2:
        cmp     r10, #0
        mov     r7, #0
        blt     LBXL4
LBXL3:
        add     r7, r7, r9
        cmp     r10, r7
        bge     LBXL3
LBXL4:
        add     r12, r9, r10
        sub     r0, r12, #1
        mov     r1, r9
        bl      __intel_idiv
        mul     r6, r4, r0
        add     r11, r7, #1
        mov     r7, r4, lsl #2
        mov     r1, r7
        mov     r0, r6
        bl      __intel_imod
        cmp     r0, #0
        ble     LBXL6
LBXL5:
        add     r6, r4, r6
        mov     r0, r6
        mov     r1, r7
        bl      __intel_imod
        cmp     r0, #0
        add     r11, r11, r9
        bgt     LBXL5
LBXL6:
        ldr     r2, [sp]
        add     r7, r7, #1
        add     r10, r11, r10
        mov     r2, r2, lsl #4
        mov     r4, r5, lsl #2
        mov     r7, r7, lsl #2
        add     r10, r10, #1
        add     r12, r7, #0xF
        add     r2, r2, #0xF
        mov     lr, r10, lsl #2
        add     r6, r4, #0xF
        add     r4, lr, #0xF
        bic     r12, r12, #0xF
        bic     r2, r2, #0xF
        bic     r4, r4, #0xF
        add     r12, r2, r12
        bic     lr, r6, #0xF
        add     r4, lr, r4
        add     r2, r12, r2
        mov     r5, r5, lsl #3
        add     r4, r2, r4
        add     r5, r5, #0xF
        mov     r2, #0x80
        bic     r5, r5, #0xF
        orr     r2, r2, #2, 18
        add     r0, r4, r5
        add     r2, r0, r2
        mov     r0, #0
        str     r2, [r8]
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LBXL7:
        mvn     r0, #0x1C
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LBXL8:
        cmp     r9, #1
        bne     LBXL0
        mov     r0, r5
        mov     r1, r8
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsFIRGetStateSize32fc_16sc
LBXL9:
        mvn     r0, #0x19
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}
LBXL10:
        mvn     r0, #7
        add     sp, sp, #4
        ldmia   sp!, {r4 - r11, pc}


