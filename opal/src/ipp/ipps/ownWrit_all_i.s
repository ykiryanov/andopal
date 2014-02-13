        .text
        .align  4
        .globl  ownWrit_all_i


ownWrit_all_i:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD8
        ldr     r12, [sp, #0xFC]
        ldr     r11, [sp, #0x100]
        ldr     r9, [sp, #0x104]
        mov     r8, #0
        str     r12, [sp, #0x1C]
        mov     lr, r8
        mov     r12, lr
        mov     r4, r0
        mov     r7, r1
        mov     r6, r2
        mov     r5, r3
        mov     r10, r12
LDNW0:
        add     r0, sp, #0x78
        strh    r12, [r0, +r10]
        add     r0, lr, #1
        add     r10, r10, #0xC
        mov     r2, r0, lsl #16
        add     r1, sp, #0x78
        mov     r2, r2, asr #15
        strh    r12, [r1, +r2]
        add     r2, lr, #2
        add     r0, sp, #0x78
        mov     r2, r2, lsl #16
        add     r1, sp, #0x78
        mov     r2, r2, asr #15
        strh    r12, [r0, +r2]
        add     r2, lr, #3
        add     r0, sp, #0x78
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #15
        strh    r12, [r1, +r2]
        add     r2, lr, #4
        add     r1, sp, #0x78
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #15
        strh    r12, [r0, +r2]
        add     r0, lr, #5
        add     lr, lr, #6
        mov     r0, r0, lsl #16
        cmp     lr, #0x24
        mov     r0, r0, asr #15
        strh    r12, [r1, +r0]
        blt     LDNW0
        add     r12, sp, #0x70
        str     r12, [sp]
        mov     r3, r5
        mov     r2, r6
        mov     r1, r7
        mov     r0, r4
        bl      LDNW__ownInit_pos_i_ovf
        cmp     r4, #0
        ble     LDNW55
        add     r2, r11, #8
        mvn     lr, #0xFF
        str     r2, [sp, #0x14]
        add     r2, r11, #0xA
        mov     r12, #0xFF
        orr     r10, r12, #0x7F, 24
        bic     r0, lr, #0x7F, 24
        add     r1, r11, #6
        str     r2, [sp, #0x18]
        sub     r3, r10, #1, 18
        add     lr, r11, #2
        add     r2, r11, #0xC
        str     r9, [sp, #8]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #8]
        str     lr, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x40]
        add     lr, r11, #4
        add     r2, r11, #0xE
        mvn     r0, r0
        mov     r3, r5
        mov     r12, r8
        sub     r10, r10, #6, 20
        str     r2, [sp, #0x44]
        str     lr, [sp, #0x4C]
        str     r9, [sp, #0x58]
        str     r11, [sp, #0x50]
        str     r7, [sp, #0x34]
        mov     r5, r0
LDNW1:
        ldr     lr, [r1], #4
        cmp     r12, r3
        bgt     LDNW54
        mov     r7, r12
        mov     r9, #0
        str     lr, [sp, #0x3C]
        str     r1, [sp, #8]
        str     r12, [sp, #0x38]
        str     r8, [sp, #0x54]
        str     r3, [sp, #0x64]
LDNW2:
        ldr     r1, [sp, #0x34]
        mov     r12, r7, lsl #1
        ldrsh   r1, [r1, +r12]
        cmp     r1, #0
        ble     LDNW53
        ldr     r3, [sp, #0x54]
        ldrsh   r3, [r6, +r3]
        sub     r3, r3, r9
        cmp     r5, r3
        blt     LDNW3
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNW4
LDNW3:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNW4:
        add     r3, r3, #1
        cmp     r5, r3
        blt     LDNW5
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r11, r3, asr #16
        movlt   r3, #0
        sublt   r11, r3, #2, 18
        b       LDNW6
LDNW5:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r11, r3
LDNW6:
        cmp     r1, #4
        movle   r8, #0
        ble     LDNW12
        sub     r3, r1, #3
        cmp     r5, r3
        blt     LDNW7
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNW8
LDNW7:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNW8:
        mov     r3, r3, lsl #16
        ldr     lr, [sp, #0x40]
        mov     r3, r3, asr #17
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     lr, r3
        blt     LDNW9
        cmn     r3, #1, 18
        movlt   r3, #0
        sublt   r8, r3, #2, 18
        blt     LDNW10
        mov     r3, r3, lsl #1
        mov     r3, r3, lsl #16
        mov     r8, r3, asr #16
        b       LDNW10
LDNW9:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r8, r3
LDNW10:
        sub     r1, r1, r8
        cmp     r5, r1
        blt     LDNW11
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        movlt   r3, #0
        sublt   r1, r3, #2, 18
        b       LDNW12
LDNW11:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r1, r3
LDNW12:
        ldr     lr, [sp, #0x1C]
        add     r3, sp, #0xD4
        add     r2, sp, #0xD0
        ldrh    r12, [lr, +r12]
        str     r12, [sp, #0x60]
        mov     r0, r11
        bl      ownChk_ovf
        ldrsh   r3, [sp, #0xD0]
        add     r9, r9, #2
        mov     r9, r9, asr #2
        cmp     r3, #0
        mov     r9, r9, lsl #16
        mov     r12, r9, asr #16
        ble     LDNW16
        ldr     lr, [sp, #0x60]
        ldr     r9, [sp, #0x3C]
LDNW13:
        sub     r3, r3, #1
        cmp     r5, r3
        blt     LDNW14
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNW15
LDNW14:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNW15:
        mov     r1, r12, lsl #16
        and     r0, lr, #0xF
        mov     r1, r1, asr #15
        cmp     r3, #0
        strh    r0, [r9, +r1]
        mov     lr, lr, asr #4
        add     r12, r12, #1
        bgt     LDNW13
        ldrsh   r3, [sp, #0xD0]
        str     lr, [sp, #0x60]
LDNW16:
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r10, r12
        blt     LDNW17
        cmn     r12, #2, 20
        movlt   r12, #0
        sublt   r9, r12, #2, 18
        blt     LDNW18
        mov     r12, r12, lsl #2
        mov     r12, r12, lsl #16
        mov     r9, r12, asr #16
        b       LDNW18
LDNW17:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r9, r12
LDNW18:
        cmp     r10, r3
        blt     LDNW19
        cmn     r3, #2, 20
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        blt     LDNW20
        mov     r3, r3, lsl #2
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDNW20
LDNW19:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNW20:
        sub     r11, r11, r3
        cmp     r5, r11
        blt     LDNW22
        cmn     r11, #2, 18
        bge     LDNW21
        mov     r3, #0
        sub     r3, r3, #2, 18
        str     r3, [sp, #0x5C]
        b       LDNW23
LDNW21:
        mov     r3, r11, lsl #16
        mov     r3, r3, asr #16
        str     r3, [sp, #0x5C]
        b       LDNW23
LDNW22:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
        str     r3, [sp, #0x5C]
LDNW23:
        ldrsh   r3, [sp, #0xD4]
        mov     lr, r3
        cmp     lr, #0
        ble     LDNW33
        cmp     lr, #0
        ble     LDNW27
        ldr     r0, [sp, #0x60]
        mov     r12, #0
LDNW24:
        sub     r3, r3, #1
        cmp     r5, r3
        blt     LDNW25
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNW26
LDNW25:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNW26:
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        mov     r2, r12, lsl #16
        and     r1, r0, #0xF
        add     r11, sp, #0x78
        mov     r2, r2, asr #15
        cmp     r3, #0
        strh    r1, [r11, +r2]
        mov     r0, r0, asr #4
        add     r12, r12, #1
        bgt     LDNW24
LDNW27:
        cmp     r10, lr
        blt     LDNW28
        cmn     lr, #2, 20
        movlt   r3, #0
        sublt   r2, r3, #2, 18
        blt     LDNW29
        mov     lr, lr, lsl #2
        mov     lr, lr, lsl #16
        mov     r2, lr, asr #16
        b       LDNW29
LDNW28:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r2, r3
LDNW29:
        ldr     r12, [sp, #0x58]
        add     r3, sp, #0x70
        add     r1, sp, #0x78
        str     r12, [sp, #4]
        str     r6, [sp]
        mov     r0, r4
        bl      LDNW__ownWrit_ovf
        ldrsh   r11, [sp, #0xD4]
        cmp     r11, #0
        ble     LDNW33
        cmp     r11, #6
        movlt   r3, #0
        movlt   r12, r3
        blt     LDNW31
        mov     r3, #0
        str     r6, [sp, #0x24]
        mov     r12, r3
        sub     lr, r11, #6
        str     r7, [sp, #0x30]
        str     r10, [sp, #0x2C]
        str     r5, [sp, #0x28]
        str     r4, [sp, #0x20]
        mov     r6, #0
LDNW30:
        mov     r3, r3, lsl #1
        add     r10, sp, #0x78
        strh    r6, [r10, +r3]
        add     r7, r12, #1
        add     r0, sp, #0x78
        mov     r1, r7, lsl #16
        add     r3, r12, #2
        mov     r1, r1, asr #15
        strh    r6, [r0, +r1]
        mov     r3, r3, lsl #16
        add     r2, sp, #0x78
        mov     r0, r3, asr #15
        add     r10, r12, #4
        add     r7, r12, #3
        strh    r6, [r2, +r0]
        add     r12, r12, #5
        mov     r7, r7, lsl #16
        mov     r10, r10, lsl #16
        mov     r0, r12, lsl #16
        add     r5, sp, #0x78
        mov     r2, r7, asr #15
        strh    r6, [r5, +r2]
        mov     r3, r0, asr #16
        add     r4, sp, #0x78
        mov     r10, r10, asr #15
        cmp     r3, lr
        strh    r6, [r4, +r10]
        ble     LDNW30
        ldr     r7, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x24]
        ldr     r4, [sp, #0x20]
LDNW31:
        mov     lr, #0
LDNW32:
        mov     r3, r3, lsl #1
        add     r0, sp, #0x78
        add     r12, r12, #1
        strh    lr, [r0, +r3]
        mov     r3, r12, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, r11
        blt     LDNW32
LDNW33:
        cmp     r8, #0
        ble     LDNW53
        mov     r12, r7, lsl #3
        ldr     lr, [sp, #0x4C]
        mov     r12, r12, lsl #16
        ldr     r11, [sp, #0x10]
        ldr     r2, [sp, #0x44]
        mov     r1, r12, asr #15
        ldr     r12, [sp, #0x50]
        ldrsh   lr, [lr, +r1]
        add     r3, sp, #0xD4
        ldrsh   r0, [r12, +r1]
        ldr     r12, [sp, #0xC]
        add     r9, r9, #2
        mov     r9, r9, asr #2
        ldrsh   r12, [r12, +r1]
        str     lr, [sp, #0x60]
        ldr     lr, [sp, #0x48]
        mov     r9, r9, lsl #16
        ldrsh   lr, [lr, +r1]
        str     lr, [sp, #0x68]
        ldr     lr, [sp, #0x14]
        ldrsh   lr, [lr, +r1]
        str     lr, [sp, #0x6C]
        ldr     lr, [sp, #0x18]
        ldrsh   r11, [r11, +r1]
        ldrsh   lr, [lr, +r1]
        ldrsh   r1, [r2, +r1]
        add     r2, sp, #0xC0
        strh    r0, [r2]
        add     r0, sp, #0xC0
        strh    r12, [r0, #2]
        ldr     r12, [sp, #0x60]
        add     r0, sp, #0xC0
        add     r2, sp, #0xD0
        strh    r12, [r0, #4]
        ldr     r12, [sp, #0x68]
        add     r0, sp, #0xC0
        strh    r12, [r0, #6]
        ldr     r12, [sp, #0x6C]
        add     r0, sp, #0xC0
        strh    r12, [r0, #8]
        add     r12, sp, #0xC0
        strh    lr, [r12, #0xA]
        add     r12, sp, #0xC0
        strh    r11, [r12, #0xC]
        add     r12, sp, #0xC0
        strh    r1, [r12, #0xE]
        ldr     r0, [sp, #0x5C]
        mov     r1, r8
        bl      ownChk_ovf
        ldrsh   r1, [sp, #0xD0]
        mov     r12, r9, asr #16
        cmp     r1, #0
        ble     LDNW57
        str     r4, [sp, #0x20]
        ldr     lr, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        mov     r3, #0
LDNW34:
        sub     r1, r1, #1
        cmp     r5, r1
        blt     LDNW35
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LDNW36
LDNW35:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDNW36:
        add     r0, sp, #0xC0
        mov     r2, r3, lsl #1
        ldrsh   r11, [r0, +r2]
        add     r8, r0, r2
        and     r9, r11, #1
        cmp     r5, r9
        blt     LDNW37
        cmn     r9, #2, 18
        movlt   r9, #0
        sublt   r9, r9, #2, 18
        b       LDNW38
LDNW37:
        mvn     r9, #0xFF
        bic     r9, r9, #0x7F, 24
        mvn     r9, r9
LDNW38:
        mov     r11, r11, asr #1
        cmp     r4, r9
        strh    r11, [r0, +r2]
        blt     LDNW39
        cmn     r9, #1, 18
        movlt   r9, #0
        sublt   r11, r9, #2, 18
        blt     LDNW40
        mov     r9, r9, lsl #1
        mov     r9, r9, lsl #16
        mov     r11, r9, asr #16
        b       LDNW40
LDNW39:
        mvn     r9, #0xFF
        bic     r9, r9, #0x7F, 24
        mvn     r11, r9
LDNW40:
        ldrsh   r9, [r8, #2]
        and     r0, r9, #1
        add     r0, r11, r0
        cmp     r5, r0
        blt     LDNW41
        cmn     r0, #2, 18
        movge   r11, r0, lsl #16
        movge   r11, r11, asr #16
        movlt   r11, #0
        sublt   r11, r11, #2, 18
        b       LDNW42
LDNW41:
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mvn     r11, r11
LDNW42:
        mov     r9, r9, asr #1
        cmp     r4, r11
        strh    r9, [r8, #2]
        blt     LDNW43
        cmn     r11, #1, 18
        movlt   r9, #0
        sublt   r11, r9, #2, 18
        blt     LDNW44
        mov     r11, r11, lsl #1
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        b       LDNW44
LDNW43:
        mvn     r9, #0xFF
        bic     r9, r9, #0x7F, 24
        mvn     r11, r9
LDNW44:
        ldrsh   r9, [r8, #4]
        and     r0, r9, #1
        add     r0, r11, r0
        cmp     r5, r0
        blt     LDNW45
        cmn     r0, #2, 18
        movge   r11, r0, lsl #16
        movge   r11, r11, asr #16
        movlt   r11, #0
        sublt   r11, r11, #2, 18
        b       LDNW46
LDNW45:
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mvn     r11, r11
LDNW46:
        mov     r9, r9, asr #1
        cmp     r4, r11
        strh    r9, [r8, #4]
        blt     LDNW47
        cmn     r11, #1, 18
        movlt   r9, #0
        sublt   r9, r9, #2, 18
        blt     LDNW48
        mov     r11, r11, lsl #1
        mov     r11, r11, lsl #16
        mov     r9, r11, asr #16
        b       LDNW48
LDNW47:
        mvn     r9, #0xFF
        bic     r9, r9, #0x7F, 24
        mvn     r9, r9
LDNW48:
        ldrsh   r11, [r8, #6]
        and     r0, r11, #1
        add     r0, r9, r0
        cmp     r5, r0
        blt     LDNW49
        cmn     r0, #2, 18
        movge   r9, r0, lsl #16
        movge   r9, r9, asr #16
        movlt   r9, #0
        sublt   r9, r9, #2, 18
        b       LDNW50
LDNW49:
        mvn     r9, #0xFF
        bic     r9, r9, #0x7F, 24
        mvn     r9, r9
LDNW50:
        mov     r0, r12, lsl #16
        add     r3, r3, #4
        mov     r11, r11, asr #1
        mov     r0, r0, asr #15
        cmp     r5, r3
        strh    r11, [r8, #6]
        strh    r9, [lr, +r0]
        add     r12, r12, #1
        blt     LDNW51
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r8, r3, asr #16
        movlt   r3, #0
        sublt   r8, r3, #2, 18
        b       LDNW52
LDNW51:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r8, r3
LDNW52:
        ands    r3, r8, #7
        mov     r8, r8, lsr #31
        subne   r3, r3, r8, lsl #3
        cmp     r1, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        bgt     LDNW34
        b       LDNW56
LDNW53:
        ldr     r1, [sp, #0x64]
        add     r7, r4, r7
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
        cmp     r7, r1
        ble     LDNW2
        ldr     r1, [sp, #8]
        ldr     r12, [sp, #0x38]
        ldr     r8, [sp, #0x54]
        ldr     r3, [sp, #0x64]
LDNW54:
        add     r12, r12, #1
        cmp     r12, r4
        add     r8, r8, #2
        blt     LDNW1
LDNW55:
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
LDNW56:
        ldr     r4, [sp, #0x20]
LDNW57:
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r10, r12
        blt     LDNW58
        cmn     r12, #2, 20
        movlt   r1, #0
        sublt   r9, r1, #2, 18
        blt     LDNW59
        mov     r12, r12, lsl #2
        mov     r12, r12, lsl #16
        mov     r9, r12, asr #16
        b       LDNW59
LDNW58:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r9, r1
LDNW59:
        ldrsh   r1, [sp, #0xD4]
        cmp     r1, #0
        ble     LDNW53
        ldrsh   r12, [sp, #0xD0]
        ands    r3, r12, #1
        mov     r12, r12, lsr #31
        subne   r3, r3, r12, lsl #1
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     r10, r3
        blt     LDNW60
        cmn     r3, #2, 20
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        blt     LDNW61
        mov     r3, r3, lsl #2
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDNW61
LDNW60:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNW61:
        cmp     r1, #0
        ble     LDNW81
        ldr     lr, [sp, #0x40]
        mov     r12, #0
        str     r4, [sp, #0x20]
LDNW62:
        sub     r1, r1, #1
        cmp     r5, r1
        blt     LDNW63
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LDNW64
LDNW63:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDNW64:
        add     r0, sp, #0xC0
        mov     r2, r3, lsl #1
        ldrsh   r11, [r0, +r2]
        add     r4, r0, r2
        and     r8, r11, #1
        cmp     r5, r8
        blt     LDNW65
        cmn     r8, #2, 18
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDNW66
LDNW65:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDNW66:
        mov     r11, r11, asr #1
        cmp     lr, r8
        strh    r11, [r0, +r2]
        blt     LDNW67
        cmn     r8, #1, 18
        movlt   r8, #0
        sublt   r11, r8, #2, 18
        blt     LDNW68
        mov     r8, r8, lsl #1
        mov     r8, r8, lsl #16
        mov     r11, r8, asr #16
        b       LDNW68
LDNW67:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r11, r8
LDNW68:
        ldrsh   r8, [r4, #2]
        and     r0, r8, #1
        add     r0, r11, r0
        cmp     r5, r0
        blt     LDNW69
        cmn     r0, #2, 18
        movge   r11, r0, lsl #16
        movge   r11, r11, asr #16
        movlt   r11, #0
        sublt   r11, r11, #2, 18
        b       LDNW70
LDNW69:
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mvn     r11, r11
LDNW70:
        mov     r8, r8, asr #1
        cmp     lr, r11
        strh    r8, [r4, #2]
        blt     LDNW71
        cmn     r11, #1, 18
        movlt   r8, #0
        sublt   r11, r8, #2, 18
        blt     LDNW72
        mov     r11, r11, lsl #1
        mov     r8, r11, lsl #16
        mov     r11, r8, asr #16
        b       LDNW72
LDNW71:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r11, r8
LDNW72:
        ldrsh   r8, [r4, #4]
        and     r0, r8, #1
        add     r0, r11, r0
        cmp     r5, r0
        blt     LDNW73
        cmn     r0, #2, 18
        movge   r11, r0, lsl #16
        movge   r11, r11, asr #16
        movlt   r11, #0
        sublt   r11, r11, #2, 18
        b       LDNW74
LDNW73:
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mvn     r11, r11
LDNW74:
        mov     r8, r8, asr #1
        cmp     lr, r11
        strh    r8, [r4, #4]
        blt     LDNW75
        cmn     r11, #1, 18
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        blt     LDNW76
        mov     r11, r11, lsl #1
        mov     r8, r11, lsl #16
        mov     r8, r8, asr #16
        b       LDNW76
LDNW75:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDNW76:
        ldrsh   r11, [r4, #6]
        and     r0, r11, #1
        add     r0, r8, r0
        cmp     r5, r0
        blt     LDNW77
        cmn     r0, #2, 18
        movge   r8, r0, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDNW78
LDNW77:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDNW78:
        mov     r2, r12, lsl #16
        mov     r11, r11, asr #1
        strh    r11, [r4, #6]
        add     r3, r3, #4
        add     r0, sp, #0x78
        mov     r2, r2, asr #15
        cmp     r5, r3
        strh    r8, [r0, +r2]
        add     r12, r12, #1
        blt     LDNW79
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r4, r3, asr #16
        movlt   r3, #0
        sublt   r4, r3, #2, 18
        b       LDNW80
LDNW79:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r4, r3
LDNW80:
        ands    r3, r4, #7
        mov     r4, r4, lsr #31
        subne   r3, r3, r4, lsl #3
        cmp     r1, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        bgt     LDNW62
        ldr     r4, [sp, #0x20]
        ldrsh   r1, [sp, #0xD4]
LDNW81:
        cmp     r10, r1
        blt     LDNW82
        cmn     r1, #2, 20
        mvnlt   r1, #0xFF
        biclt   r2, r1, #0x7F, 24
        blt     LDNW83
        mov     r1, r1, lsl #2
        mov     r1, r1, lsl #16
        mov     r2, r1, asr #16
        b       LDNW83
LDNW82:
        mov     r1, #0
        sub     r1, r1, #2, 18
        mvn     r2, r1
LDNW83:
        ldr     r12, [sp, #0x58]
        add     r3, sp, #0x70
        add     r1, sp, #0x78
        str     r12, [sp, #4]
        str     r6, [sp]
        mov     r0, r4
        bl      LDNW__ownWrit_ovf
        ldrsh   lr, [sp, #0xD4]
        cmp     lr, #0
        ble     LDNW53
        cmp     lr, #6
        movlt   r1, #0
        movlt   r3, r1
        blt     LDNW85
        mov     r1, #0
        str     r6, [sp, #0x24]
        mov     r3, r1
        sub     r12, lr, #6
        str     r10, [sp, #0x2C]
        str     r5, [sp, #0x28]
        str     r4, [sp, #0x20]
        mov     r6, #0
LDNW84:
        mov     r1, r1, lsl #1
        add     r10, sp, #0x78
        strh    r6, [r10, +r1]
        add     r8, r3, #1
        add     r0, sp, #0x78
        mov     r11, r8, lsl #16
        add     r1, r3, #2
        mov     r11, r11, asr #15
        strh    r6, [r0, +r11]
        mov     r1, r1, lsl #16
        add     r8, r3, #3
        mov     r0, r1, asr #15
        add     r10, r3, #4
        add     r2, sp, #0x78
        strh    r6, [r2, +r0]
        mov     r8, r8, lsl #16
        add     r5, sp, #0x78
        mov     r1, r8, asr #15
        add     r3, r3, #5
        strh    r6, [r5, +r1]
        mov     r10, r10, lsl #16
        mov     r0, r3, lsl #16
        add     r4, sp, #0x78
        mov     r1, r0, asr #16
        mov     r10, r10, asr #15
        cmp     r1, r12
        strh    r6, [r4, +r10]
        ble     LDNW84
        ldr     r10, [sp, #0x2C]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x24]
        ldr     r4, [sp, #0x20]
LDNW85:
        mov     r12, #0
LDNW86:
        mov     r1, r1, lsl #1
        add     r8, sp, #0x78
        add     r3, r3, #1
        strh    r12, [r8, +r1]
        mov     r1, r3, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, lr
        blt     LDNW86
        b       LDNW53
LDNW__ownWrit_ovf:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     lr, [sp, #0x38]
        ldr     r12, [sp, #0x3C]
        cmp     r0, #0
        mov     r10, #0
        ble     LDNW105
        mvn     r4, #0xFF
        mov     r5, #0xFF
        orr     r6, r5, #0x7F, 24
        bic     r4, r4, #0x7F, 24
        mvn     r5, r4
        sub     r4, r6, #6, 20
        mov     r6, r12
        mov     r8, lr
        mov     r7, r3
        mov     r9, r0
        str     r12, [sp, #8]
        str     r3, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r0, [sp, #4]
LDNW87:
        ldrsh   r3, [r8], #2
        ldrsh   r0, [r7]
        sub     r3, r3, r0
        cmp     r5, r3
        blt     LDNW88
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNW89
LDNW88:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNW89:
        add     r3, r3, #1
        cmp     r5, r3
        blt     LDNW90
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r11, r3, asr #16
        movlt   r3, #0
        sublt   r11, r3, #2, 18
        b       LDNW91
LDNW90:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r11, r3
LDNW91:
        sub     r3, r11, #4
        cmp     r5, r3
        blt     LDNW92
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNW93
LDNW92:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNW93:
        cmp     r3, #0
        blt     LDNW104
        cmp     r2, #0
        ble     LDNW104
        ldr     r12, [r6]
        mov     r0, r0, asr #2
LDNW94:
        mov     r3, r10, lsl #16
        mov     lr, r0, lsl #16
        mov     r3, r3, asr #15
        ldrsh   r3, [r1, +r3]
        sub     r11, r11, #4
        mov     lr, lr, asr #15
        cmp     r5, r11
        strh    r3, [r12, +lr]
        add     r10, r10, #1
        add     r0, r0, #1
        blt     LDNW95
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r11, r11, asr #16
        movlt   r3, #0
        sublt   r11, r3, #2, 18
        b       LDNW96
LDNW95:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r11, r3
LDNW96:
        sub     r2, r2, #4
        cmp     r5, r2
        blt     LDNW97
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        b       LDNW98
LDNW97:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDNW98:
        sub     r3, r11, #4
        cmp     r5, r3
        blt     LDNW99
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNW100
LDNW99:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNW100:
        cmp     r3, #0
        blt     LDNW101
        cmp     r2, #0
        bgt     LDNW94
LDNW101:
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r4, r0
        blt     LDNW102
        cmn     r0, #2, 20
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        blt     LDNW103
        mov     r0, r0, lsl #2
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDNW103
LDNW102:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDNW103:
        strh    r0, [r7]
LDNW104:
        subs    r9, r9, #1
        add     r6, r6, #4
        add     r7, r7, #2
        bne     LDNW87
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r0, [sp, #4]
LDNW105:
        mov     r4, #0xFF
        orr     r5, r4, #0x7F, 24
        mov     r10, r10, lsl #16
        sub     r5, r5, #6, 20
        mov     r4, r10, asr #16
        cmp     r5, r4
        mvn     r5, #0xFF
        bic     r10, r5, #0x7F, 24
        mov     r5, #0
        mvnlt   r6, r10
        blt     LDNW106
        cmn     r4, #2, 20
        sublt   r6, r5, #2, 18
        blt     LDNW106
        mov     r4, r4, lsl #2
        mov     r4, r4, lsl #16
        mov     r6, r4, asr #16
LDNW106:
        cmp     r0, #0
        ble     LDNW125
        sub     r4, r5, #2, 18
        mvn     r7, r10
LDNW107:
        ldrsh   r8, [lr], #2
        ldrsh   r5, [r3]
        sub     r8, r8, r5
        cmp     r7, r8
        mvnlt   r8, r10
        blt     LDNW108
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
LDNW108:
        add     r8, r8, #1
        cmp     r7, r8
        mvnlt   r8, r10
        blt     LDNW109
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
LDNW109:
        cmp     r8, #0
        ble     LDNW124
        cmp     r2, #0
        ble     LDNW124
        ldr     r9, [r12]
        str     r10, [sp]
        str     r0, [sp, #4]
LDNW110:
        mov     r10, r6, asr #1
        and     r0, r6, #3
        add     r10, r6, r10, lsr #30
        bic     r11, r10, #3
        and     r10, r5, #3
        mov     r11, r11, asr #1
        ldrsh   r11, [r1, +r11]
        mov     r0, r11, asr r0
        and     r0, r0, #1
        cmp     r0, r7, asr r10
        bgt     LDNW111
        cmp     r0, r4, asr r10
        movlt   r0, #0
        sublt   r10, r0, #2, 18
        blt     LDNW112
        mov     r10, r0, lsl r10
        mov     r0, r10, lsl #16
        mov     r10, r0, asr #16
        b       LDNW112
LDNW111:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r10, r0
LDNW112:
        mov     r0, r5, asr #1
        add     r0, r5, r0, lsr #30
        bic     r0, r0, #3
        mov     r0, r0, asr #1
        ldrsh   r11, [r9, +r0]
        add     r10, r11, r10
        cmp     r7, r10
        blt     LDNW113
        cmn     r10, #2, 18
        movge   r10, r10, lsl #16
        movge   r10, r10, asr #16
        movlt   r10, #0
        sublt   r10, r10, #2, 18
        b       LDNW114
LDNW113:
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
LDNW114:
        add     r5, r5, #1
        cmp     r7, r5
        strh    r10, [r9, +r0]
        blt     LDNW115
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        movlt   r0, #0
        sublt   r5, r0, #2, 18
        b       LDNW116
LDNW115:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r5, r0
LDNW116:
        add     r6, r6, #1
        cmp     r7, r6
        blt     LDNW117
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        movlt   r0, #0
        sublt   r6, r0, #2, 18
        b       LDNW118
LDNW117:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r6, r0
LDNW118:
        sub     r8, r8, #1
        cmp     r7, r8
        blt     LDNW119
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r0, #0
        sublt   r8, r0, #2, 18
        b       LDNW120
LDNW119:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r8, r0
LDNW120:
        sub     r2, r2, #1
        cmp     r7, r2
        blt     LDNW121
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        mvnlt   r0, #0xFF
        biclt   r2, r0, #0x7F, 24
        b       LDNW122
LDNW121:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r2, r0
LDNW122:
        cmp     r8, #0
        ble     LDNW126
        cmp     r2, #0
        bgt     LDNW110
        ldr     r10, [sp]
        ldr     r0, [sp, #4]
LDNW123:
        strh    r5, [r3]
LDNW124:
        subs    r0, r0, #1
        add     r12, r12, #4
        add     r3, r3, #2
        bne     LDNW107
LDNW125:
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDNW126:
        ldr     r10, [sp]
        ldr     r0, [sp, #4]
        b       LDNW123
LDNW__ownInit_pos_i_ovf:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r12, [sp, #0x3C]
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r7, r3
        ble     LDNW139
        mvn     lr, #0xFF
        mov     r4, #0xFF
        bic     lr, lr, #0x7F, 24
        orr     r4, r4, #0x7F, 24
        sub     r8, r4, #6, 20
        mov     r1, #0
        mov     r0, #0
        mvn     r11, lr
LDNW127:
        ldrsh   r4, [r2], #2
        add     r4, r4, #1
        cmp     r11, r4
        mvnlt   r4, lr
        blt     LDNW128
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r1, #2, 18
LDNW128:
        cmp     r0, r7
        movgt   r10, #0
        bgt     LDNW136
        mov     r9, r0
        mov     r10, #0
        str     r2, [sp, #0xC]
        str     lr, [sp, #8]
        str     r0, [sp, #4]
        str     r12, [sp]
LDNW129:
        mov     r2, r9, lsl #1
        ldrsh   r1, [r6, +r2]
        cmp     r1, #0
        ble     LDNW135
        add     r3, sp, #0x10
        add     r2, sp, #0x14
        mov     r0, r4
        bl      ownChk_ovf
        ldrsh   r2, [sp, #0x14]
        cmp     r8, r2
        blt     LDNW130
        cmn     r2, #2, 20
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        blt     LDNW131
        mov     r12, r2, lsl #2
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDNW131
LDNW130:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDNW131:
        sub     r4, r4, r12
        cmp     r11, r4
        blt     LDNW132
        cmn     r4, #2, 18
        movge   r12, r4, lsl #16
        movge   r4, r12, asr #16
        movlt   r12, #0
        sublt   r4, r12, #2, 18
        b       LDNW133
LDNW132:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r4, r12
LDNW133:
        add     r2, r10, r2
        cmp     r11, r2
        blt     LDNW134
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r10, r2, asr #16
        movlt   r2, #0
        sublt   r10, r2, #2, 18
        b       LDNW135
LDNW134:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r10, r2
LDNW135:
        add     r9, r5, r9
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        cmp     r9, r7
        ble     LDNW129
        ldr     r2, [sp, #0xC]
        ldr     lr, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r12, [sp]
        mov     r1, #0
LDNW136:
        cmp     r8, r10
        blt     LDNW137
        cmn     r10, #2, 20
        mvnlt   r4, #0xFF
        biclt   r4, r4, #0x7F, 24
        blt     LDNW138
        mov     r10, r10, lsl #2
        mov     r4, r10, lsl #16
        mov     r4, r4, asr #16
        b       LDNW138
LDNW137:
        mov     r4, #0
        sub     r4, r4, #2, 18
        mvn     r4, r4
LDNW138:
        add     r0, r0, #1
        strh    r4, [r12], #2
        cmp     r0, r5
        blt     LDNW127
LDNW139:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


