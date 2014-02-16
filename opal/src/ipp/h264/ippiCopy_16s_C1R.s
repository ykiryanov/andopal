        .text
        .align  4
        .globl  ippiCopy_16s_C1R


ippiCopy_16s_C1R:
        stmdb   sp!, {r4 - r11, lr}
        ldr     lr, [sp, #0x28]
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        beq     LQBZ7
        cmp     r2, #0
        beq     LQBZ7
        cmp     r12, #0
        ble     LQBZ6
        cmp     lr, #0
        ble     LQBZ6
        cmp     lr, #0
        ble     LQBZ5
        sub     r4, r12, #6
LQBZ0:
        cmp     r12, #0
        ble     LQBZ4
        cmp     r12, #6
        mov     r10, #0
        movlt   r5, r10
        blt     LQBZ2
        mov     r5, r10
        mov     r9, #2
        mov     r8, #4
        mov     r7, #6
        mov     r6, #8
LQBZ1:
        ldrsh   r11, [r0, +r10]
        add     r5, r5, #5
        cmp     r5, r4
        strh    r11, [r2, +r10]
        ldrsh   r11, [r0, +r9]
        add     r10, r10, #0xA
        strh    r11, [r9, +r2]
        ldrsh   r11, [r0, +r8]
        add     r9, r9, #0xA
        strh    r11, [r8, +r2]
        ldrsh   r11, [r0, +r7]
        add     r8, r8, #0xA
        strh    r11, [r7, +r2]
        ldrsh   r11, [r0, +r6]
        add     r7, r7, #0xA
        strh    r11, [r6, +r2]
        add     r6, r6, #0xA
        ble     LQBZ1
LQBZ2:
        mov     r6, r5, lsl #1
LQBZ3:
        ldrsh   r7, [r0, +r6]
        add     r5, r5, #1
        cmp     r5, r12
        strh    r7, [r2, +r6]
        add     r6, r6, #2
        blt     LQBZ3
LQBZ4:
        subs    lr, lr, #1
        add     r0, r1, r0
        add     r2, r3, r2
        bne     LQBZ0
LQBZ5:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LQBZ6:
        mvn     r0, #5
        ldmia   sp!, {r4 - r11, pc}
LQBZ7:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


