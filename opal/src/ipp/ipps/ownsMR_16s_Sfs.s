        .text
        .align  4
        .globl  ownsMR_16s_Sfs


ownsMR_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        ldr     r12, [sp, #0xA4]
        ldr     r6, [sp, #0x98]
        ldr     r4, [sp, #0x9C]
        ldr     lr, [sp, #0xA0]
        str     r12, [sp, #0x18]
        ldr     r12, [sp, #0xA8]
        mov     r7, r2
        cmp     r7, #0
        str     r0, [sp, #0x14]
        mov     r10, r6
        mov     r2, r3
        ble     LBVH30
        cmp     r12, #0x1F
        mov     r5, r12
        mov     r8, #0x1F
        movgt   r5, r8
        cmn     r5, #0x1F
        mvn     r8, #0x1E
        movlt   r5, r8
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
        str     r8, [sp, #4]
        mov     r8, #0
        str     r8, [sp, #8]
        add     r0, r1, #6
        rsb     r11, r5, #0
        add     r9, r1, #2
        add     r8, r1, #4
        str     r0, [sp]
        sub     r0, r11, #1
        str     r8, [sp, #0x5C]
        str     r9, [sp, #0x60]
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x34]
        ldr     r6, [sp, #4]
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        str     r0, [sp, #0xC]
        sub     r0, lr, #6
        str     r0, [sp, #0x10]
        str     r11, [sp, #0x58]
        str     r3, [sp, #0x38]
LBVH0:
        ldr     r3, [r10], #4
        cmp     lr, #0
        add     r0, r3, r4
        movle   r11, #0
        ble     LBVH4
        cmp     lr, #6
        blt     LBVH34
        add     r0, r9, r0, lsl #1
        str     r0, [sp, #0x64]
        str     r0, [sp, #0x50]
        mov     r0, #2
        str     r0, [sp, #0x4C]
        mov     r0, #4
        str     r0, [sp, #0x48]
        mov     r0, #6
        str     r0, [sp, #0x44]
        mov     r3, #0
        mov     r0, #8
        str     r0, [sp, #0x54]
        str     r3, [sp, #0x40]
        str     r1, [sp, #0x1C]
        str     r5, [sp, #0x24]
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r4, [sp, #0x30]
        ldr     r1, [sp, #0x54]
        ldr     r12, [sp, #0x44]
        ldr     r0, [sp, #0x48]
        ldr     r5, [sp, #0x4C]
        ldr     r4, [sp, #0x50]
        ldr     lr, [sp, #0x40]
        mov     r11, r3
        str     r10, [sp, #0x20]
        str     r7, [sp, #8]
LBVH1:
        ldrsh   r9, [r4, #2]
        ldrsh   r7, [r2, +lr]
        ldrsh   r8, [r4]
        ldrsh   r6, [r2, +r5]
        str     r9, [sp, #0x68]
        ldrsh   r9, [r2, +r0]
        mla     r11, r8, r7, r11
        ldr     r10, [sp, #0x68]
        add     lr, lr, #0xA
        str     r9, [sp, #0x6C]
        ldrsh   r7, [r4, #4]
        mla     r11, r10, r6, r11
        add     r5, r5, #0xA
        add     r0, r0, #0xA
        str     r7, [sp, #0x70]
        ldrsh   r6, [r4, #8]
        ldrsh   r7, [r2, +r12]
        ldrsh   r9, [r4, #6]
        ldrsh   r8, [r2, +r1]
        str     r6, [sp, #0x68]
        ldr     r6, [sp, #0x6C]
        ldr     r10, [sp, #0x70]
        add     r4, r4, #0xA
        add     r12, r12, #0xA
        mla     r11, r10, r6, r11
        ldr     r6, [sp, #0x10]
        add     r3, r3, #5
        add     r1, r1, #0xA
        cmp     r3, r6
        mla     r7, r9, r7, r11
        ldr     r6, [sp, #0x68]
        mla     r11, r6, r8, r7
        ble     LBVH1
        ldr     r1, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #0x24]
        ldr     r7, [sp, #8]
        ldr     r12, [sp, #0x28]
        ldr     r8, [sp, #0x18]
        ldr     lr, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x14]
LBVH2:
        mov     r0, r3, lsl #1
        str     r0, [sp, #0x54]
        ldr     r8, [sp, #0x64]
        ldr     r9, [sp, #0x54]
        str     r4, [sp, #0x30]
LBVH3:
        ldrsh   r4, [r2, +r9]
        ldrsh   r0, [r8, +r9]
        add     r3, r3, #1
        cmp     r3, lr
        add     r9, r9, #2
        mla     r11, r0, r4, r11
        blt     LBVH3
        ldr     r8, [sp, #0x18]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x14]
LBVH4:
        cmp     r12, #0
        beq     LBVH5
        cmp     r5, #0
        movgt   r11, r11, lsl r5
        bgt     LBVH5
        ldr     r3, [sp, #0x58]
        ldr     r0, [sp, #0xC]
        mov     r3, r11, asr r3
        str     r3, [sp, #0x70]
        mov     r3, #1
        add     r11, r11, r3, lsl r0
        ldr     r3, [sp, #0x70]
        and     r3, r3, #1
        add     r3, r11, r3
        ldr     r11, [sp, #0x58]
        sub     r3, r3, #1
        mov     r11, r3, asr r11
LBVH5:
        cmp     r6, r11
        blt     LBVH6
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r11, r11, asr #16
        movlt   r3, #0
        sublt   r11, r3, #2, 18
        b       LBVH7
LBVH6:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r11, r3
LBVH7:
        strh    r11, [r1], #8
        ldr     r3, [r10]
        cmp     lr, #0
        add     r2, r2, lr, lsl #1
        add     r0, r4, r3
        movle   r3, #0
        ble     LBVH11
        cmp     lr, #6
        blt     LBVH33
        add     r0, r9, r0, lsl #1
        str     r0, [sp, #0x64]
        str     r2, [sp, #0x4C]
        str     r0, [sp, #0x50]
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x50]
        ldr     lr, [sp, #0x4C]
        ldr     r12, [sp, #0x10]
        mov     r3, #0
        mov     r11, r3
        str     r10, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r7, [sp, #8]
LBVH8:
        ldrsh   r7, [lr]
        ldrsh   r8, [r4]
        ldrsh   r5, [lr, #2]
        ldrsh   r6, [r4, #2]
        ldrsh   r0, [lr, #4]
        mla     r10, r8, r7, r3
        ldrsh   r3, [r4, #4]
        ldrsh   r7, [lr, #6]
        ldrsh   r8, [r4, #6]
        ldrsh   r9, [lr, #8]
        mla     r10, r6, r5, r10
        ldrsh   r5, [r4, #8]
        add     lr, lr, #0xA
        add     r4, r4, #0xA
        add     r11, r11, #5
        mla     r10, r3, r0, r10
        cmp     r11, r12
        mla     r10, r8, r7, r10
        mla     r3, r5, r9, r10
        ble     LBVH8
        ldr     r10, [sp, #0x20]
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #0x24]
        ldr     r7, [sp, #8]
        ldr     r12, [sp, #0x28]
        ldr     r8, [sp, #0x18]
        ldr     lr, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x14]
LBVH9:
        mov     r0, r11, lsl #1
        str     r0, [sp, #0x54]
        add     r0, r2, r11, lsl #1
        str     r0, [sp, #0x50]
        str     r12, [sp, #0x28]
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x64]
        ldr     r12, [sp, #0x50]
        ldr     r0, [sp, #0x54]
LBVH10:
        ldrsh   r8, [r12], #2
        ldrsh   r9, [r4, +r0]
        add     r11, r11, #1
        cmp     r11, lr
        mla     r3, r9, r8, r3
        add     r0, r0, #2
        blt     LBVH10
        ldr     r12, [sp, #0x28]
        ldr     r8, [sp, #0x18]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x14]
LBVH11:
        cmp     r12, #0
        beq     LBVH12
        cmp     r5, #0
        movgt   r3, r3, lsl r5
        bgt     LBVH12
        ldr     r11, [sp, #0x58]
        ldr     r0, [sp, #0xC]
        mov     r11, r3, asr r11
        str     r11, [sp, #0x70]
        mov     r11, #1
        add     r3, r3, r11, lsl r0
        ldr     r11, [sp, #0x70]
        and     r11, r11, #1
        add     r11, r3, r11
        sub     r3, r11, #1
        ldr     r11, [sp, #0x58]
        mov     r3, r3, asr r11
LBVH12:
        cmp     r6, r3
        blt     LBVH13
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LBVH14
LBVH13:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LBVH14:
        ldr     r11, [sp, #0x60]
        cmp     lr, #0
        add     r2, r2, lr, lsl #1
        strh    r3, [r11], #8
        ldr     r3, [r10, #4]
        str     r11, [sp, #0x60]
        add     r0, r4, r3
        movle   r3, #0
        ble     LBVH18
        cmp     lr, #6
        blt     LBVH32
        add     r0, r9, r0, lsl #1
        str     r0, [sp, #0x64]
        str     r2, [sp, #0x50]
        str     r0, [sp, #0x4C]
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x4C]
        ldr     lr, [sp, #0x50]
        ldr     r12, [sp, #0x10]
        mov     r3, #0
        mov     r11, r3
        str     r10, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r7, [sp, #8]
LBVH15:
        ldrsh   r7, [lr]
        ldrsh   r8, [r4]
        ldrsh   r5, [lr, #2]
        ldrsh   r6, [r4, #2]
        ldrsh   r0, [lr, #4]
        mla     r10, r8, r7, r3
        ldrsh   r3, [r4, #4]
        ldrsh   r7, [lr, #6]
        ldrsh   r8, [r4, #6]
        ldrsh   r9, [lr, #8]
        mla     r10, r6, r5, r10
        ldrsh   r5, [r4, #8]
        add     lr, lr, #0xA
        add     r4, r4, #0xA
        add     r11, r11, #5
        mla     r10, r3, r0, r10
        cmp     r11, r12
        mla     r10, r8, r7, r10
        mla     r3, r5, r9, r10
        ble     LBVH15
        ldr     r10, [sp, #0x20]
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #0x24]
        ldr     r7, [sp, #8]
        ldr     r12, [sp, #0x28]
        ldr     r8, [sp, #0x18]
        ldr     lr, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x14]
LBVH16:
        mov     r0, r11, lsl #1
        str     r0, [sp, #0x50]
        add     r0, r2, r11, lsl #1
        str     r0, [sp, #0x54]
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x64]
        ldr     r8, [sp, #0x54]
        ldr     r9, [sp, #0x50]
        str     r12, [sp, #0x28]
LBVH17:
        ldrsh   r12, [r8], #2
        ldrsh   r0, [r4, +r9]
        add     r11, r11, #1
        cmp     r11, lr
        mla     r3, r0, r12, r3
        add     r9, r9, #2
        blt     LBVH17
        ldr     r12, [sp, #0x28]
        ldr     r8, [sp, #0x18]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x14]
LBVH18:
        cmp     r12, #0
        beq     LBVH19
        cmp     r5, #0
        movgt   r3, r3, lsl r5
        bgt     LBVH19
        ldr     r11, [sp, #0x58]
        ldr     r0, [sp, #0xC]
        mov     r11, r3, asr r11
        str     r11, [sp, #0x70]
        mov     r11, #1
        add     r3, r3, r11, lsl r0
        ldr     r11, [sp, #0x70]
        and     r11, r11, #1
        add     r11, r3, r11
        sub     r3, r11, #1
        ldr     r11, [sp, #0x58]
        mov     r3, r3, asr r11
LBVH19:
        cmp     r6, r3
        blt     LBVH20
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LBVH21
LBVH20:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LBVH21:
        ldr     r11, [sp, #0x5C]
        cmp     lr, #0
        add     r2, r2, lr, lsl #1
        strh    r3, [r11], #8
        ldr     r3, [r10, #8]
        str     r11, [sp, #0x5C]
        add     r3, r4, r3
        add     r10, r10, #0xC
        movle   r11, #0
        ble     LBVH25
        cmp     lr, #6
        blt     LBVH31
        add     r3, r9, r3, lsl #1
        str     r3, [sp, #0x64]
        str     r2, [sp, #0x50]
        str     r3, [sp, #0x54]
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x54]
        ldr     lr, [sp, #0x50]
        ldr     r12, [sp, #0x10]
        mov     r11, #0
        mov     r0, r11
        str     r5, [sp, #0x24]
        str     r7, [sp, #8]
        str     r10, [sp, #0x20]
LBVH22:
        ldrsh   r7, [lr]
        ldrsh   r8, [r4]
        ldrsh   r5, [lr, #2]
        ldrsh   r6, [r4, #2]
        ldrsh   r3, [lr, #4]
        mla     r11, r8, r7, r11
        ldrsh   r7, [r4, #4]
        ldrsh   r8, [lr, #6]
        ldrsh   r9, [r4, #6]
        ldrsh   r10, [lr, #8]
        mla     r11, r6, r5, r11
        ldrsh   r5, [r4, #8]
        add     lr, lr, #0xA
        add     r4, r4, #0xA
        add     r0, r0, #5
        mla     r11, r7, r3, r11
        cmp     r0, r12
        mla     r11, r9, r8, r11
        mla     r11, r5, r10, r11
        ble     LBVH22
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #0x24]
        ldr     r7, [sp, #8]
        ldr     r10, [sp, #0x20]
        ldr     r12, [sp, #0x28]
        ldr     r8, [sp, #0x18]
        ldr     lr, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x14]
LBVH23:
        mov     r3, r0, lsl #1
        str     r3, [sp, #0x54]
        add     r3, r2, r0, lsl #1
        str     r3, [sp, #0x50]
        str     r12, [sp, #0x28]
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x64]
        ldr     r12, [sp, #0x50]
        ldr     r3, [sp, #0x54]
LBVH24:
        ldrsh   r8, [r12], #2
        ldrsh   r9, [r4, +r3]
        add     r0, r0, #1
        cmp     r0, lr
        mla     r11, r9, r8, r11
        add     r3, r3, #2
        blt     LBVH24
        ldr     r12, [sp, #0x28]
        ldr     r8, [sp, #0x18]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x14]
LBVH25:
        cmp     r12, #0
        beq     LBVH26
        cmp     r5, #0
        movgt   r11, r11, lsl r5
        bgt     LBVH26
        ldr     r3, [sp, #0x58]
        ldr     r0, [sp, #0xC]
        mov     r3, r11, asr r3
        str     r3, [sp, #0x70]
        mov     r3, #1
        add     r11, r11, r3, lsl r0
        ldr     r3, [sp, #0x70]
        and     r3, r3, #1
        add     r3, r11, r3
        ldr     r11, [sp, #0x58]
        sub     r3, r3, #1
        mov     r11, r3, asr r11
LBVH26:
        cmp     r6, r11
        blt     LBVH27
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r3, r11, asr #16
        mvnlt   r3, #0xFF
        biclt   r3, r3, #0x7F, 24
        b       LBVH28
LBVH27:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mvn     r3, r3
LBVH28:
        ldr     r11, [sp]
        cmp     r10, r8
        add     r2, r2, lr, lsl #1
        strh    r3, [r11], #8
        str     r11, [sp]
        bcc     LBVH29
        ldr     r2, [sp, #0x38]
        ldr     r10, [sp, #0x3C]
        ldr     r3, [r8]
        add     r4, r3, r4
LBVH29:
        ldr     r3, [sp, #0x34]
        add     r7, r7, #4
        cmp     r7, r3
        blt     LBVH0
LBVH30:
        mov     r0, r4
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBVH31:
        mov     r11, #0
        add     r3, r9, r3, lsl #1
        mov     r0, r11
        str     r3, [sp, #0x64]
        b       LBVH23
LBVH32:
        mov     r3, #0
        add     r0, r9, r0, lsl #1
        mov     r11, r3
        str     r0, [sp, #0x64]
        b       LBVH16
LBVH33:
        mov     r3, #0
        add     r0, r9, r0, lsl #1
        mov     r11, r3
        str     r0, [sp, #0x64]
        b       LBVH9
LBVH34:
        mov     r11, #0
        add     r0, r9, r0, lsl #1
        mov     r3, r11
        str     r0, [sp, #0x64]
        b       LBVH2


