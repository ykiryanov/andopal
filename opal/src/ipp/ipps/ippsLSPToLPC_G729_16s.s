        .text
        .align  4
        .globl  _ippsLSPToLPC_G729_16s


_ippsLSPToLPC_G729_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        add     lr, sp, #0x1C
        add     r2, sp, #0x48
        and     r12, r2, #7
        and     lr, lr, #7
        rsb     r4, lr, #0
        rsb     r12, r12, #0
        and     lr, r12, #7
        and     r12, r4, #7
        add     r3, sp, #0x48
        add     r2, sp, #0x1C
        cmp     r0, #0
        add     r4, r3, lr
        add     r5, r2, r12
        beq     LDSV21
        cmp     r1, #0
        beq     LDSV21
        ldrsh   r7, [r0]
        mov     r6, #1, 8
        str     r6, [lr, +r3]
        rsb     r6, r7, #0
        sub     r10, r4, #8
        mov     r6, r6, lsl #10
        str     r6, [r4, #4]
        mov     r11, #2
        sub     r9, r4, #4
        add     r8, r0, #4
        add     r6, r10, #8
        add     r7, r4, #8
        str     r5, [sp, #4]
        str     r12, [sp, #8]
        str     lr, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LDSV0:
        ldr     r0, [r6], #4
        cmp     r11, #1
        str     r0, [r7], #4
        mov     lr, r11
        ldrlesh r12, [r8]
        ble     LDSV2
        ldrsh   r12, [r8]
        mov     r3, #1
        add     r2, r9, lr, lsl #2
        add     r1, r4, lr, lsl #2
        add     r0, r10, lr, lsl #2
        str     r10, [sp]
        str     r4, [sp, #0xC]
LDSV1:
        ldr     r5, [r2], #-4
        ldr     r10, [r1]
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     r4, r4
        and     r4, r4, r5, asr #1
        mul     r4, r12, r4
        mov     r5, r5, asr #16
        mov     r5, r5, lsl #16
        mov     r4, r4, asr #15
        sub     lr, lr, #1
        mov     r5, r5, asr #16
        mla     r4, r12, r5, r4
        add     r3, r3, #1
        cmp     r3, r11
        sub     r10, r10, r4, lsl #2
        str     r10, [r1]
        ldr     r4, [r0], #-4
        add     r4, r10, r4
        str     r4, [r1], #-4
        blt     LDSV1
        ldr     r10, [sp]
        ldr     r4, [sp, #0xC]
LDSV2:
        ldr     r0, [r4, +lr, lsl #2]
        add     r11, r11, #1
        cmp     r11, #5
        sub     r0, r0, r12, lsl #10
        str     r0, [r4, +lr, lsl #2]
        add     r8, r8, #4
        ble     LDSV0
        ldr     r0, [sp, #0x18]
        ldr     r5, [sp, #4]
        ldr     r12, [sp, #8]
        ldrsh   r6, [r0, #2]
        ldr     lr, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        add     r2, sp, #0x1C
        rsb     r6, r6, #0
        mov     r7, #1, 8
        str     r7, [r12, +r2]
        mov     r6, r6, lsl #10
        str     r6, [r5, #4]
        sub     r9, r5, #8
        add     r3, sp, #0x48
        add     r0, r0, #6
        mov     r10, #2
        sub     r8, r5, #4
        add     r6, r9, #8
        add     r7, r5, #8
        str     r12, [sp, #8]
        str     r4, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r1, [sp, #0x14]
LDSV3:
        ldr     r1, [r6], #4
        cmp     r10, #1
        str     r1, [r7], #4
        mov     r4, r10
        ldrlesh lr, [r0]
        ble     LDSV5
        ldrsh   lr, [r0]
        mov     r12, #1
        add     r3, r8, r4, lsl #2
        add     r2, r5, r4, lsl #2
        add     r1, r9, r4, lsl #2
        str     r9, [sp]
        str     r5, [sp, #4]
LDSV4:
        ldr     r9, [r3], #-4
        ldr     r11, [r2]
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
        and     r5, r5, r9, asr #1
        mul     r5, lr, r5
        mov     r9, r9, asr #16
        mov     r9, r9, lsl #16
        mov     r5, r5, asr #15
        sub     r4, r4, #1
        mov     r9, r9, asr #16
        mla     r5, lr, r9, r5
        add     r12, r12, #1
        cmp     r12, r10
        sub     r11, r11, r5, lsl #2
        str     r11, [r2]
        ldr     r5, [r1], #-4
        add     r5, r11, r5
        str     r5, [r2], #-4
        blt     LDSV4
        ldr     r9, [sp]
        ldr     r5, [sp, #4]
LDSV5:
        ldr     r1, [r5, +r4, lsl #2]
        add     r10, r10, #1
        cmp     r10, #5
        sub     r1, r1, lr, lsl #10
        str     r1, [r5, +r4, lsl #2]
        add     r0, r0, #4
        ble     LDSV3
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0x10]
        ldr     r4, [sp, #0xC]
        add     r3, sp, #0x48
        add     r2, sp, #0x1C
        ldr     r12, [r12, +r2]
        ldr     r3, [lr, +r3]
        ldr     r2, [r4, #4]
        ldr     lr, [r5, #4]
        ldr     r1, [sp, #0x14]
        ldr     r0, [r4, #0x14]
        add     r8, r2, r3
        ldr     r2, [r4, #0x10]
        sub     r7, lr, r12
        ldr     r3, [r5, #0x10]
        ldr     r12, [r5, #0x14]
        add     r6, r0, r2
        ldr     r0, [r4, #0x10]
        sub     lr, r12, r3
        ldr     r3, [r4, #0xC]
        ldr     r2, [r5, #0x10]
        str     r6, [r4, #0x14]
        str     lr, [r5, #0x14]
        add     r12, r0, r3
        ldr     r3, [r5, #0xC]
        ldr     r0, [r4, #0xC]
        str     r12, [r4, #0x10]
        sub     r2, r2, r3
        str     r2, [sp, #0x18]
        ldr     r3, [r4, #8]
        ldr     r9, [r4, #4]
        str     r2, [r5, #0x10]
        ldr     r2, [r5, #0xC]
        add     r3, r0, r3
        ldr     r0, [r5, #8]
        str     r3, [r4, #0xC]
        str     r8, [r4, #4]
        mvn     r10, #2, 2
        sub     r2, r2, r0
        ldr     r0, [r4, #8]
        str     r2, [r5, #0xC]
        add     r0, r0, r9
        str     r0, [r4, #8]
        ldr     r4, [r5, #4]
        ldr     r9, [r5, #8]
        sub     r4, r9, r4
        str     r4, [r5, #8]
        mov     r5, r7, asr #31
        adds    r9, r8, r7
        adc     r5, r5, r8, asr #31
        subs    r10, r9, r10
        sbcs    r11, r5, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r10, r10, r11
        mov     r11, #1, 20
        strh    r11, [r1]
        mvnne   r9, #2, 2
        bne     LDSV6
        cmp     r9, #2, 2
        mvn     r10, #0
        sbcs    r5, r5, r10
        movlt   r9, #2, 2
LDSV6:
        mvn     r5, #0xFF
        add     r9, r9, #1, 20
        bic     r5, r5, #0x7F, 24
        mov     r9, r9, asr #13
        mvn     r5, r5
        cmp     r5, r9
        blt     LDSV7
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r5, r9, asr #16
        mvnlt   r5, #2, 2
        movlt   r5, r5, lsl #15
        b       LDSV8
LDSV7:
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
LDSV8:
        sub     r8, r8, r7
        strh    r5, [r1, #2]
        add     r7, r8, #1, 20
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mov     r7, r7, asr #13
        mvn     r8, r5
        cmp     r8, r7
        mvnlt   r7, r5
        blt     LDSV9
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        mvnlt   r5, #2, 2
        movlt   r7, r5, lsl #15
LDSV9:
        strh    r7, [r1, #0x14]
        mov     r5, r4, asr #31
        adds    r7, r0, r4
        adc     r5, r5, r0, asr #31
        mvn     r8, #2, 2
        subs    r9, r7, r8
        sbcs    r10, r5, #0
        movlt   r9, #0
        movlt   r10, #0
        orrs    r10, r9, r10
        movne   r7, r8
        bne     LDSV10
        cmp     r7, #2, 2
        mvn     r8, #0
        sbcs    r5, r5, r8
        movlt   r7, #2, 2
LDSV10:
        mvn     r5, #0xFF
        add     r7, r7, #1, 20
        bic     r5, r5, #0x7F, 24
        mov     r7, r7, asr #13
        mvn     r8, r5
        cmp     r8, r7
        mvnlt   r7, r5
        blt     LDSV11
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        mvnlt   r7, #2, 2
        movlt   r7, r7, lsl #15
LDSV11:
        sub     r0, r0, r4
        add     r4, r0, #1, 20
        mvn     r0, r5
        mov     r4, r4, asr #13
        cmp     r0, r4
        strh    r7, [r1, #4]
        mvnlt   r4, r5
        blt     LDSV12
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        mvnlt   r0, #2, 2
        movlt   r4, r0, lsl #15
LDSV12:
        strh    r4, [r1, #0x12]
        adds    r4, r3, r2
        mov     r0, r2, asr #31
        adc     r7, r0, r3, asr #31
        mvn     r0, #2, 2
        subs    r8, r4, r0
        sbcs    r9, r7, #0
        movlt   r8, #0
        movlt   r9, #0
        orrs    r9, r8, r9
        movne   r4, r0
        bne     LDSV13
        cmp     r4, #2, 2
        mvn     r8, #0
        sbcs    r7, r7, r8
        movlt   r4, #2, 2
LDSV13:
        add     r7, r4, #1, 20
        mvn     r4, r5
        mov     r7, r7, asr #13
        cmp     r4, r7
        mvnlt   r4, r5
        blt     LDSV14
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r4, r7, asr #16
        movlt   r4, r0, lsl #15
LDSV14:
        sub     r3, r3, r2
        add     r2, r3, #1, 20
        mvn     r3, r5
        mov     r2, r2, asr #13
        cmp     r3, r2
        strh    r4, [r1, #6]
        mvnlt   r2, r5
        blt     LDSV15
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        movlt   r2, r0, lsl #15
LDSV15:
        strh    r2, [r1, #0x10]
        ldr     r3, [sp, #0x18]
        adds    r2, r12, r3
        mov     r3, r3, asr #31
        adc     r3, r3, r12, asr #31
        subs    r4, r2, r0
        sbcs    r7, r3, #0
        movlt   r4, #0
        movlt   r7, #0
        orrs    r7, r4, r7
        movne   r2, r0
        bne     LDSV16
        cmp     r2, #2, 2
        mvn     r4, #0
        sbcs    r3, r3, r4
        movlt   r2, #2, 2
LDSV16:
        add     r3, r2, #1, 20
        mvn     r2, r5
        mov     r3, r3, asr #13
        cmp     r2, r3
        mvnlt   r2, r5
        blt     LDSV17
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r2, r3, asr #16
        movlt   r2, r0, lsl #15
LDSV17:
        ldr     r3, [sp, #0x18]
        strh    r2, [r1, #8]
        mvn     r2, r5
        sub     r12, r12, r3
        add     r3, r12, #1, 20
        mov     r3, r3, asr #13
        cmp     r2, r3
        mvnlt   r3, r5
        blt     LDSV18
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, r0, lsl #15
LDSV18:
        add     r2, r6, lr
        strh    r3, [r1, #0xE]
        add     r3, r2, #1, 20
        mvn     r2, r5
        mov     r3, r3, asr #13
        cmp     r2, r3
        mvnlt   r2, r5
        blt     LDSV19
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r2, r3, asr #16
        movlt   r2, r0, lsl #15
LDSV19:
        sub     r6, r6, lr
        add     r3, r6, #1, 20
        strh    r2, [r1, #0xA]
        mov     r3, r3, asr #13
        mvn     r2, r5
        cmp     r2, r3
        movlt   r0, r0, lsl #15
        mvnlt   r5, r0
        blt     LDSV20
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r5, r3, asr #16
LDSV20:
        mov     r0, #0
        strh    r5, [r1, #0xC]
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LDSV21:
        mvn     r0, #7
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}


