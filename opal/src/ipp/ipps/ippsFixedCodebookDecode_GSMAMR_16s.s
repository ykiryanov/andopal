        .text
        .align  4
        .globl  _ippsFixedCodebookDecode_GSMAMR_16s


_ippsFixedCodebookDecode_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LDQG16
        cmp     r4, #0
        beq     LDQG16
        cmp     r2, #0
        blt     LDQG0
        cmp     r2, #3
        bgt     LDQG0
        ldr     r7, [pc, #0x950]
        mvn     r12, #0xFF
        cmp     r3, #0
        bic     r9, r12, #0x1F, 24
        bic     r6, r12, #0xF, 24
        mov     r8, #1, 20
        beq     LDQG7
        cmp     r3, #1
        beq     LDQG7
        cmp     r3, #3
        beq     LDQG14
        cmp     r3, #6
        beq     LDQG12
        cmp     r3, #7
        beq     LDQG10
        cmp     r3, #8
        beq     LDQG10
        cmp     r3, #0xB
        beq     LDQG9
        cmp     r3, #0xC
        beq     LDQG1
        cmp     r3, #0x19
        beq     LDQG1
LDQG0:
        mvn     r0, #6
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG1:
        mov     r0, r4
        mov     r1, #0x28
        bl      _ippsZero_16s
        ldrsh   r3, [r5, #0xA]
        ldrsh   r2, [r5]
        and     r3, r3, #7
        mov     r3, r3, lsl #1
        ldrsh   r3, [r7, +r3]
        and     r12, r2, #7
        tst     r2, #8
        add     r3, r3, r3, lsl #2
        mov     r12, r12, lsl #1
        ldrsh   r2, [r7, +r12]
        add     r12, r2, r2, lsl #2
        rsbne   r2, r8, #0
        moveq   r2, #1, 20
        cmp     r3, r12
        mov     r12, r12, lsl #1
        strh    r2, [r4, +r12]
        bge     LDQG2
        rsb     r2, r2, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDQG2:
        mov     r3, r3, lsl #1
        ldrsh   r12, [r4, +r3]
        add     r2, r12, r2
        strh    r2, [r4, +r3]
        ldrsh   r2, [r5, #2]
        ldrsh   r3, [r5, #0xC]
        and     r12, r2, #7
        tst     r2, #8
        mov     r12, r12, lsl #1
        ldrsh   r2, [r7, +r12]
        and     r3, r3, #7
        mov     r3, r3, lsl #1
        ldrsh   r3, [r7, +r3]
        add     r2, r2, r2, lsl #2
        add     r12, r2, #1
        add     r3, r3, r3, lsl #2
        add     r2, r3, #1
        rsbne   r3, r8, #0
        moveq   r3, #1, 20
        cmp     r2, r12
        mov     r12, r12, lsl #1
        strh    r3, [r4, +r12]
        bge     LDQG3
        rsb     r3, r3, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDQG3:
        mov     r2, r2, lsl #1
        ldrsh   r12, [r4, +r2]
        add     r3, r12, r3
        strh    r3, [r4, +r2]
        ldrsh   r2, [r5, #4]
        ldrsh   r3, [r5, #0xE]
        and     r12, r2, #7
        tst     r2, #8
        mov     r12, r12, lsl #1
        ldrsh   r2, [r7, +r12]
        and     r3, r3, #7
        mov     r3, r3, lsl #1
        ldrsh   r3, [r7, +r3]
        add     r2, r2, r2, lsl #2
        add     r12, r2, #2
        add     r3, r3, r3, lsl #2
        add     r2, r3, #2
        rsbne   r3, r8, #0
        moveq   r3, #1, 20
        cmp     r2, r12
        mov     r12, r12, lsl #1
        strh    r3, [r4, +r12]
        bge     LDQG4
        rsb     r3, r3, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDQG4:
        mov     r2, r2, lsl #1
        ldrsh   r12, [r4, +r2]
        add     r3, r12, r3
        strh    r3, [r4, +r2]
        ldrsh   r2, [r5, #6]
        ldrsh   r3, [r5, #0x10]
        and     r12, r2, #7
        tst     r2, #8
        mov     r12, r12, lsl #1
        ldrsh   r2, [r7, +r12]
        and     r3, r3, #7
        mov     r3, r3, lsl #1
        ldrsh   r12, [r7, +r3]
        add     r2, r2, r2, lsl #2
        add     r3, r2, #3
        add     r12, r12, r12, lsl #2
        add     r2, r12, #3
        rsbne   r8, r8, #0
        moveq   r8, #1, 20
        cmp     r2, r3
        mov     r3, r3, lsl #1
        strh    r8, [r4, +r3]
        bge     LDQG5
        rsb     r8, r8, #0
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
LDQG5:
        mov     r2, r2, lsl #1
        ldrsh   r3, [r4, +r2]
        add     r8, r3, r8
        strh    r8, [r4, +r2]
        ldrsh   r2, [r5, #8]
        ldrsh   r5, [r5, #0x12]
        and     r3, r2, #7
        tst     r2, #8
        mov     r3, r3, lsl #1
        ldrsh   r2, [r7, +r3]
        and     r5, r5, #7
        mov     r5, r5, lsl #1
        ldrsh   r7, [r7, +r5]
        add     r2, r2, r2, lsl #2
        add     r3, r2, #4
        add     r7, r7, r7, lsl #2
        add     r2, r7, #4
        moveq   r6, #1, 20
        cmp     r2, r3
        mov     r3, r3, lsl #1
        strh    r6, [r4, +r3]
        bge     LDQG6
        rsb     r6, r6, #0
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDQG6:
        mov     r2, r2, lsl #1
        ldrsh   r3, [r4, +r2]
        add     r6, r3, r6
        strh    r6, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG7:
        ldrsh   r3, [r5]
        ldrsh   r5, [r5, #2]
        add     r12, sp, #0x24
        and     r10, r3, #0x40
        add     r7, r7, #0x10
        add     lr, sp, #0x24
        mov     r10, r10, asr #3
        add     r2, r10, r2, lsl #1
        and     r11, r3, #0x38
        mov     r1, #0x28
        mov     r10, r2, lsl #1
        ldrsh   r2, [r7, +r10]
        add     r10, r7, r10
        ldrsh   r7, [r10, #2]
        and     r10, r3, #7
        mov     r3, r11, asr #3
        add     r10, r10, r10, lsl #2
        add     r10, r2, r10
        add     r3, r3, r3, lsl #2
        add     r3, r7, r3
        str     r3, [lr, #4]
        str     r10, [r12]
        mov     r0, r4
        bl      _ippsZero_16s
        add     r2, sp, #0x24
        ldr     r3, [r2]
        tst     r5, #1
        mov     r5, r5, asr #1
        mov     r3, r3, lsl #1
        subeq   r8, r8, #3, 20
        mvnne   r8, r9
        strh    r8, [r4, +r3]
        ldr     r2, [r2, #4]
        tst     r5, #1
        mov     r2, r2, lsl #1
        moveq   r6, r6, lsl #1
        streqh  r6, [r4, +r2]
        beq     LDQG8
        mvn     r9, r9
        strh    r9, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG8:
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG9:
        mov     r1, r4
        mov     r0, r5
        bl      LDQG_ownDecode8i40_31bits
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG10:
        ldrsh   r11, [r5]
        ldrsh   r5, [r5, #2]
        add     r10, sp, #0x14
        and     r2, r11, #7
        add     r0, sp, #0x14
        add     r1, sp, #0x14
        mov     r2, r2, lsl #1
        ldrsh   lr, [r7, +r2]
        mov     r2, r11, asr #10
        and     r2, r2, #7
        mov     r3, r11, asr #6
        and     r3, r3, #7
        mov     r2, r2, lsl #1
        ldrsh   r12, [r7, +r2]
        mov     r2, r11, asr #3
        and     r2, r2, #7
        add     lr, lr, lr, lsl #2
        mov     r2, r2, lsl #1
        ldrsh   r2, [r7, +r2]
        mov     r3, r3, lsl #1
        ldrsh   r7, [r7, +r3]
        add     r2, r2, r2, lsl #2
        str     lr, [r10]
        mov     r11, r11, asr #9
        add     r12, r12, r12, lsl #2
        add     r2, r2, #1
        and     r3, r11, #1
        add     r7, r7, r7, lsl #2
        add     r12, r3, r12
        str     r2, [r0, #4]
        add     r7, r7, #2
        str     r7, [r1, #8]
        add     r2, sp, #0x14
        add     r12, r12, #3
        str     r12, [r2, #0xC]
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsZero_16s
        add     r2, sp, #0x14
        ldr     r12, [r2]
        tst     r5, #1
        mov     r3, r5, asr #1
        mov     r12, r12, lsl #1
        subeq   lr, r8, #3, 20
        mvnne   lr, r9
        strh    lr, [r4, +r12]
        ldr     r12, [r2, #4]
        tst     r3, #1
        mov     r3, r5, asr #2
        mov     r12, r12, lsl #1
        subeq   lr, r8, #3, 20
        mvnne   lr, r9
        strh    lr, [r4, +r12]
        ldr     r12, [r2, #8]
        tst     r3, #1
        mov     r5, r5, asr #3
        mov     r12, r12, lsl #1
        subeq   r8, r8, #3, 20
        mvnne   r8, r9
        strh    r8, [r4, +r12]
        ldr     r2, [r2, #0xC]
        tst     r5, #1
        mov     r2, r2, lsl #1
        beq     LDQG11
        mvn     r9, r9
        strh    r9, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG11:
        mov     r6, r6, lsl #1
        strh    r6, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG12:
        ldrsh   r11, [r5]
        ldrsh   r5, [r5, #2]
        mov     r10, sp
        mov     r2, r11, asr #4
        mov     r0, r11, asr #3
        mov     r3, r11, asr #8
        and     r7, r11, #7
        and     r2, r2, #7
        and     r0, r0, #1
        mov     r11, r11, asr #7
        and     r3, r3, #7
        add     r2, r2, r2, lsl #2
        add     r0, r2, r0, lsl #1
        and     r11, r11, #1
        add     r3, r3, r3, lsl #2
        mov     r12, sp
        add     r11, r3, r11, lsl #1
        add     r0, r0, #1
        str     r0, [r12, #4]
        mov     lr, sp
        add     r11, r11, #2
        str     r11, [lr, #8]
        add     r7, r7, r7, lsl #2
        str     r7, [r10]
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsZero_16s
        mov     r2, sp
        ldr     r12, [r2]
        and     r3, r5, #1
        cmp     r3, #0
        mov     r3, r5, asr #1
        mov     r12, r12, lsl #1
        suble   lr, r8, #3, 20
        mvngt   lr, r9
        strh    lr, [r4, +r12]
        ldr     r12, [r2, #4]
        and     r3, r3, #1
        cmp     r3, #0
        mov     r5, r5, asr #2
        mov     r12, r12, lsl #1
        suble   r8, r8, #3, 20
        mvngt   r8, r9
        strh    r8, [r4, +r12]
        ldr     r2, [r2, #8]
        and     r5, r5, #1
        cmp     r5, #0
        mov     r2, r2, lsl #1
        ble     LDQG13
        mvn     r9, r9
        strh    r9, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG13:
        mov     r6, r6, lsl #1
        strh    r6, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG14:
        ldrsh   r12, [r5]
        ldrsh   r5, [r5, #2]
        add     r2, sp, #0xC
        mov     r3, r12, asr #1
        and     r6, r3, #7
        and     lr, r12, #1
        add     r3, sp, #0xC
        add     r6, r6, r6, lsl #2
        add     lr, r6, lr, lsl #1
        mov     r6, r12, asr #6
        mov     r7, r12, asr #4
        and     r12, r7, #3
        and     r6, r6, #7
        add     lr, lr, #1
        cmp     r12, #3
        str     lr, [r2]
        add     r6, r6, r6, lsl #2
        addeq   r12, r6, #4
        addne   r12, r6, r12
        str     r12, [r3, #4]
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsZero_16s
        add     r2, sp, #0xC
        ldr     r3, [r2]
        tst     r5, #1
        mov     r5, r5, asr #1
        mov     r3, r3, lsl #1
        subeq   r12, r8, #3, 20
        mvnne   r12, r9
        strh    r12, [r4, +r3]
        ldr     r2, [r2, #4]
        tst     r5, #1
        mov     r2, r2, lsl #1
        beq     LDQG15
        mvn     r9, r9
        strh    r9, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG15:
        rsb     r8, r8, #0
        mov     r8, r8, lsl #1
        strh    r8, [r4, +r2]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG16:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDQG_ownDecode8i40_31bits:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r7, r0
        mov     r4, r1
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsZero_16s
        ldrsh   r9, [r7, #8]
        ldrsh   r2, [r7, #0xA]
        ldrsh   r6, [r7]
        ldrsh   r5, [r7, #2]
        ldrsh   lr, [r7, #4]
        ldrsh   r12, [r7, #6]
        add     r8, sp, #0x34
        mov     r3, r9, asr #3
        cmp     r3, #0x7C
        str     r12, [sp]
        ldrsh   r7, [r7, #0xC]
        str     r7, [sp, #4]
        strh    r12, [r8, #6]
        mov     r12, #0x7C
        mov     r7, r12
        movlt   r7, r3
        mov     r3, r2, asr #3
        cmp     r3, #0x7C
        movlt   r12, r3
        add     r3, r7, r7, lsl #2
        strh    r6, [r8]
        add     r3, r7, r3, lsl #3
        strh    r5, [r8, #2]
        strh    lr, [r8, #4]
        and     r8, r9, #7
        rsb     r3, r7, r3, lsl #5
        add     r9, r12, r12, lsl #2
        mov     r3, r3, asr #15
        add     r9, r12, r9, lsl #3
        rsb     r10, r3, r3, lsl #2
        rsb     r9, r12, r9, lsl #5
        add     r10, r3, r10, lsl #3
        rsb     r7, r10, r7
        mov     r10, #0x9A
        orr     r10, r10, #0x19, 24
        mul     r11, r7, r10
        mov     r9, r9, asr #15
        str     r9, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r0, [sp, #8]
        mov     r11, r11, asr #15
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #8]
        mov     r9, r9, asr #2
        rsb     r1, r0, r0, lsl #2
        and     r2, r2, #7
        rsb     r0, r9, r9, lsl #2
        add     r1, r11, r1, lsl #3
        ldr     r11, [sp, #0xC]
        rsb     r12, r1, r12
        str     r12, [sp, #0x10]
        mul     r12, r12, r10
        add     r0, r9, r0, lsl #3
        add     r9, r0, #0xC
        add     r11, r11, r11, lsl #2
        bic     r0, r2, #3
        mov     r9, r9, asr #5
        mul     r10, r9, r10
        str     r0, [sp, #0x18]
        rsb     r11, r11, r7
        ldr     r7, [sp, #0x18]
        str     r9, [sp, #0x14]
        bic     r9, r8, #3
        mov     r12, r12, asr #15
        sub     r7, r2, r7
        sub     r9, r8, r9
        str     r7, [sp, #0x18]
        and     r1, r9, #1
        mov     r7, r10, asr #15
        add     r11, r1, r11, lsl #1
        add     r10, sp, #0x24
        strh    r11, [r10]
        mov     r8, r8, asr #2
        str     r8, [sp, #0x20]
        ldr     r8, [sp, #0x10]
        mov     r9, r9, asr #1
        str     r9, [sp, #0x1C]
        add     r0, r12, r12, lsl #2
        rsb     r9, r0, r8
        ldr     r8, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r1, [sp, #0xC]
        and     r10, r8, #1
        mov     r8, r8, asr #1
        add     r11, r11, r1, lsl #1
        ldr     r1, [sp, #0x20]
        add     r12, r8, r12, lsl #1
        ldr     r8, [sp, #8]
        add     r9, r10, r9, lsl #1
        add     r3, r1, r3, lsl #1
        add     r10, sp, #0x24
        strh    r3, [r10, #2]
        mov     r2, r2, asr #2
        add     r3, sp, #0x24
        add     r2, r2, r8, lsl #1
        strh    r2, [r3, #0xA]
        strh    r9, [r3, #4]
        strh    r12, [r3, #0xC]
        strh    r11, [r10, #8]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x14]
        and     r0, r7, #1
        add     r8, r7, r7, lsl #2
        cmp     r0, #1
        and     r2, r2, #3
        rsb     r8, r8, r3
        rsbeq   r8, r8, #4
        mov     r10, r7, lsl #1
        add     r10, r10, r2, asr #1
        add     r3, sp, #0x24
        ldrsh   r7, [r3, #8]
        cmp     r6, #0
        ldrsh   r6, [r3]
        and     r2, r2, #1
        add     r8, r2, r8, lsl #1
        mvn     r2, #0xFE
        add     r12, sp, #0x24
        add     r9, sp, #0x24
        strh    r10, [r9, #0xE]
        strh    r8, [r12, #6]
        bic     r2, r2, #0x1F, 24
        mov     r6, r6, lsl #2
        mov     r7, r7, lsl #2
        movne   r12, r2
        rsbeq   r12, r2, #0
        cmp     r7, r6
        mov     r6, r6, lsl #1
        strh    r12, [r4, +r6]
        bge     LDQG17
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDQG17:
        mov     r7, r7, lsl #1
        ldrsh   r9, [r4, +r7]
        ldrsh   r8, [r3, #2]
        ldrsh   r6, [r3, #0xA]
        add     r12, r9, r12
        strh    r12, [r4, +r7]
        cmp     r5, #0
        mov     r12, r6, lsl #2
        mov     r8, r8, lsl #2
        add     r6, r8, #1
        add     r5, r12, #1
        movne   r12, r2
        rsbeq   r12, r2, #0
        cmp     r5, r6
        mov     r6, r6, lsl #1
        strh    r12, [r4, +r6]
        bge     LDQG18
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDQG18:
        mov     r6, r5, lsl #1
        ldrsh   r8, [r4, +r6]
        ldrsh   r7, [r3, #4]
        ldrsh   r5, [r3, #0xC]
        add     r12, r8, r12
        strh    r12, [r4, +r6]
        cmp     lr, #0
        mov     r12, r5, lsl #2
        mov     r7, r7, lsl #2
        add     r5, r7, #2
        add     lr, r12, #2
        movne   r12, r2
        rsbeq   r12, r2, #0
        cmp     lr, r5
        mov     r5, r5, lsl #1
        strh    r12, [r4, +r5]
        bge     LDQG19
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDQG19:
        mov     r5, lr, lsl #1
        ldrsh   r6, [r4, +r5]
        ldrsh   lr, [r3, #6]
        ldrsh   r3, [r3, #0xE]
        add     r12, r6, r12
        strh    r12, [r4, +r5]
        ldr     r12, [sp]
        mov     lr, lr, lsl #2
        mov     r3, r3, lsl #2
        cmp     r12, #0
        add     lr, lr, #3
        add     r3, r3, #3
        rsbeq   r2, r2, #0
        cmp     r3, lr
        mov     lr, lr, lsl #1
        strh    r2, [r4, +lr]
        bge     LDQG20
        rsb     r2, r2, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDQG20:
        mov     r3, r3, lsl #1
        ldrsh   r12, [r4, +r3]
        add     r2, r12, r2
        strh    r2, [r4, +r3]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   LDQG_dgray


        .data
        .align  4


LDQG_dgray:
        .byte   0x00,0x00,0x01,0x00,0x03,0x00,0x02,0x00,0x05,0x00,0x06,0x00,0x04,0x00,0x07,0x00
LDQG_startPos:
        .byte   0x00,0x00,0x02,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x03,0x00
        .byte   0x01,0x00,0x03,0x00,0x02,0x00,0x04,0x00,0x01,0x00,0x04,0x00,0x01,0x00,0x04,0x00


