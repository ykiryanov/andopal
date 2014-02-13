        .text
        .align  4
        .globl  _ippsDiv_64f


_ippsDiv_64f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r10, r1
        mov     r9, r2
        mov     r8, r3
        beq     LCHG5
        cmp     r10, #0
        beq     LCHG5
        cmp     r9, #0
        beq     LCHG5
        cmp     r8, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r8, #0
        mov     r6, #0
        movle   r0, r6
        ldmleia sp!, {r4 - r11, pc}
        ldr     r11, [pc, #0xF4]
        ldr     r12, [pc, #0xF4]
LCHG0:
        ldr     r4, [r7]
        ldr     r5, [r7, #4]
        mov     r2, #0
        mov     r0, r4
        mov     r3, #0
        mov     r1, r5
        bl      __nedf2
        cmp     r0, #0
        beq     LCHG2
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        str     r0, [r9]
        str     r1, [r9, #4]
LCHG1:
        subs    r8, r8, #1
        add     r9, r9, #8
        add     r10, r10, #8
        add     r7, r7, #8
        bne     LCHG0
        mov     r0, r6
        ldmia   sp!, {r4 - r11, pc}
LCHG2:
        ldr     r4, [r10]
        ldr     r5, [r10, #4]
        mov     r2, #0
        mov     r0, r4
        mov     r3, #0
        mov     r1, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LCHG3
        ldr     r12, [r11]
        ldr     lr, [r11, #4]
        mov     r6, #6
        str     r12, [r9]
        str     lr, [r9, #4]
        b       LCHG1
LCHG3:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LCHG4
        ldr     lr, [r11, #4]
        ldr     r12, [r11]
        mov     r6, #6
        eor     lr, lr, #2, 2
        str     lr, [r9, #4]
        str     r12, [r9]
        b       LCHG1
LCHG4:
        ldr     lr, [pc, #0x20]
        mov     r6, #6
        ldr     r12, [lr]
        ldr     lr, [lr, #4]
        str     r12, [r9]
        str     lr, [r9, #4]
        b       LCHG1
LCHG5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   ippConstantOfINF_64f
        .long   ippConstantOfNAN_64f


