        .text
        .align  4
        .globl  ownNoiseEstimateUpdate


ownNoiseEstimateUpdate:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r12, [sp, #0x54]
        ldr     r11, [sp, #0x48]
        ldr     r7, [sp, #0x4C]
        ldr     r10, [sp, #0x50]
        ldr     r9, [sp, #0x58]
        ldr     lr, [sp, #0x5C]
        cmp     r12, #0
        ldr     r12, [sp, #0x60]
        ldr     r5, [sp, #0x64]
        mov     r6, r1
        mov     r4, r0
        mov     r1, r2
        ldreqsh r0, [r11]
        beq     LDOF0
        ldrsh   r8, [r11]
        mov     r0, #5
        cmp     r8, #5
        movgt   r0, r8
        strh    r0, [r11]
LDOF0:
        and     r8, r9, #6, 20
        cmp     r8, #6, 20
        beq     LDOF16
        and     r7, r7, #0x1F, 22
        cmp     r7, #0x1F, 22
        beq     LDOF16
        mov     r7, #0xFF
        orr     r7, r7, #0x7F, 24
        sub     r7, r7, #0x7F
        tst     r10, r7
        moveq   r0, #0x14
        streqh  r0, [r11]
        beq     LDOF5
        cmp     r5, #0
        movle   r7, #0
        ble     LDOF4
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x10]
        ldr     r9, [pc, #0x2C0]
        ldr     r10, [pc, #0x2C0]
        mov     r2, #0
        mov     r7, r2
        mov     r8, r7
        str     r0, [sp]
        str     r12, [sp, #4]
        str     lr, [sp, #8]
        str     r11, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     r1, [sp, #0x1C]
LDOF1:
        mov     r2, r2, lsl #1
        ldrsh   r3, [r4, +r2]
        ldrsh   lr, [r6, +r2]
        cmp     r3, lr
        movle   r12, lr
        movle   lr, r3
        movgt   r12, r3
        cmp     r12, #0xB8
        movlt   r12, #0xB8
        mov     r3, lr
        cmp     r3, #0xB8
        movlt   r3, #0xB8
        movlt   lr, r3
        cmn     r3, #1
        moveq   r11, #0xF
        beq     LDOF3
        cmp     r3, #0
        moveq   r11, #0
        beq     LDOF3
        cmp     r3, #0
        blt     LDOF15
LDOF2:
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r11, lr, asr #8
        movne   r11, r11, lsl #1
        ldrnesh r11, [r9, +r11]
        moveq   lr, lr, lsl #1
        ldreqsh r11, [r10, +lr]
LDOF3:
        mov     r3, r3, lsl r11
        mov     r12, r12, asr #1
        mov     r3, r3, lsl #16
        mov     r0, r12, lsl #15
        mov     r1, r3, asr #16
        bl      __intel_idiv
        rsb     r11, r11, #8
        mov     r0, r0, lsl #16
        add     r8, r8, #1
        mov     r12, r0, asr #16
        add     r11, r7, r12, asr r11
        mov     r3, r8, lsl #16
        mov     r11, r11, lsl #16
        mov     r2, r3, asr #16
        cmp     r5, r2
        mov     r7, r11, asr #16
        bgt     LDOF1
        ldr     r0, [sp]
        ldr     r12, [sp, #4]
        ldr     lr, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
LDOF4:
        cmp     r7, #0xFA, 30
        movgt   r0, #0x14
        strgth  r0, [r11]
        bgt     LDOF5
        tst     r10, #1, 18
        beq     LDOF5
        cmp     r0, #0
        beq     LDOF5
        sub     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        strh    r0, [r11]
LDOF5:
        mov     r7, #0xFF
        cmp     r0, #0x14
        orr     r8, r7, #0x7F, 24
        beq     LDOF6
        tst     r10, #1, 18
        subeq   r8, r8, #1, 18
        beq     LDOF6
        mov     r7, #0x66
        orr     r7, r7, #6, 24
        mov     r8, r7, lsl #1
LDOF6:
        cmp     r5, #0
        ble     LDOF8
        mov     r7, #0
        mov     r0, r7
        str     r3, [sp, #0x18]
        str     r1, [sp, #0x1C]
LDOF7:
        mov     r2, r7, lsl #1
        ldrsh   r3, [r4, +r2]
        ldrsh   r1, [r6, +r2]
        add     r0, r0, #1
        mov     r7, r0, lsl #16
        sub     r3, r3, r1
        mul     r3, r8, r3
        mov     r7, r7, asr #16
        cmp     r5, r7
        add     r3, r3, #1, 18
        add     r3, r1, r3, asr #15
        strh    r3, [r6, +r2]
        bgt     LDOF7
        ldr     r3, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
LDOF8:
        mov     r6, #0x4B
        tst     r10, #0x1E, 22
        orr     r6, r6, #7, 24
        mov     r8, #0
        mov     r7, #2
        bne     LDOF9
        tst     r9, #0x1E, 22
        bne     LDOF9
        cmp     lr, #0
        subeq   lr, r6, #0xE5
        addeq   r6, r6, #0xE6
        beq     LDOF11
LDOF9:
        ldrsh   r11, [r11]
        cmp     r11, #0
        bne     LDOF10
        cmp     lr, #0
        moveq   lr, #0xEB
        orreq   lr, lr, #1, 24
        beq     LDOF11
LDOF10:
        mov     lr, #0xF
        add     lr, lr, #0x77, 30
        add     r6, lr, #0x56, 28
        mov     lr, r8
        sub     r6, r6, #0xE5
        mov     r7, lr
LDOF11:
        cmp     r5, #0
        ble     LDOF14
        mov     r10, r8
        mov     r9, #0x28
        str     r4, [sp, #0x20]
LDOF12:
        mov     r8, r8, lsl #1
        ldrsh   r4, [r1, +r8]
        ldrsh   r0, [r3, +r8]
        sub     r4, r4, r0
        mov     r4, r4, lsl #16
        movs    r11, r4, asr #16
        movmi   r2, r6
        mvnmi   r4, #1
        movpl   r2, lr
        movpl   r4, r7
        mul     r2, r11, r2
        add     r11, r2, #1, 18
        add     r11, r0, r11, asr #15
        add     r4, r11, r4
        mov     r0, r4, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, #0x28
        strlth  r9, [r3, +r8]
        blt     LDOF13
        cmp     r0, r12
        mov     r4, r12
        movlt   r4, r0
        strh    r4, [r3, +r8]
LDOF13:
        add     r10, r10, #1
        mov     r0, r10, lsl #16
        mov     r8, r0, asr #16
        cmp     r5, r8
        bgt     LDOF12
        ldr     r4, [sp, #0x20]
LDOF14:
        mov     r2, r5
        mov     r0, r4
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsCopy_16s
LDOF15:
        mvn     lr, r3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDOF2
LDOF16:
        mov     r0, #0x14
        strh    r0, [r11]
        b       LDOF5
        .long   NormTable
        .long   NormTable2


