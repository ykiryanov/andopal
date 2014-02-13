        .text
        .align  4
        .globl  ownsDecodeSectData_AAC


ownsDecodeSectData_AAC:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     lr, [sp, #0x38]
        ldr     r11, [sp, #0x3C]
        ldr     r10, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        ldr     r9, [sp, #0x48]
        cmp     r3, #2
        mov     r4, r0
        mov     r5, r1
        mov     r7, r2
        moveq   r6, #3
        movne   r6, #5
        mov     r3, #1
        mov     r3, r3, lsl r6
        cmp     lr, #0
        sub     r8, r3, #1
        ble     LGHJ11
        str     r9, [sp, #4]
        str     r10, [sp]
LGHJ0:
        cmp     r7, #0
        mov     r10, #0
        movle   r9, r10
        ble     LGHJ10
        mov     r9, r10
        str     r12, [sp, #8]
        str     lr, [sp, #0xC]
LGHJ1:
        cmp     r10, r7
        bge     LGHJ9
        mov     r0, r4
        mov     r1, r5
        mov     r2, #4
        bl      ownsGetBits_AAC
        strb    r0, [r11], #1
        mov     r0, r4
        mov     r2, r6
        mov     r1, r5
        bl      ownsGetBits_AAC
        cmp     r0, r8
        addne   r9, r9, r0
        bne     LGHJ4
        str     r11, [sp, #0x10]
        mov     r11, r8
        mov     r8, r7
        mov     r7, r0
LGHJ2:
        add     r0, r9, r7
        cmp     r8, r0
        blt     LGHJ3
        mov     r0, r4
        mov     r2, r6
        mov     r1, r5
        bl      ownsGetBits_AAC
        cmp     r0, r11
        add     r7, r0, r7
        beq     LGHJ2
        mov     r0, r7
        mov     r7, r8
        mov     r8, r11
        ldr     r11, [sp, #0x10]
        add     r9, r9, r0
        b       LGHJ4
LGHJ3:
        mov     r9, r0
        mov     r0, r7
        mov     r7, r8
        mov     r8, r11
        ldr     r11, [sp, #0x10]
LGHJ4:
        cmp     r0, #0
        ble     LGHJ8
        cmp     r0, #6
        movlt   r12, #0
        sublt   r3, r11, #1
        blt     LGHJ6
        ldr     r1, [sp, #4]
        mov     r12, #0
        sub     r3, r11, #1
        sub     lr, r0, #6
LGHJ5:
        ldrb    r2, [r11, #-1]
        add     r12, r12, #5
        cmp     r12, lr
        strb    r2, [r1]
        ldrb    r2, [r11, #-1]
        strb    r2, [r1, #1]
        ldrb    r2, [r11, #-1]
        strb    r2, [r1, #2]
        ldrb    r2, [r11, #-1]
        strb    r2, [r1, #3]
        ldrb    r2, [r11, #-1]
        strb    r2, [r1, #4]
        add     r1, r1, #5
        ble     LGHJ5
        str     r1, [sp, #4]
LGHJ6:
        ldr     lr, [sp, #4]
LGHJ7:
        ldrb    r1, [r3]
        add     r12, r12, #1
        cmp     r12, r0
        strb    r1, [lr], #1
        blt     LGHJ7
        str     lr, [sp, #4]
LGHJ8:
        ldr     r3, [sp]
        cmp     r9, r7
        add     r10, r10, #1
        strb    r9, [r3], #1
        str     r3, [sp]
        blt     LGHJ1
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0xC]
        b       LGHJ10
LGHJ9:
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0xC]
LGHJ10:
        cmp     r9, r7
        bne     LGHJ12
        str     r10, [r12], #4
        subs    lr, lr, #1
        bne     LGHJ0
LGHJ11:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LGHJ12:
        mvn     r0, #0x9D
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


