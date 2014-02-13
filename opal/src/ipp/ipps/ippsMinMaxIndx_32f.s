        .text
        .align  4
        .globl  _ippsMinMaxIndx_32f


_ippsMinMaxIndx_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     lr, [sp, #0x34]
        ldr     r12, [sp, #0x38]
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        beq     LBFT2
        cmp     r2, #0
        beq     LBFT2
        cmp     lr, #0
        beq     LBFT2
        cmp     r3, #0
        beq     LBFT2
        cmp     r12, #0
        beq     LBFT2
        cmp     r5, #0
        ble     LBFT3
        ldr     r7, [r4]
        cmp     r5, #0
        mov     r8, #0
        mov     r6, r7
        movle   r10, r8
        movle   r9, r10
        ble     LBFT1
        mov     r10, r8
        mov     r9, r10
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
LBFT0:
        ldr     r11, [r4], #4
        mov     r0, r7
        mov     r1, r11
        bl      __gtsf2
        cmp     r0, #0
        movgt   r7, r11
        movgt   r9, r8
        mov     r0, r6
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        movlt   r6, r11
        movlt   r10, r8
        add     r8, r8, #1
        cmp     r8, r5
        blt     LBFT0
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LBFT1:
        str     r7, [r2]
        str     r6, [lr]
        str     r9, [r3]
        mov     r0, #0
        str     r10, [r12]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBFT2:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBFT3:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


