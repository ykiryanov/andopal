        .text
        .align  4
        .globl  _ippsFindNearest_16u


_ippsFindNearest_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #0x30]
        cmp     r0, #0
        beq     LBYJ10
        cmp     r1, #0
        beq     LBYJ10
        cmp     r2, #0
        beq     LBYJ10
        cmp     r12, #0
        beq     LBYJ10
        cmp     r3, #0
        ble     LBYJ9
        cmp     lr, #0
        ble     LBYJ9
        cmp     lr, #2
        mov     r4, #0
        bge     LBYJ1
        cmp     r3, #0
        ble     LBYJ8
LBYJ0:
        ldrh    r0, [r12]
        subs    r3, r3, #1
        strh    r0, [r1], #2
        str     r4, [r2], #4
        bne     LBYJ0
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBYJ1:
        cmp     r3, #0
        ble     LBYJ8
        mov     r5, lr, lsl #1
        sub     r6, r12, #2
        sub     lr, lr, #1
        add     r4, r12, #2
LBYJ2:
        ldrh    r10, [r0], #2
        ldrh    r7, [r12]
        cmp     r10, r7
        ldrleh  r7, [r12]
        movle   r9, #0
        ble     LBYJ7
        ldrh    r7, [r6, +r5]
        cmp     r10, r7
        blt     LBYJ3
        mov     r7, lr, lsl #1
        ldrh    r7, [r12, +r7]
        mov     r9, lr
        b       LBYJ7
LBYJ3:
        cmp     lr, #1
        mov     r8, r12
        mov     r7, lr
        movle   r9, #0
        ble     LBYJ6
        mov     r9, #0
        str     r2, [sp]
        str     r1, [sp, #4]
LBYJ4:
        mov     r1, r7, asr #1
        mov     r11, r1, lsl #1
        ldrh    r2, [r8, +r11]
        add     r11, r8, r11
        cmp     r10, r2
        movlt   r7, r1
        blt     LBYJ5
        sub     r7, r7, r1
        mov     r8, r11
        add     r9, r9, r1
LBYJ5:
        cmp     r7, #1
        bgt     LBYJ4
        ldr     r2, [sp]
        ldr     r1, [sp, #4]
LBYJ6:
        mov     r7, r9, lsl #1
        ldrh    r8, [r4, +r7]
        ldrh    r7, [r12, +r7]
        sub     r8, r8, r10
        sub     r10, r10, r7
        cmp     r10, r8
        ble     LBYJ7
        add     r9, r9, #1
        mov     r7, r9, lsl #1
        ldrh    r7, [r12, +r7]
LBYJ7:
        strh    r7, [r1], #2
        str     r9, [r2], #4
        subs    r3, r3, #1
        bne     LBYJ2
LBYJ8:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBYJ9:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBYJ10:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


