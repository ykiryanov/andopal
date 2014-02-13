        .text
        .align  4
        .globl  _ippsPreemphasize_32f


_ippsPreemphasize_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r9, r0
        cmp     r9, #0
        mov     r10, r1
        mov     r4, r2
        beq     LBAL4
        cmp     r10, #1
        blt     LBAL3
        ldr     r0, [r9]
        mov     r1, r4
        bl      __mulsf3
        sub     r3, r10, #1
        cmp     r3, #1
        mov     r5, r0
        ble     LBAL1
        mov     r8, #1
        add     r7, r9, #4
        add     r6, r9, #8
        str     r3, [sp, #8]
        str     r10, [sp, #4]
        str     r9, [sp]
LBAL0:
        ldr     r9, [r7]
        ldr     r10, [r6]
        mov     r1, r4
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        mov     r11, r0
        mov     r1, r5
        mov     r0, r9
        bl      __subsf3
        mov     r5, r0
        mov     r0, r10
        mov     r1, r4
        bl      __mulsf3
        str     r5, [r7], #8
        str     r11, [r6], #8
        ldr     r3, [sp, #8]
        add     r8, r8, #2
        cmp     r8, r3
        mov     r5, r0
        blt     LBAL0
        ldr     r10, [sp, #4]
        ldr     r9, [sp]
LBAL1:
        tst     r10, #1
        bne     LBAL2
        sub     r9, r9, #4
        ldr     r0, [r9, +r10, lsl #2]
        mov     r1, r5
        bl      __subsf3
        str     r0, [r9, +r10, lsl #2]
LBAL2:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBAL3:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBAL4:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


