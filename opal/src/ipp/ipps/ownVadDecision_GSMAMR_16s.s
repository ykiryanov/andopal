        .text
        .align  4
        .globl  ownVadDecision_GSMAMR_16s


ownVadDecision_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     r6, [sp, #0x60]
        mvn     r12, #0xFF
        mov     r4, r0
        mov     r5, r1
        bic     r12, r12, #0x7F, 24
        mov     r7, r3
        mvn     r0, #2, 2
        mov     r8, r2
        mvn     r1, r12
        mvn     r3, #0
        mov     r12, r0, lsl #15
        mov     r10, r5
        mov     r11, r4
        mov     r2, #9
        str     r6, [sp, #0x24]
        str     r7, [sp, #0x28]
        str     r5, [sp, #0x30]
        str     r4, [sp, #0x34]
        mov     r9, #0
        mov     lr, #2, 2
        str     r12, [sp, #0x20]
        str     r8, [sp, #0x2C]
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
        mov     r7, r3
LDOD0:
        ldrsh   r12, [r11, #0x36]
        mov     r1, r12
        cmn     r1, #1
        moveq   r8, #0xF
        beq     LDOD3
        cmp     r1, #0
        moveq   r8, #0
        beq     LDOD3
        cmp     r1, #0
        blt     LDOD11
LDOD1:
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        bne     LDOD2
        ldr     lr, [pc, #0x4EC]
        mov     r12, r12, lsl #1
        ldrsh   r8, [lr, +r12]
        b       LDOD3
LDOD2:
        mov     r12, lr, lsl #1
        ldr     lr, [pc, #0x4DC]
        ldrsh   r8, [lr, +r12]
LDOD3:
        bic     r12, r8, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        cmp     r1, r6, asr r12
        mvngt   r12, #2, 2
        bgt     LDOD4
        mov     lr, #2, 2
        cmp     r1, lr, asr r12
        movge   r12, r1, lsl r12
        movlt   r12, #2, 2
LDOD4:
        mov     r12, r12, lsl #16
        mov     r1, r12, asr #16
        cmp     r1, #0
        ble     LDOD12
        ldrsh   r12, [r10]
        mvn     lr, #0xFF, 14
        bic     lr, lr, #0x7F, 6
        and     lr, r12, lr
        mov     r0, lr, lsl #14
        bl      __intel_idiv
LDOD5:
        sub     lr, r8, #5
        mov     r0, r0, lsl #16
        cmp     lr, #0
        mov     r12, r0, asr #16
        ble     LDOD7
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        cmp     r12, r5, asr lr
        bgt     LDOD6
        ldr     r8, [sp, #0x20]
        cmp     r12, r8, asr lr
        mvnlt   r12, #0xFF
        biclt   r12, r12, #0x7F, 24
        blt     LDOD8
        mov     lr, r12, lsl lr
        mov     r12, lr, lsl #16
        mov     r12, r12, asr #16
        b       LDOD8
LDOD6:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
        b       LDOD8
LDOD7:
        rsb     r8, r8, #5
        mov     r8, r12, asr r8
        mov     r12, r8, lsl #16
        mov     r12, r12, asr #16
LDOD8:
        mov     lr, r12, lsl #1
        mul     r12, lr, r12
        mov     lr, r9, asr #31
        adds    r9, r9, r12
        adc     r12, lr, r12, asr #31
        subs    r8, r9, r6
        sbcs    lr, r12, #0
        movlt   r8, #0
        movlt   lr, #0
        orrs    lr, r8, lr
        mvnne   r9, #2, 2
        bne     LDOD9
        cmp     r9, #2, 2
        sbcs    r12, r12, r7
        movlt   r9, #2, 2
LDOD9:
        subs    r4, r4, #1
        add     r10, r10, #2
        add     r11, r11, #2
        bne     LDOD0
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        ldr     r8, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        mvn     r12, #0xFE, 8
        cmp     r12, r9
        str     r9, [sp, #0x38]
        mvnlt   r12, #2, 2
        blt     LDOD10
        cmp     r9, #0xFE, 8
        movge   r12, r9, lsl #6
        movlt   r12, #2, 2
LDOD10:
        add     r2, sp, #0x38
        add     r9, r4, #0x36
        mov     r3, #0
        mov     r1, #9
        mov     r0, r9
        mov     r10, r12, asr #16
        bl      _ippsSum_16s32s_Sfs
        ldr     r11, [sp, #0x38]
        ldrsh   lr, [r4, #0x64]
        mov     r12, r10, lsl #16
        mov     r10, r11, asr #3
        mvn     r11, #0xF7
        mov     r12, r12, asr #16
        mov     r10, r10, lsl #16
        bic     r11, r11, #0xA, 24
        mov     r0, #0x2D, 28
        mov     r10, r10, asr #16
        mul     r11, r10, r11
        add     r1, r0, #0x87, 30
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #17
        add     r1, r1, r11, asr #15
        rsb     r11, r12, r12, lsl #3
        mov     lr, lr, lsl #16
        mov     r1, r1, lsl #16
        add     r11, r11, r11, lsl #6
        mov     lr, lr, asr #16
        mov     r1, r1, asr #16
        cmp     r1, #0x2D, 28
        add     r11, r12, r11, lsl #3
        movgt   r0, r1
        mov     r12, r11, asr #15
        mov     r12, r12, lsl #16
        cmp     r0, r12, asr #16
        strgeh  lr, [r4, #0x64]
        orrlt   lr, lr, #1, 18
        strlth  lr, [r4, #0x64]
        mov     r11, #0xFA, 26
        sub     r12, r11, #0xFA, 30
        cmp     r12, r8
        movle   r8, #0
        movgt   r8, #1
        mov     r2, r6
        mov     r1, r8
        mov     r0, r4
        bl      LDOD_ownComplexEstimateAdapt
        mov     r0, r4
        mov     r1, r8
        bl      LDOD_ownComplexVad
        strh    r0, [r4, #0x6E]
        mov     r12, #9
        str     r12, [sp, #0x1C]
        str     r11, [sp, #0x18]
        ldrsh   r12, [r4, #0x6C]
        mov     r3, r9
        add     r2, r4, #0x12
        str     r12, [sp, #0x14]
        ldrsh   r12, [r4, #0x72]
        str     r0, [sp, #0xC]
        add     r1, r4, #0x24
        str     r12, [sp, #0x10]
        ldrsh   r12, [r4, #0x64]
        str     r7, [sp, #4]
        str     r12, [sp, #8]
        add     r12, r4, #0x62
        str     r12, [sp]
        mov     r0, r5
        bl      ownNoiseEstimateUpdate
        mov     r0, r4
        mov     r2, r8
        mov     r1, r10
        bl      LDOD_ownHangoverAdd
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LDOD11:
        mvn     r12, r1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDOD1
LDOD12:
        mvn     r12, #2, 2
        mov     r12, r12, lsl #15
        mvn     r0, r12
        b       LDOD5
LDOD_ownComplexEstimateAdapt:
        stmdb   sp!, {r4, r5, lr}
        ldrsh   r3, [r0, #0x70]
        mov     r12, #0x99
        mov     r4, #0x3D
        mov     lr, #0xCC
        cmp     r2, r3
        orr     r12, r12, #0x19, 24
        orr     r4, r4, #0xA, 24
        orr     lr, lr, #0x13, 22
        bge     LDOD13
        cmp     lr, r3
        movle   r4, r12
        b       LDOD14
LDOD13:
        cmp     lr, r3
        movle   lr, #0x8F
        orrle   r4, lr, #2, 24
LDOD14:
        mov     lr, r4, lsl #1
        mov     r5, r3, lsl #16
        rsb     r4, lr, #0
        mla     r5, r4, r3, r5
        ldr     r3, [pc, #0x20C]
        mla     r5, r2, lr, r5
        cmp     r3, r5
        movle   r2, #0xFF
        orrle   r2, r2, #0x7F, 24
        ble     LDOD15
        add     r5, r5, #2, 18
        mov     r5, r5, asr #16
        mov     r5, r5, lsl #16
        mov     r2, r5, asr #16
LDOD15:
        mov     r3, r12, lsl #1
        cmp     r2, r3
        movgt   r3, r2
        cmp     r1, #0
        streqh  r3, [r0, #0x70]
        beq     LDOD16
        mov     r12, r12, lsl #1
        strh    r12, [r0, #0x70]
        ldmia   sp!, {r4, r5, pc}
LDOD16:
        ldmia   sp!, {r4, r5, pc}
LDOD_ownComplexVad:
        stmdb   sp!, {lr}
        ldrsh   r3, [r0, #0x66]
        ldrsh   r12, [r0, #0x68]
        ldrsh   r2, [r0, #0x70]
        mov     r3, r3, lsl #16
        mov     r12, r12, lsl #16
        mov     r3, r3, asr #17
        cmp     r1, #0
        mov     r12, r12, asr #17
        mov     r1, r3, lsl #16
        mov     r3, #0xFF
        mov     lr, r12, lsl #16
        orr     r12, r3, #0x7F, 24
        mov     r3, r1, asr #16
        mov     r1, lr, asr #16
        strneh  r1, [r0, #0x68]
        strneh  r3, [r0, #0x66]
        bne     LDOD17
        mov     lr, #0xCC
        orr     lr, lr, #0x13, 22
        cmp     lr, r2
        strgeh  r3, [r0, #0x66]
        orrlt   r3, r3, #1, 18
        strlth  r3, [r0, #0x66]
        sub     lr, r12, #1, 18
        cmp     lr, r2
        strgeh  r1, [r0, #0x68]
        orrlt   r1, r1, #1, 18
        strlth  r1, [r0, #0x68]
LDOD17:
        mov     lr, #0x66, 30
        orr     lr, lr, #0x16, 22
        cmp     lr, r2
        mov     r2, #0
        movge   lr, r2
        ldrltsh lr, [r0, #0x6A]
        addlt   lr, lr, #1
        strh    lr, [r0, #0x6A]
        sub     lr, r12, #0x7F
        and     r3, r3, lr
        cmp     lr, r3
        beq     LDOD18
        and     r1, r1, r12
        cmp     r12, r1
        beq     LDOD18
        mov     r0, r2
        ldr     pc, [sp], #4
LDOD18:
        mov     r2, #1
        mov     r0, r2
        ldr     pc, [sp], #4
LDOD_ownHangoverAdd:
        stmdb   sp!, {r4, lr}
        cmp     r1, #0x64
        mov     lr, #4
        movle   r12, #5
        movle   r3, #4
        movgt   r12, #4
        movgt   r3, #7
        cmp     r2, #0
        mov     r1, #0
        bne     LDOD23
        ldrsh   r2, [r0, #0x6A]
        cmp     r2, #0x64
        ldrlesh r4, [r0, #0x6C]
        ble     LDOD19
        ldrsh   r2, [r0, #0x6C]
        mov     r4, #0xFA
        cmp     r2, #0xFA
        movgt   r4, r2
        strh    r4, [r0, #0x6C]
LDOD19:
        cmp     r4, #0
        bne     LDOD22
        ldrsh   r2, [r0, #0x64]
        mov     lr, #0xFF, 28
        orr     lr, lr, #3, 20
        tst     r2, lr
        bne     LDOD20
        ldrsh   lr, [r0, #0x70]
        mov     r4, #0x32
        orr     r4, r4, #0x53, 24
        cmp     r4, lr
        movlt   r0, #1
        ldmltia sp!, {r4, pc}
LDOD20:
        tst     r2, #1, 18
        beq     LDOD21
        ldrsh   r1, [r0, #0x5E]
        add     r1, r1, #1
        strh    r1, [r0, #0x5E]
        mov     r1, r1, lsl #16
        cmp     r12, r1, asr #16
        strleh  r3, [r0, #0x60]
        mov     r0, #1
        ldmia   sp!, {r4, pc}
LDOD21:
        ldrsh   r2, [r0, #0x60]
        strh    r1, [r0, #0x5E]
        cmp     r2, #0
        movle   r0, #0
        ldmleia sp!, {r4, pc}
        sub     r2, r2, #1
        strh    r2, [r0, #0x60]
        mov     r0, #1
        ldmia   sp!, {r4, pc}
LDOD22:
        sub     r4, r4, #1
        strh    lr, [r0, #0x5E]
        strh    r4, [r0, #0x6C]
        mov     r0, #1
        ldmia   sp!, {r4, pc}
LDOD23:
        strh    r1, [r0, #0x5E]
        strh    r1, [r0, #0x60]
        strh    r1, [r0, #0x6C]
        strh    r1, [r0, #0x6A]
        mov     r0, #0
        ldmia   sp!, {r4, pc}
        .long   NormTable2
        .long   NormTable
        .long   0x7fff8000


