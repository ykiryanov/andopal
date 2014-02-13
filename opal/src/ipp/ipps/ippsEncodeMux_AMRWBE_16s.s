        .text
        .align  4
        .globl  _ippsEncodeMux_AMRWBE_16s


_ippsEncodeMux_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4F, 30
        sub     sp, sp, #5, 22
        add     r5, sp, #1, 20
        ldr     r5, [r5, #0x560]
        cmp     r0, #0
        beq     LDGM13
        cmp     r3, #0
        beq     LDGM13
        cmp     r2, #0
        beq     LDGM13
        cmp     r5, #0
        ble     LDGM12
        cmp     r1, #0
        ble     LDGM12
        mvn     lr, #0xFF
        cmp     r5, #0
        bic     lr, lr, #0x7F, 24
        mov     r8, #0
        movle   r4, #0
        ble     LDGM3
        mov     r4, #0
        mov     r7, r4
        mov     r9, r7
        mvn     r6, lr
LDGM0:
        ldr     r11, [r2, +r9, lsl #2]
        add     r10, sp, #1, 20
        add     r10, r10, #0x52, 28
        str     r3, [r10, +r9, lsl #2]
        mov     r11, r11, lsl #16
        mov     r9, r11, asr #16
        add     r4, r4, r9
        cmp     r6, r4
        mvnlt   r4, lr
        blt     LDGM1
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r8, #2, 18
LDGM1:
        add     r9, r9, #3
        cmp     r6, r9
        mvnlt   r9, lr
        blt     LDGM2
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        sublt   r9, r8, #2, 18
LDGM2:
        bic     r9, r9, #3
        add     r7, r7, #1
        add     r3, r3, r9, asr #1
        mov     r10, r7, lsl #16
        mov     r9, r10, asr #16
        cmp     r5, r9
        bgt     LDGM0
LDGM3:
        cmp     r5, #0
        ble     LDGM11
        mov     r7, #0
        mov     r9, r7
        mvn     r6, lr
        str     r4, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LDGM4:
        ldr     r0, [r2, +r9, lsl #2]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        sub     r0, r0, #1
        cmp     r6, r0
        mvnlt   r3, lr
        blt     LDGM5
        cmn     r0, #2, 18
        movge   r1, r0, lsl #16
        movge   r3, r1, asr #16
        movlt   r1, #0
        sublt   r3, r1, #2, 18
LDGM5:
        add     r1, sp, #1, 20
        add     r1, r1, #0x52, 28
        ldr     r1, [r1, +r9, lsl #2]
        add     r4, sp, #1, 20
        add     r4, r4, #0x53, 28
        mov     r9, r9, lsl #1
        cmp     r6, r0
        strh    r3, [r4, +r9]
        blt     LDGM6
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #0xFF
        biclt   r0, r0, #0x7F, 24
        b       LDGM7
LDGM6:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r0, r0
LDGM7:
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #18
        mov     r0, r0, lsl #16
        movs    r0, r0, asr #16
        bmi     LDGM10
        cmp     r0, #6
        movlt   r9, #0
        movlt   r3, r9
        blt     LDGM9
        mov     r9, #0
        mov     r3, r9
        sub     r4, r0, #6
        str     r2, [sp, #0x1C]
LDGM8:
        mov     r9, r9, lsl #1
        strh    r8, [r1, +r9]
        add     r2, r3, #1
        add     r9, r3, #2
        mov     r11, r2, lsl #16
        mov     r9, r9, lsl #16
        add     r10, r3, #3
        add     r2, r3, #4
        mov     r11, r11, asr #15
        strh    r8, [r1, +r11]
        mov     r9, r9, asr #15
        strh    r8, [r1, +r9]
        add     r3, r3, #5
        mov     r10, r10, lsl #16
        mov     r9, r3, lsl #16
        mov     r2, r2, lsl #16
        mov     r10, r10, asr #15
        strh    r8, [r1, +r10]
        mov     r9, r9, asr #16
        mov     r2, r2, asr #15
        cmp     r9, r4
        strh    r8, [r1, +r2]
        ble     LDGM8
        ldr     r2, [sp, #0x1C]
LDGM9:
        mov     r9, r9, lsl #1
        add     r3, r3, #1
        strh    r8, [r1, +r9]
        mov     r4, r3, lsl #16
        mov     r9, r4, asr #16
        cmp     r9, r0
        ble     LDGM9
LDGM10:
        add     r7, r7, #1
        mov     r0, r7, lsl #16
        mov     r9, r0, asr #16
        cmp     r5, r9
        bgt     LDGM4
        ldr     r4, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LDGM11:
        add     r3, sp, #1, 20
        add     lr, sp, #1, 20
        add     r2, sp, #0x20
        mov     r1, r1, lsl #16
        str     r2, [sp, #4]
        add     r3, r3, #0x32, 28
        add     lr, lr, #0x12, 28
        mov     r6, r1, asr #16
        str     lr, [sp]
        mov     r2, r6
        mov     r1, r4
        bl      ownSplit_idx_noovf
        add     r0, sp, #1, 20
        add     lr, sp, #5, 22
        add     r2, sp, #1, 20
        add     r1, sp, #1, 20
        add     r0, r0, #0x52, 28
        str     r0, [sp, #8]
        add     lr, lr, #0x4E, 30
        str     lr, [sp, #4]
        mov     r5, r5, lsl #16
        add     r2, r2, #0x53, 28
        add     r1, r1, #0x32, 28
        str     r6, [sp]
        mov     r5, r5, asr #16
        mov     r3, r4
        mov     r0, r5
        bl      ownWrit_all_nq
        add     r3, sp, #1, 20
        add     r2, sp, #1, 20
        add     r3, r3, #0x12, 28
        add     r1, sp, #0x20
        add     r2, r2, #0x52, 28
        str     r3, [sp]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        add     r3, sp, #0x15, 24
        ldrsh   r3, [r3, #0x38]
        add     r2, sp, #1, 20
        add     r1, sp, #1, 20
        add     r2, r2, #0x53, 28
        add     r1, r1, #0x32, 28
        mov     r0, r5
        bl      ownWrit_all_i
        add     sp, sp, #0x4F, 30
        mov     r0, #0
        add     sp, sp, #5, 22
        ldmia   sp!, {r4 - r11, pc}
LDGM12:
        add     sp, sp, #0x4F, 30
        mvn     r0, #5
        add     sp, sp, #5, 22
        ldmia   sp!, {r4 - r11, pc}
LDGM13:
        add     sp, sp, #0x4F, 30
        mvn     r0, #7
        add     sp, sp, #5, 22
        ldmia   sp!, {r4 - r11, pc}


