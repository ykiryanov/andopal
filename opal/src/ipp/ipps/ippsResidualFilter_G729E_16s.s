        .text
        .align  4
        .globl  _ippsResidualFilter_G729E_16s


_ippsResidualFilter_G729E_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r12, [sp, #0x30]
        mov     r4, r0
        mov     r5, r2
        cmp     r4, #0
        mov     r2, r3
        beq     LDUA8
        cmp     r5, #0
        beq     LDUA8
        cmp     r2, #0
        beq     LDUA8
        cmp     r1, #0
        ble     LDUA7
        cmp     r12, #0
        ble     LDUA7
        cmp     r12, r1
        blt     LDUA7
        cmp     r1, #0xA
        beq     LDUA6
LDUA0:
        cmp     r12, #0
        ble     LDUA5
        mov     lr, #0
        sub     r6, r1, #6
        mov     r10, lr
        sub     r9, r1, #1
        str     r6, [sp, #8]
LDUA1:
        mov     r6, lr, lsl #1
        ldrsh   lr, [r4]
        ldrsh   r7, [r5, +r6]
        cmp     r1, #1
        add     r0, r5, r6
        mul     lr, lr, r7
        blt     LDUA4
        cmp     r9, #6
        movlt   r7, #1
        movlt   r11, r7
        blt     LDUA3
        ldr     r3, [sp, #8]
        mov     r7, #1
        mov     r11, r7
        str     r5, [sp, #4]
        str     r1, [sp]
LDUA2:
        rsb     r5, r7, #0
        add     r1, r11, #1
        mov     r5, r5, lsl #1
        ldrsh   r5, [r0, +r5]
        mov     r7, r7, lsl #1
        ldrsh   r8, [r4, +r7]
        mov     r1, r1, lsl #16
        add     r7, r11, #2
        mov     r1, r1, asr #16
        mla     r8, r8, r5, lr
        rsb     r5, r1, #0
        mov     r1, r1, lsl #1
        ldrsh   lr, [r4, +r1]
        mov     r5, r5, lsl #1
        ldrsh   r5, [r0, +r5]
        mov     r7, r7, lsl #16
        add     r1, r11, #3
        mov     r7, r7, asr #16
        mla     r8, lr, r5, r8
        rsb     lr, r7, #0
        mov     r7, r7, lsl #1
        ldrsh   r5, [r4, +r7]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r0, +lr]
        mov     r7, r1, lsl #16
        add     r1, r11, #4
        mov     r7, r7, asr #16
        mla     r8, r5, lr, r8
        rsb     r5, r7, #0
        mov     r7, r7, lsl #1
        ldrsh   lr, [r4, +r7]
        mov     r5, r5, lsl #1
        ldrsh   r7, [r0, +r5]
        mov     r1, r1, lsl #16
        add     r11, r11, #5
        mov     r5, r1, asr #16
        mla     r8, lr, r7, r8
        rsb     lr, r5, #0
        mov     r5, r5, lsl #1
        mov     lr, lr, lsl #1
        ldrsh   r7, [r4, +r5]
        ldrsh   lr, [r0, +lr]
        mov     r5, r11, lsl #16
        mla     lr, r7, lr, r8
        mov     r7, r5, asr #16
        cmp     r7, r3
        ble     LDUA2
        ldr     r5, [sp, #4]
        ldr     r1, [sp]
LDUA3:
        rsb     r8, r7, #0
        mov     r7, r7, lsl #1
        ldrsh   r3, [r4, +r7]
        mov     r8, r8, lsl #1
        ldrsh   r8, [r0, +r8]
        add     r11, r11, #1
        mov     r7, r11, lsl #16
        mla     lr, r3, r8, lr
        mov     r7, r7, asr #16
        cmp     r7, r1
        ble     LDUA3
LDUA4:
        add     r7, lr, #2, 22
        add     r10, r10, #1
        mov     r7, r7, asr #12
        mov     lr, r10, lsl #16
        strh    r7, [r2, +r6]
        mov     lr, lr, asr #16
        cmp     r12, lr
        bgt     LDUA1
LDUA5:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDUA6:
        cmp     r12, #0x28
        bne     LDUA0
        mov     r0, r5
        mov     r1, r4
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsResidualFilter_G729_16s
LDUA7:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDUA8:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


