        .text
        .align  4
        .globl  _ippsFIR32s_Direct_16s_Sfs


_ippsFIR32s_Direct_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r4, [sp, #0x58]
        ldr     r6, [sp, #0x5C]
        ldr     lr, [sp, #0x60]
        ldr     r12, [sp, #0x64]
        ldr     r5, [sp, #0x68]
        cmp     r0, #0
        beq     LCRI13
        cmp     r1, #0
        beq     LCRI13
        cmp     r2, #0
        ble     LCRI12
        cmp     r3, #0
        beq     LCRI13
        cmp     r4, #0
        ble     LCRI11
        cmp     lr, #0
        beq     LCRI13
        cmp     r12, #0
        beq     LCRI13
        cmp     r2, #0
        sub     r9, r6, r5
        ble     LCRI9
        cmp     r9, #0x1F
        mov     r10, r9
        mov     r5, #0x1F
        movgt   r10, r5
        cmn     r10, #0x1F
        mvn     r5, #0x1E
        movlt   r10, r5
        mvn     r5, #0xFF
        bic     r6, r5, #0x7F, 24
        rsb     r5, r10, #0
        mvn     r8, r6
        sub     r3, r3, #4
        sub     r6, r5, #1
        sub     r7, r4, #5
        add     r11, lr, r4, lsl #1
        str     r7, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r6, [sp, #0x18]
        str     r5, [sp, #0x1C]
LCRI0:
        ldr     r5, [r12]
        ldrsh   r3, [r0], #2
        mov     r5, r5, lsl #1
        strh    r3, [r11, +r5]
        ldr     r5, [r12]
        mov     r5, r5, lsl #1
        strh    r3, [lr, +r5]
        ldr     r3, [r12]
        add     r3, r3, #1
        cmp     r3, r4
        strlt   r3, [r12]
        blt     LCRI1
        mov     r5, #0
        mov     r3, #0
        str     r5, [r12]
LCRI1:
        cmp     r4, #0
        movle   r5, #0
        ble     LCRI5
        cmp     r4, #5
        blt     LCRI10
        str     r12, [sp, #0x2C]
        str     r2, [sp, #4]
        ldr     r2, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        mov     r7, #0
        mov     r5, r7
        mov     r3, r3, lsl #1
        mov     r6, lr
        str     r8, [sp, #0x14]
        str     r10, [sp, #0x20]
        str     r11, [sp, #0x24]
        str     r9, [sp, #0x28]
        str     r1, [sp]
LCRI2:
        sub     r1, r4, r7
        ldr     r11, [r12, +r1, lsl #2]
        ldrsh   r10, [r6, +r3]
        mov     r1, r1, lsl #2
        add     r9, r7, #1
        sub     r8, r1, #4
        mla     r5, r11, r10, r5
        ldr     r8, [r12, +r8]
        add     r9, lr, r9, lsl #1
        ldrsh   r11, [r9, +r3]
        add     r10, r7, #2
        sub     r9, r1, #8
        ldr     r9, [r12, +r9]
        mla     r5, r8, r11, r5
        add     r10, lr, r10, lsl #1
        ldrsh   r8, [r10, +r3]
        add     r10, r7, #3
        sub     r1, r1, #0xC
        mla     r5, r9, r8, r5
        add     r10, lr, r10, lsl #1
        ldrsh   r10, [r10, +r3]
        ldr     r1, [r12, +r1]
        add     r7, r7, #4
        cmp     r7, r2
        add     r6, r6, #8
        mla     r5, r1, r10, r5
        ble     LCRI2
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        ldr     r9, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        ldr     r2, [sp, #4]
        ldr     r1, [sp]
LCRI3:
        str     r2, [sp, #4]
        ldr     r2, [sp, #0x10]
        add     r6, lr, r7, lsl #1
        str     lr, [sp, #8]
        str     r1, [sp]
LCRI4:
        ldrsh   r1, [r3, +r6]
        sub     lr, r4, r7
        ldr     lr, [r2, +lr, lsl #2]
        add     r7, r7, #1
        cmp     r7, r4
        mla     r5, lr, r1, r5
        add     r6, r6, #2
        blt     LCRI4
        ldr     lr, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r1, [sp]
LCRI5:
        cmp     r9, #0
        beq     LCRI6
        cmp     r10, #0
        movgt   r5, r5, lsl r10
        bgt     LCRI6
        ldr     r3, [sp, #0x1C]
        mov     r7, #1
        mov     r6, r5, asr r3
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x18]
        add     r5, r5, r7, lsl r6
        ldr     r6, [sp, #0x30]
        and     r6, r6, #1
        add     r6, r5, r6
        sub     r5, r6, #1
        mov     r5, r5, asr r3
LCRI6:
        cmp     r8, r5
        blt     LCRI7
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        mvnlt   r3, #0xFF
        biclt   r5, r3, #0x7F, 24
        b       LCRI8
LCRI7:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mvn     r5, r3
LCRI8:
        strh    r5, [r1], #2
        subs    r2, r2, #1
        bne     LCRI0
LCRI9:
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRI10:
        mov     r7, #0
        mov     r5, r7
        mov     r3, r3, lsl #1
        b       LCRI3
LCRI11:
        mvn     r0, #0x19
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRI12:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRI13:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}


