        .text
        .align  4
        .globl  _ippsAutoCorr_16s32s


_ippsAutoCorr_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        cmp     r0, #0
        beq     LDTK8
        cmp     r2, #0
        beq     LDTK8
        cmp     r1, #0
        ble     LDTK7
        cmp     r3, #0
        ble     LDTK7
        cmp     r3, #0
        ble     LDTK5
        mov     r12, #0
LDTK0:
        sub     r8, r1, r12
        cmp     r8, #0
        movle   r9, #0
        ble     LDTK4
        cmp     r8, #6
        blt     LDTK6
        mov     r4, #0
        add     lr, r0, r12, lsl #1
        mov     r9, r4
        sub     r7, r8, #6
        mov     r6, lr
        mov     r5, r0
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDTK1:
        ldrsh   r0, [r6]
        ldrsh   r1, [r5]
        ldrsh   r2, [r5, #2]
        ldrsh   r3, [r6, #4]
        ldrsh   r10, [r6, #6]
        mla     r0, r1, r0, r9
        ldrsh   r1, [r6, #2]
        ldrsh   r9, [r5, #4]
        add     r4, r4, #5
        cmp     r4, r7
        mla     r11, r2, r1, r0
        ldrsh   r2, [r5, #6]
        ldrsh   r0, [r6, #8]
        ldrsh   r1, [r5, #8]
        add     r6, r6, #0xA
        mla     r11, r9, r3, r11
        add     r5, r5, #0xA
        mla     r11, r2, r10, r11
        mla     r9, r1, r0, r11
        ble     LDTK1
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDTK2:
        mov     r6, r4, lsl #1
        add     r5, r0, r4, lsl #1
LDTK3:
        ldrsh   r10, [lr, +r6]
        ldrsh   r7, [r5], #2
        add     r4, r4, #1
        add     r6, r6, #2
        mla     r9, r7, r10, r9
        cmp     r4, r8
        blt     LDTK3
LDTK4:
        add     r12, r12, #1
        str     r9, [r2], #4
        cmp     r12, r3
        blt     LDTK0
LDTK5:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDTK6:
        mov     r4, #0
        mov     r9, r4
        add     lr, r0, r12, lsl #1
        b       LDTK2
LDTK7:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDTK8:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


