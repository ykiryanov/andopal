        .text
        .align  4
        .globl  _ippsFIR32sc_Direct_16sc_Sfs


_ippsFIR32sc_Direct_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r12, [sp, #0x50]
        ldr     r4, [sp, #0x54]
        ldr     r7, [sp, #0x58]
        ldr     r6, [sp, #0x5C]
        ldr     lr, [sp, #0x60]
        cmp     r0, #0
        beq     LCRG13
        cmp     r1, #0
        beq     LCRG13
        cmp     r2, #0
        ble     LCRG12
        cmp     r3, #0
        beq     LCRG13
        cmp     r12, #0
        ble     LCRG11
        cmp     r7, #0
        beq     LCRG13
        cmp     r6, #0
        beq     LCRG13
        cmp     r2, #0
        sub     r8, r4, lr
        ble     LCRG10
        cmp     r8, #0x1F
        mov     r10, r8
        mov     lr, #0x1F
        movgt   r10, lr
        cmn     r10, #0x1F
        mvn     lr, #0x1E
        movlt   r10, lr
        mvn     lr, #0xFF
        sub     r5, r3, #8
        rsb     r4, r10, #0
        sub     r3, r1, #2
        bic     lr, lr, #0x7F, 24
        sub     r1, r4, #1
        mvn     lr, lr
        add     r9, r7, r12, lsl #2
        mov     r11, #1
        str     r5, [sp]
        str     r1, [sp, #0xC]
        str     r4, [sp, #0x10]
LCRG0:
        ldr     r4, [r6]
        ldrsh   r1, [r0]
        mov     r4, r4, lsl #2
        strh    r1, [r9, +r4]
        ldr     r4, [r6]
        mov     r4, r4, lsl #2
        strh    r1, [r7, +r4]
        ldr     r4, [r6]
        ldrsh   r1, [r0, #2]
        add     r4, r9, r4, lsl #2
        strh    r1, [r4, #2]
        ldr     r4, [r6]
        add     r4, r7, r4, lsl #2
        strh    r1, [r4, #2]
        ldr     r1, [r6]
        add     r5, r1, #1
        cmp     r5, r12
        strlt   r5, [r6]
        blt     LCRG1
        mov     r1, #0
        mov     r5, #0
        str     r1, [r6]
LCRG1:
        cmp     r12, #0
        movle   r4, #0
        movle   r1, r4
        ble     LCRG3
        mov     r1, #0
        mov     r5, r5, lsl #2
        str     r1, [sp, #4]
        str     r5, [sp, #8]
        str     r10, [sp, #0x14]
        str     r9, [sp, #0x18]
        ldr     r9, [sp, #8]
        ldr     r11, [sp, #4]
        ldr     r10, [sp]
        mov     r4, r1
        mov     r5, r7
        str     r8, [sp, #0x1C]
        str     r6, [sp, #0x20]
        str     r7, [sp, #0x24]
        str     r2, [sp, #0x28]
LCRG2:
        sub     r2, r12, r11
        ldr     r7, [r10, +r2, lsl #3]
        add     r6, r5, r9
        ldrsh   r8, [r5, +r9]
        ldrsh   r6, [r6, #2]
        add     r2, r10, r2, lsl #3
        ldr     r2, [r2, #4]
        mla     r1, r7, r8, r1
        mla     r4, r7, r6, r4
        rsb     r7, r2, #0
        add     r11, r11, #1
        cmp     r11, r12
        mla     r1, r7, r6, r1
        mla     r4, r8, r2, r4
        add     r5, r5, #4
        blt     LCRG2
        ldr     r10, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r2, [sp, #0x28]
LCRG3:
        cmp     r8, #0
        beq     LCRG4
        cmp     r10, #0
        movgt   r1, r1, lsl r10
        bgt     LCRG4
        ldr     r5, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        mov     r5, r1, asr r5
        str     r5, [sp, #8]
        mov     r5, #1
        add     r1, r1, r5, lsl r11
        ldr     r5, [sp, #8]
        and     r5, r5, #1
        add     r5, r1, r5
        sub     r1, r5, #1
        ldr     r5, [sp, #0x10]
        mov     r1, r1, asr r5
LCRG4:
        cmp     lr, r1
        blt     LCRG5
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LCRG6
LCRG5:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LCRG6:
        cmp     r8, #0
        strh    r1, [r3, #2]
        beq     LCRG7
        cmp     r10, #0
        movgt   r4, r4, lsl r10
        bgt     LCRG7
        ldr     r1, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        mov     r5, r4, asr r1
        str     r5, [sp, #8]
        mov     r5, #1
        add     r4, r4, r5, lsl r11
        ldr     r5, [sp, #8]
        and     r5, r5, #1
        add     r5, r4, r5
        sub     r4, r5, #1
        mov     r4, r4, asr r1
LCRG7:
        cmp     lr, r4
        blt     LCRG8
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        mvnlt   r1, #0xFF
        biclt   r4, r1, #0x7F, 24
        b       LCRG9
LCRG8:
        mov     r1, #0
        sub     r1, r1, #2, 18
        mvn     r4, r1
LCRG9:
        strh    r4, [r3, #4]!
        subs    r2, r2, #1
        add     r0, r0, #4
        bne     LCRG0
LCRG10:
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCRG11:
        mvn     r0, #0x19
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCRG12:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCRG13:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


