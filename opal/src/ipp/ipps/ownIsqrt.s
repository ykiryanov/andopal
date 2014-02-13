        .text
        .align  4
        .globl  _ownIsqrt


_ownIsqrt:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        mov     r1, r0
        str     r0, [sp, #4]
        cmp     r1, #0
        mov     r4, #2, 2
        mov     r0, #0
        mov     r3, r1
        beq     LDET2
        cmn     r1, #1
        moveq   r0, #0x1F
        streq   r4, [sp, #4]
        beq     LDET2
        cmp     r1, #0
        mvnlt   r3, r1
        cmp     r3, #0
        beq     LDET1
        ldr     r2, [pc, #0x20C]
        ldr     r0, [pc, #0x20C]
        movs    r12, r3, lsr #16
        bne     LDET0
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        movs    r12, r3, asr #8
        movne   r3, r12, lsl #1
        movne   r0, r2
        moveq   r3, r3, lsl #1
        ldrsh   r3, [r0, +r3]
        add     r0, r3, #0x10
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDET1
LDET0:
        movs    r3, r3, lsr #24
        movne   r3, r3, lsl #1
        ldrnesh r0, [r2, +r3]
        moveq   r12, r12, lsl #1
        ldreqsh r0, [r0, +r12]
LDET1:
        mov     r1, r1, lsl r0
        str     r1, [sp, #4]
LDET2:
        rsb     r0, r0, #0x1F
        strh    r0, [sp]
        mov     r1, sp
        add     r2, sp, #4
        mov     r0, r2
        bl      LDET__ownIsqrt_n
        ldrsh   r0, [sp]
        ldr     r1, [sp, #4]
        cmp     r0, #0
        rsble   r0, r0, #0
        movle   r0, r1, asr r0
        ble     LDET4
        bic     r0, r0, #0xFF, 8
        bic     r2, r0, #0xFF, 16
        mvn     r0, #2, 2
        cmp     r1, r0, asr r2
        addgt   sp, sp, #8
        ldmgtia sp!, {r4, pc}
        cmp     r1, r4, asr r2
        bge     LDET3
        mov     r0, #2, 2
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDET3:
        mov     r0, r1, lsl r2
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDET4:
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
LDET__ownIsqrt_n:
        stmdb   sp!, {r4 - r6, lr}
        ldr     r3, [r0]
        mvn     r2, #2, 2
        cmp     r3, #0
        ble     LDET11
        ldrsh   lr, [r1]
        and     r12, lr, #1
        cmp     r12, #1
        beq     LDET10
LDET5:
        sub     lr, lr, #1
        mov     lr, lr, asr #1
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        cmn     lr, #2, 18
        moveq   r3, r2, lsl #15
        mvneq   lr, r3
        beq     LDET6
        rsb     lr, lr, #0
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDET6:
        strh    lr, [r1]
        ldr     r1, [r0]
        mvn     r3, #0xFF
        bic     r12, r3, #0x7F, 24
        mov     r3, r1, asr #25
        mov     r1, r1, asr #10
        str     r1, [r0]
        mov     lr, r3, lsl #16
        mvn     r3, r12
        mov     lr, lr, asr #16
        sub     lr, lr, #0x10
        cmp     r3, lr
        and     r3, r1, r3
        mvnlt   r4, r12
        blt     LDET7
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   r4, lr, asr #16
        movlt   r4, r2, lsl #15
LDET7:
        ldr     r5, [pc, #0xB0]
        mov     r6, r4, lsl #1
        mvn     lr, r12
        ldrsh   r1, [r5, +r6]
        add     r4, r5, r4, lsl #1
        mov     r1, r1, lsl #16
        str     r1, [r0]
        ldrsh   r6, [r5, +r6]
        ldrsh   r4, [r4, #2]
        sub     r6, r6, r4
        cmp     lr, r6
        mvnlt   r12, r12
        blt     LDET8
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r12, r6, asr #16
LDET8:
        mul     r12, r3, r12
        cmp     r12, #1, 2
        moveq   r12, r2
        movne   r12, r12, lsl #1
        subs    r3, r1, r12
        mov     r12, r12, asr #31
        rsc     r1, r12, r1, asr #31
        subs    r12, r3, r2
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        movne   r3, r2
        bne     LDET9
        cmp     r3, #2, 2
        mvn     r2, #0
        sbcs    r1, r1, r2
        movlt   r3, #2, 2
LDET9:
        str     r3, [r0]
        ldmia   sp!, {r4 - r6, pc}
LDET10:
        mov     r3, r3, asr #1
        str     r3, [r0]
        ldrsh   lr, [r1]
        b       LDET5
LDET11:
        mov     r3, #0
        strh    r3, [r1]
        str     r2, [r0]
        ldmia   sp!, {r4 - r6, pc}
        .long   NormTable
        .long   NormTable2
        .long   LDET_table_isqrt


        .data
        .align  4


LDET_table_isqrt:
        .byte   0xFF,0x7F,0x2E,0x7C,0xAE,0x78,0x76,0x75,0x7D,0x72,0xBA,0x6F,0x29,0x6D,0xC2,0x6A
        .byte   0x83,0x68,0x66,0x66,0x69,0x64,0x89,0x62,0xC2,0x60,0x13,0x5F,0x7A,0x5D,0xF5,0x5B
        .byte   0x82,0x5A,0x21,0x59,0xCF,0x57,0x8B,0x56,0x55,0x55,0x2C,0x54,0x0F,0x53,0xFC,0x51
        .byte   0xF4,0x50,0xF6,0x4F,0x01,0x4F,0x14,0x4E,0x30,0x4D,0x53,0x4C,0x7E,0x4B,0xAF,0x4A
        .byte   0xE7,0x49,0x25,0x49,0x68,0x48,0xB2,0x47,0x00,0x47,0x54,0x46,0xAD,0x45,0x0A,0x45
        .byte   0x6B,0x44,0xD1,0x43,0x3B,0x43,0xA8,0x42,0x19,0x42,0x8E,0x41,0x06,0x41,0x82,0x40
        .byte   0x00,0x40


