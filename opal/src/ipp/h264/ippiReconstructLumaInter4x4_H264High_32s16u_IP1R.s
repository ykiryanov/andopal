        .text
        .align  4
        .globl  _ippiReconstructLumaInter4x4_H264High_32s16u_IP1R


_ippiReconstructLumaInter4x4_H264High_32s16u_IP1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        cmp     r0, #0
        beq     LKVY17
        ldr     r1, [r0]
        cmp     r1, #0
        beq     LKVY17
        ldr     r2, [r0, #4]
        cmp     r2, #0
        beq     LKVY17
        ldr     r1, [r1]
        cmp     r1, #0
        beq     LKVY17
        ldr     r1, [r0, #0x14]
        cmp     r1, #0
        beq     LKVY17
        ldr     lr, [r0, #8]
        cmp     lr, #0
        ble     LKVY16
        ldr     r1, [r0, #0x10]
        cmp     r1, #0
        blt     LKVY14
        ldr     r3, [r0, #0x1C]
        add     r12, r3, r3, lsl #2
        add     r12, r3, r12
        add     r3, r12, #3
        cmp     r1, r3
        bgt     LKVY14
        ldr     r3, [r0, #0xC]
        ldr     r1, [pc, #0x738]
        tst     r3, r1
        bne     LKVY0
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LKVY0:
        ldr     r12, [pc, #0x724]
        mov     r8, #0
        add     r7, sp, #0x40
        add     r6, sp, #0x40
        add     r5, sp, #0x40
        add     r4, sp, #0x40
        mov     r1, #2
        mov     r9, #1
        str     r8, [sp]
        str     r2, [sp, #4]
LKVY1:
        tst     r3, r1
        beq     LKVY13
        ldr     r3, [r0]
        add     r12, sp, #0x40
        ldr     r2, [r3]
        str     r2, [r12]
        add     r12, r2, #0x40
        str     r12, [r3]
        ldr     r3, [r0, #0x18]
        add     r12, sp, #0x40
        cmp     r3, #0
        add     r3, r2, #0x10
        str     r3, [r12, #4]
        add     r3, r2, #0x20
        add     r12, sp, #0x40
        str     r3, [r12, #8]
        add     r3, r2, #0x30
        add     r12, sp, #0x40
        str     r3, [r12, #0xC]
        ldreq   r3, [r0, #0x10]
        beq     LKVY2
        ldr     r3, [r0, #0x10]
        cmp     r3, #0
        ble     LKVY7
LKVY2:
        ldr     r12, [pc, #0x6A0]
        smull   r12, lr, r3, r12
        sub     r12, lr, r3, asr #31
        cmp     r12, #4
        blt     LKVY4
        sub     r3, r12, #4
        mov     r12, #0
        mov     lr, r2
        mov     r4, #0x10
LKVY3:
        ldr     r6, [r0, #0x14]
        ldr     r5, [lr]
        subs    r4, r4, #1
        ldrsh   r6, [r6, +r12]
        add     r12, r12, #2
        mul     r6, r5, r6
        mov     r5, r6, lsl r3
        str     r5, [lr], #4
        bne     LKVY3
        b       LKVY6
LKVY4:
        rsb     lr, r12, #3
        mov     r3, #1
        mov     r3, r3, lsl lr
        rsb     r12, r12, #4
        mov     lr, #0
        mov     r4, r2
        mov     r5, #0x10
LKVY5:
        ldr     r7, [r0, #0x14]
        ldr     r6, [r4]
        subs    r5, r5, #1
        ldrsh   r7, [r7, +lr]
        add     lr, lr, #2
        mla     r7, r6, r7, r3
        mov     r6, r7, asr r12
        str     r6, [r4], #4
        bne     LKVY5
LKVY6:
        add     r7, sp, #0x40
        ldr     r6, [r7]
        ldr     r12, [r7, #4]
        ldr     r3, [r7, #8]
        ldr     lr, [r6, #8]
        ldr     r9, [r6]
        ldr     r5, [r6, #0xC]
        ldr     r4, [r6, #4]
        ldr     r7, [r7, #0xC]
        add     r8, r9, lr
        sub     lr, r9, lr
        rsb     r9, r5, r4, asr #1
        add     r10, r4, r5, asr #1
        add     r5, lr, r9
        add     r4, r8, r10
        sub     lr, lr, r9
        sub     r8, r8, r10
        str     r5, [r6, #4]
        str     r4, [r6]
        str     lr, [r6, #8]
        str     r8, [r6, #0xC]
        ldr     r5, [r12]
        ldr     r4, [r12, #8]
        ldr     r8, [r12, #0xC]
        ldr     r6, [r12, #4]
        add     lr, r5, r4
        sub     r4, r5, r4
        rsb     r5, r8, r6, asr #1
        add     r9, r6, r8, asr #1
        add     r6, lr, r9
        add     r8, r4, r5
        str     r8, [r12, #4]
        sub     r4, r4, r5
        str     r4, [r12, #8]
        sub     lr, lr, r9
        str     lr, [r12, #0xC]
        str     r6, [r12]
        ldr     lr, [r3, #8]
        ldr     r4, [r3]
        ldr     r5, [r3, #4]
        ldr     r6, [r3, #0xC]
        add     r12, r4, lr
        sub     lr, r4, lr
        rsb     r4, r6, r5, asr #1
        add     r8, r5, r6, asr #1
        add     r6, lr, r4
        add     r5, r12, r8
        str     r6, [r3, #4]
        sub     r12, r12, r8
        str     r12, [r3, #0xC]
        sub     lr, lr, r4
        str     lr, [r3, #8]
        str     r5, [r3]
        ldr     lr, [r7]
        ldr     r12, [r7, #8]
        ldr     r4, [r7, #4]
        ldr     r5, [r7, #0xC]
        add     r3, lr, r12
        sub     r12, lr, r12
        rsb     lr, r5, r4, asr #1
        add     r6, r4, r5, asr #1
        add     r5, r12, lr
        str     r5, [r7, #4]
        add     r4, r3, r6
        sub     r3, r3, r6
        str     r4, [r7]
        sub     r12, r12, lr
        str     r3, [r7, #0xC]
        str     r12, [r7, #8]
        ldr     lr, [r2, #4]
        ldr     r6, [r2, #0x34]
        ldr     r9, [r2, #0x18]
        ldr     r3, [r2]
        ldr     r8, [r2, #0x28]
        ldr     r12, [r2, #0x10]
        ldr     r10, [r2, #0x30]
        ldr     r11, [r2, #0x20]
        ldr     r5, [r2, #0x14]
        ldr     r7, [r2, #8]
        ldr     r4, [r2, #0x24]
        str     r9, [sp, #8]
        ldr     r9, [r2, #0x38]
        str     r9, [sp, #0xC]
        ldr     r9, [r2, #0xC]
        str     r9, [sp, #0x10]
        ldr     r9, [r2, #0x2C]
        str     r9, [sp, #0x14]
        ldr     r9, [r2, #0x1C]
        str     r9, [sp, #0x18]
        ldr     r9, [r2, #0x3C]
        str     r9, [sp, #0x1C]
        add     r9, r3, r11
        sub     r3, r3, r11
        str     r3, [sp, #0x20]
        rsb     r3, r10, r12, asr #1
        str     r3, [sp, #0x24]
        ldr     r11, [sp, #0x24]
        add     r3, r12, r10, asr #1
        add     r12, lr, r4
        sub     lr, lr, r4
        str     lr, [sp, #0x28]
        rsb     lr, r6, r5, asr #1
        str     lr, [sp, #0x2C]
        ldr     r10, [sp, #0x1C]
        add     r6, r5, r6, asr #1
        ldr     r5, [sp, #8]
        add     lr, r7, r8
        sub     r7, r7, r8
        str     r7, [sp, #0x30]
        ldr     r7, [sp, #0xC]
        rsb     r4, r7, r5, asr #1
        str     r4, [sp, #0x34]
        add     r7, r5, r7, asr #1
        ldr     r4, [sp, #0x14]
        str     r7, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        add     r5, r7, r4
        sub     r7, r7, r4
        ldr     r4, [sp, #0x18]
        rsb     r8, r10, r4, asr #1
        add     r4, r4, r10, asr #1
        add     r10, r9, r3
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        sub     r9, r9, r3
        add     r3, r12, r6
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x28]
        add     r11, r10, r11
        ldr     r10, [sp, #0x24]
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x20]
        str     r9, [sp, #0x20]
        ldr     r9, [sp, #0x2C]
        sub     r12, r12, r6
        sub     r11, r11, r10
        str     r11, [sp, #0x24]
        add     r9, r3, r9
        str     r9, [sp, #0x10]
        ldr     r3, [sp, #0x2C]
        ldr     r9, [sp, #0x28]
        str     r12, [sp, #0x28]
        ldr     r12, [sp, #0x34]
        sub     r10, r5, r4
        sub     r9, r9, r3
        ldr     r3, [sp, #0xC]
        str     r9, [sp, #0x2C]
        add     r10, r10, #0x20
        add     r3, lr, r3
        str     r3, [sp, #8]
        ldr     r3, [sp, #0x30]
        ldr     r11, [sp, #8]
        add     r12, r3, r12
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        add     r11, r11, #0x20
        sub     r12, r12, r3
        ldr     r3, [sp, #0xC]
        str     r12, [sp, #0x34]
        ldr     r12, [sp, #0x28]
        sub     lr, lr, r3
        str     lr, [sp, #0x30]
        add     r3, r5, r4
        str     r3, [sp, #0xC]
        add     r3, r7, r8
        str     r3, [sp, #0x3C]
        ldr     r3, [sp, #0x1C]
        sub     lr, r7, r8
        add     r12, r12, #0x20
        add     r4, r3, #0x20
        ldr     r3, [sp, #0x18]
        add     lr, lr, #0x20
        mov     r4, r4, asr #6
        str     r4, [sp, #0x1C]
        add     r6, r3, #0x20
        ldr     r3, [sp, #0x24]
        str     lr, [sp, #0x24]
        mov     r6, r6, asr #6
        add     r7, r3, #0x20
        ldr     r3, [sp, #0x20]
        str     r10, [sp, #0x20]
        ldr     r10, [sp, #0x20]
        add     r8, r3, #0x20
        ldr     r3, [sp, #0x14]
        str     r6, [sp, #0x18]
        mov     r7, r7, asr #6
        str     r7, [sp, #0x14]
        add     r9, r3, #0x20
        ldr     r3, [sp, #0x10]
        mov     r8, r8, asr #6
        str     r8, [sp, #0x10]
        add     r5, r3, #0x20
        ldr     r3, [sp, #0x2C]
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x38]
        add     r3, r3, #0x20
        mov     r4, r9, asr #6
        add     r11, r11, #0x20
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x34]
        ldr     r6, [sp, #0x38]
        ldr     r9, [sp, #0x24]
        add     r11, r11, #0x20
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x30]
        mov     lr, r5, asr #6
        ldr     r5, [sp, #0x2C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0xC]
        mov     r6, r6, asr #6
        str     r6, [sp, #0x38]
        add     r11, r11, #0x20
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x3C]
        ldr     r6, [sp, #0x34]
        ldr     r7, [sp, #0x28]
        add     r11, r11, #0x20
        str     r11, [sp, #0x3C]
        mov     r6, r6, asr #6
        ldr     r11, [sp, #0x1C]
        str     r6, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        ldr     r8, [sp, #0x3C]
        str     r11, [r2]
        ldr     r11, [sp, #0x18]
        mov     r3, r3, asr #6
        mov     r12, r12, asr #6
        mov     r5, r5, asr #6
        str     r11, [r2, #0x10]
        ldr     r11, [sp, #0x14]
        mov     r6, r6, asr #6
        mov     r7, r7, asr #6
        str     r11, [r2, #0x20]
        ldr     r11, [sp, #0x10]
        str     r3, [r2, #0x24]
        str     r4, [r2, #4]
        str     r11, [r2, #0x30]
        str     lr, [r2, #0x14]
        str     r12, [r2, #0x34]
        str     r5, [r2, #8]
        ldr     r3, [sp, #0x38]
        mov     r8, r8, asr #6
        mov     r9, r9, asr #6
        str     r3, [r2, #0x18]
        ldr     r3, [sp, #0x34]
        mov     r10, r10, asr #6
        str     r6, [r2, #0x38]
        str     r3, [r2, #0x28]
        str     r7, [r2, #0xC]
        str     r8, [r2, #0x1C]
        str     r9, [r2, #0x2C]
        str     r10, [r2, #0x3C]
LKVY7:
        ldr     r2, [sp, #4]
        mov     r3, #0
        mov     r12, #1
LKVY8:
        ldr     r4, [r0, #0x1C]
        ldrh    r5, [r2]
        add     lr, sp, #0x40
        ldr     lr, [lr, +r3, lsl #2]
        mov     r6, r12, lsl r4
        rsb     r4, r6, #1
        sub     r6, r6, #1
        ldr     r7, [lr]
        cmp     r7, r4
        movgt   r4, r7
        cmp     r6, r4
        mov     r7, r4
        movlt   r7, r6
        add     r7, r5, r7
        cmp     r6, r7
        blt     LKVY9
        cmp     r6, r4
        mov     r7, r4
        movlt   r7, r6
        adds    r7, r5, r7
        movmi   r6, #0
        bmi     LKVY9
        cmp     r6, r4
        movlt   r4, r6
        add     r6, r4, r5
LKVY9:
        strh    r6, [r2]
        ldr     r5, [r0, #0x1C]
        ldr     r6, [lr, #4]
        ldrh    r4, [r2, #2]
        mov     r7, r12, lsl r5
        rsb     r5, r7, #1
        cmp     r6, r5
        movgt   r5, r6
        sub     r6, r7, #1
        cmp     r6, r5
        mov     r7, r5
        movlt   r7, r6
        add     r7, r4, r7
        cmp     r6, r7
        blt     LKVY10
        cmp     r6, r5
        mov     r7, r5
        movlt   r7, r6
        adds    r7, r4, r7
        movmi   r6, #0
        bmi     LKVY10
        cmp     r6, r5
        movlt   r5, r6
        add     r6, r4, r5
LKVY10:
        strh    r6, [r2, #2]
        ldr     r5, [r0, #0x1C]
        ldr     r6, [lr, #8]
        ldrh    r4, [r2, #4]
        mov     r7, r12, lsl r5
        rsb     r5, r7, #1
        cmp     r6, r5
        movgt   r5, r6
        sub     r6, r7, #1
        cmp     r6, r5
        mov     r7, r5
        movlt   r7, r6
        add     r7, r4, r7
        cmp     r6, r7
        blt     LKVY11
        cmp     r6, r5
        mov     r7, r5
        movlt   r7, r6
        adds    r7, r4, r7
        movmi   r6, #0
        bmi     LKVY11
        cmp     r6, r5
        movlt   r5, r6
        add     r6, r4, r5
LKVY11:
        strh    r6, [r2, #4]
        ldr     r4, [r0, #0x1C]
        ldr     r5, [lr, #0xC]
        ldrh    lr, [r2, #6]
        mov     r6, r12, lsl r4
        rsb     r4, r6, #1
        cmp     r5, r4
        movgt   r4, r5
        sub     r5, r6, #1
        cmp     r5, r4
        mov     r6, r4
        movlt   r6, r5
        add     r6, lr, r6
        cmp     r5, r6
        blt     LKVY12
        cmp     r5, r4
        mov     r6, r4
        movlt   r6, r5
        adds    r6, lr, r6
        movmi   r5, #0
        bmi     LKVY12
        cmp     r5, r4
        movlt   r4, r5
        add     r5, lr, r4
LKVY12:
        strh    r5, [r2, #6]
        ldr     lr, [r0, #8]
        add     r3, r3, #1
        cmp     r3, #4
        add     r2, r2, lr, lsl #1
        blt     LKVY8
LKVY13:
        ldr     r3, [sp]
        ldr     r12, [pc, #0x6C]
        mov     r1, r1, lsl #1
        mov     r2, r3, lsl #1
        add     r3, r3, #1
        str     r3, [sp]
        cmp     r3, #0x10
        add     r3, r12, r2
        ldrsb   r2, [r12, +r2]
        ldrsb   r3, [r3, #1]
        mla     r2, lr, r3, r2
        ldr     r3, [sp, #4]
        add     r2, r3, r2, lsl #1
        str     r2, [sp, #4]
        ldrcc   r3, [r0, #0xC]
        bcc     LKVY1
        b       LKVY15
LKVY14:
        mvn     r0, #0xA
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LKVY15:
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LKVY16:
        mvn     r0, #0xD
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LKVY17:
        mvn     r0, #7
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
        .long   0x0001fffe
        .long   xyoff
        .long   0x2aaaaaab


