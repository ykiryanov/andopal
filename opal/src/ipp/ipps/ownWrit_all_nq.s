        .text
        .align  4
        .globl  ownWrit_all_nq


ownWrit_all_nq:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r4, [sp, #0x44]
        ldr     lr, [sp, #0x48]
        ldr     r12, [sp, #0x4C]
        mvn     r5, #0
        cmp     r4, #0
        strh    r5, [lr]
        ble     LDNV30
        mov     r6, #0xFF
        sub     r5, r0, #1
        orr     r7, r6, #0x7F, 24
        mvn     r0, #0xFF
        mov     r6, r5, lsl #16
        mov     r8, #0
        bic     r0, r0, #0x7F, 24
        sub     r9, r7, #6, 20
        mov     r6, r6, asr #16
        sub     r11, r8, #2, 18
        mvn     r0, r0
        mov     r7, #0
        mov     r10, #1
        str     r9, [sp, #0x14]
        str     r11, [sp, #0x1C]
        str     r6, [sp, #0x18]
LDNV0:
        cmp     r0, r5
        blt     LDNV1
        cmn     r5, #2, 18
        ldrge   r6, [sp, #0x18]
        movlt   r6, #0
        sublt   r6, r6, #2, 18
        b       LDNV2
LDNV1:
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r6, r6
LDNV2:
        and     r6, r7, r6
        ldrsh   r10, [r1]
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        ldr     r8, [r12, +r6, lsl #2]
        mov     r6, r6, lsl #1
        cmp     r10, #2
        str     r8, [sp, #0x10]
        ldrsh   r9, [r2, +r6]
        movlt   r8, #0
        blt     LDNV8
        ldr     r8, [sp, #0x14]
        cmp     r8, r10
        blt     LDNV3
        cmn     r10, #2, 20
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        blt     LDNV4
        mov     r8, r10, lsl #2
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        b       LDNV4
LDNV3:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDNV4:
        add     r8, r10, r8
        cmp     r0, r8
        blt     LDNV5
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDNV6
LDNV5:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDNV6:
        sub     r8, r8, #1
        cmp     r0, r8
        blt     LDNV7
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDNV8
LDNV7:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDNV8:
        sub     r11, r8, r3
        cmp     r0, r11
        blt     LDNV9
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r11, r11, asr #16
        movlt   r11, #0
        sublt   r11, r11, #2, 18
        b       LDNV10
LDNV9:
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mvn     r11, r11
LDNV10:
        cmp     r11, #0
        ble     LDNV31
        mov     r8, #0
        strh    r8, [r1]
        mov     r10, #0
LDNV11:
        sub     r8, r10, #2
        cmp     r0, r8
        blt     LDNV12
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDNV13
LDNV12:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDNV13:
        cmp     r8, #0
        strgeh  r7, [lr]
        ldrgesh r10, [r1]
        sub     r10, r10, #1
        cmp     r0, r10
        blt     LDNV14
        cmn     r10, #2, 18
        movge   r8, r10, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDNV15
LDNV14:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDNV15:
        cmp     r8, #0
        ble     LDNV25
        str     lr, [sp, #8]
        ldr     lr, [sp, #0x10]
        ldr     r10, [sp, #0x1C]
        str     r4, [sp, #4]
        str     r12, [sp, #0xC]
        str     r2, [sp]
        mov     r4, #1
LDNV16:
        sub     r8, r8, #1
        cmp     r0, r8
        blt     LDNV17
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r2, #0
        sublt   r8, r2, #2, 18
        b       LDNV18
LDNV17:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r8, r2
LDNV18:
        and     r2, r9, #3
        mov     r12, r0, asr r2
        cmp     r12, #1
        mov     r12, r10, asr r2
        blt     LDNV19
        cmp     r12, #1
        movgt   r2, #0
        subgt   r12, r2, #2, 18
        bgt     LDNV20
        mov     r2, r4, lsl r2
        mov     r2, r2, lsl #16
        mov     r12, r2, asr #16
        b       LDNV20
LDNV19:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r12, r2
LDNV20:
        mov     r2, r9, asr #1
        add     r2, r9, r2, lsr #30
        bic     r2, r2, #3
        mov     r2, r2, asr #1
        ldrsh   r11, [lr, +r2]
        add     r12, r11, r12
        cmp     r0, r12
        blt     LDNV21
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r12, r12, asr #16
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        b       LDNV22
LDNV21:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDNV22:
        sub     r9, r9, #1
        cmp     r0, r9
        strh    r12, [lr, +r2]
        blt     LDNV23
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        movlt   r2, #0
        sublt   r9, r2, #2, 18
        b       LDNV24
LDNV23:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r9, r2
LDNV24:
        cmp     r8, #0
        bgt     LDNV16
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #8]
        ldr     r4, [sp, #4]
        ldr     r2, [sp]
LDNV25:
        cmp     r3, #0
        ble     LDNV29
        sub     r9, r9, #1
        cmp     r0, r9
        blt     LDNV26
        cmn     r9, #2, 18
        movge   r8, r9, lsl #16
        movge   r9, r8, asr #16
        movlt   r8, #0
        sublt   r9, r8, #2, 18
        b       LDNV27
LDNV26:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r9, r8
LDNV27:
        sub     r3, r3, #1
        cmp     r0, r3
        blt     LDNV28
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNV29
LDNV28:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNV29:
        add     r7, r7, #1
        cmp     r7, r4
        strh    r9, [r2, +r6]
        add     r1, r1, #2
        blt     LDNV0
LDNV30:
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDNV31:
        sub     r3, r3, r8
        cmp     r0, r3
        blt     LDNV32
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        mvnlt   r3, #0xFF
        biclt   r3, r3, #0x7F, 24
        b       LDNV11
LDNV32:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mvn     r3, r3
        b       LDNV11


