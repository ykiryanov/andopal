        .text
        .align  4
        .globl  _ippsFFTInv_PermToR_AMRWBE_16s


_ippsFFTInv_PermToR_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xDA, 28
        cmp     r0, #0
        mov     r5, r1
        mov     r6, r2
        beq     LDGJ10
        cmp     r5, #0
        beq     LDGJ10
        mov     r12, sp
        and     r12, r12, #0xF
        rsb     r12, r12, #0
        mov     r3, sp
        and     r12, r12, #0xF
        add     r4, r3, r12
        mov     r2, r6
        mov     r1, r4
        bl      _ippsCopy_16s
        add     r12, sp, #0x91, 28
        ldrsh   r0, [r4, #2]
        and     r12, r12, #0xF
        rsb     r12, r12, #0
        and     r12, r12, #0xF
        add     r3, sp, #0x91, 28
        mov     lr, r6, asr #1
        add     r12, r3, r12
        mov     lr, lr, lsl #16
        add     r11, r4, #4
        mov     r3, lr, asr #16
        cmp     r3, #1
        add     r10, r4, #6
        mov     r9, r12
        ble     LDGJ3
        sub     lr, r3, #1
        cmp     lr, #5
        mov     r8, #1
        blt     LDGJ1
        sub     r7, r3, #5
        add     lr, r4, #2
LDGJ0:
        ldrsh   r1, [r11]
        add     r8, r8, #4
        cmp     r8, r7
        strh    r1, [lr]
        ldrsh   r2, [r11, #4]
        ldrsh   r1, [r10]
        strh    r2, [lr, #2]
        ldrsh   r2, [r11, #8]
        strh    r1, [r9]
        ldrsh   r1, [r10, #4]
        strh    r2, [lr, #4]
        ldrsh   r2, [r11, #0xC]
        add     r11, r11, #0x10
        strh    r1, [r9, #2]
        ldrsh   r1, [r10, #8]
        strh    r2, [lr, #6]
        ldrsh   r2, [r10, #0xC]
        strh    r1, [r9, #4]
        add     lr, lr, #8
        strh    r2, [r9, #6]
        add     r10, r10, #0x10
        add     r9, r9, #8
        ble     LDGJ0
LDGJ1:
        add     lr, r4, r8, lsl #1
LDGJ2:
        ldrsh   r7, [r11], #4
        add     r8, r8, #1
        cmp     r8, r3
        strh    r7, [lr], #2
        ldrsh   r7, [r10], #4
        strh    r7, [r9], #2
        blt     LDGJ2
LDGJ3:
        add     lr, r3, #1
        mov     r3, r3, lsl #1
        cmp     lr, r6
        strh    r0, [r4, +r3]
        bge     LDGJ7
        sub     r3, r6, lr
        cmp     r3, #6
        blt     LDGJ5
        sub     r7, r6, #6
        add     r3, r4, lr, lsl #1
LDGJ4:
        ldrsh   r9, [r12]
        ldrsh   r10, [r12, #2]
        ldrsh   r8, [r12, #4]
        strh    r9, [r3]
        ldrsh   r9, [r12, #6]
        strh    r10, [r3, #2]
        ldrsh   r10, [r12, #8]
        add     lr, lr, #5
        strh    r8, [r3, #4]
        strh    r9, [r3, #6]
        strh    r10, [r3, #8]
        cmp     lr, r7
        add     r3, r3, #0xA
        add     r12, r12, #0xA
        ble     LDGJ4
LDGJ5:
        add     r7, r4, lr, lsl #1
LDGJ6:
        ldrsh   r3, [r12], #2
        add     lr, lr, #1
        cmp     lr, r6
        strh    r3, [r7], #2
        blt     LDGJ6
LDGJ7:
        cmp     r6, #0x12, 28
        beq     LDGJ9
        cmp     r6, #9, 26
        beq     LDGJ9
        cmp     r6, #0x12, 26
        beq     LDGJ9
        cmp     r6, #0x30
        beq     LDGJ8
        cmp     r6, #0x60
        beq     LDGJ8
        cmp     r6, #0xC0
        beq     LDGJ8
        mvn     r0, #5
        add     sp, sp, #0xDA, 28
        ldmia   sp!, {r4 - r11, pc}
LDGJ8:
        mov     r6, r6, lsl #16
        mov     r1, r5
        mov     r2, r6, asr #16
        mov     r0, r4
        bl      LDGJ_ownIFFT3
        mov     r0, #0
        add     sp, sp, #0xDA, 28
        ldmia   sp!, {r4 - r11, pc}
LDGJ9:
        mov     r6, r6, lsl #16
        mov     r1, r5
        mov     r2, r6, asr #16
        mov     r0, r4
        bl      LDGJ_ownIFFT9
        mov     r0, #0
        add     sp, sp, #0xDA, 28
        ldmia   sp!, {r4 - r11, pc}
LDGJ10:
        mvn     r0, #7
        add     sp, sp, #0xDA, 28
        ldmia   sp!, {r4 - r11, pc}
LDGJ_ownIFFT3:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x87, 30
        add     r12, sp, #0x8C
        and     r12, r12, #0xF
        rsb     r12, r12, #0
        str     r2, [sp, #0x7C]
        add     r3, sp, #0x8C
        and     lr, r12, #0xF
        subs    r2, r2, #0xC0
        str     r1, [sp, #0x78]
        add     r7, r3, lr
        beq     LDGJ12
        adds    r1, r2, #0x60
        mov     r4, #4
        mov     r5, #0x10
        beq     LDGJ11
        adds    r1, r1, #0x30
        addne   sp, sp, #0x87, 30
        ldmneia sp!, {r4 - r11, pc}
        mov     r12, r4
        mov     r6, r5
        mov     r2, #0x18
        str     r2, [sp, #0x54]
        mov     r5, #8
        mov     r4, #3
        b       LDGJ13
LDGJ11:
        mov     r8, #0xC
        mov     r12, #5
        mov     r6, #0x20
        str     r8, [sp, #0x54]
        b       LDGJ13
LDGJ12:
        mov     r12, #6
        str     r12, [sp, #0x54]
        mov     r6, #0x40
        mov     r5, #0x20
        mov     r4, #5
LDGJ13:
        ldr     r9, [sp, #0x7C]
        ldrsh   r8, [r0]
        sub     r10, r6, #1
        mov     r1, r9, asr #1
        mov     r9, r6, lsl #1
        str     r9, [sp, #0x84]
        str     r8, [sp, #0x70]
        str     r1, [sp, #0x80]
        ldrsh   r2, [r0, +r9]
        add     r9, r6, r1
        add     r3, r9, #1
        str     r2, [sp, #0x88]
        add     r2, r8, r2, lsl #1
        str     r3, [sp, #0x68]
        add     r8, r2, #1
        add     r3, r7, r10, lsl #1
        str     r3, [sp, #0x20]
        add     r2, r6, #1
        str     r2, [sp, #0x6C]
        mov     r8, r8, asr #1
        add     r3, sp, #0x8C
        strh    r8, [lr, +r3]
        add     r1, r1, #1
        sub     r2, r9, #1
        add     lr, r0, r10, lsl #1
        add     r1, r0, r1, lsl #1
        str     lr, [sp, #0x28]
        ldr     lr, [sp, #0x6C]
        add     r2, r0, r2, lsl #1
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x68]
        str     r2, [sp, #0x24]
        mov     r11, r6, asr #1
        add     r2, r7, #2
        cmp     r11, #1
        add     r8, r0, #2
        add     lr, r0, lr, lsl #1
        add     r1, r0, r1, lsl #1
        str     r2, [sp, #0x18]
        ble     LDGJ15
        sub     r2, r11, #1
        str     r9, [sp, #0x48]
        str     r11, [sp, #0x4C]
        str     r10, [sp, #0x3C]
        str     r6, [sp, #0x50]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        ldr     r6, [sp, #0x20]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r12, [sp, #0x30]
        str     r0, [sp, #0x74]
LDGJ14:
        ldrsh   r0, [lr], #2
        ldrsh   r12, [r11], #-2
        ldrsh   r3, [r8], #2
        subs    r2, r2, #1
        str     r12, [sp, #0x6C]
        ldrsh   r4, [r9], #2
        ldrsh   r12, [r1], #2
        ldrsh   r5, [r10], #-2
        add     r0, r3, r0
        ldr     r3, [sp, #0x6C]
        add     r12, r4, r12
        sub     r12, r12, r5
        add     r0, r0, r3
        add     r0, r0, #1
        add     r3, r12, #1
        mov     r0, r0, asr #1
        strh    r0, [r7], #2
        mov     r3, r3, asr #1
        strh    r3, [r6], #-2
        bne     LDGJ14
        str     r7, [sp, #0x18]
        ldr     r9, [sp, #0x48]
        ldr     r11, [sp, #0x4C]
        ldr     r10, [sp, #0x3C]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x50]
        ldr     r12, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        ldr     r0, [sp, #0x74]
LDGJ15:
        ldrsh   r1, [r8]
        ldrsh   lr, [lr]
        ldr     r3, [sp, #0x18]
        mov     r8, r9, lsl #1
        ldrsh   r8, [r0, +r8]
        add     r1, lr, r1, lsl #1
        mov     r2, #1
        str     r2, [sp, #0x10]
        rsb     lr, r12, #7
        add     r1, r1, #1
        mov     r2, r2, lsl lr
        ldr     lr, [pc, #0x5D4]
        mov     r1, r1, asr #1
        sub     lr, lr, #0x2D, 26
        str     lr, [sp, #0x14]
        strh    r1, [r3]
        mov     r1, #0
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x70]
        mvn     r3, #0
        str     r3, [sp, #0x18]
        mov     r1, r1, lsl #13
        str     r1, [sp, #0x20]
        rsb     r1, r8, #0
        str     r1, [sp, #0x24]
        str     lr, [sp, #0x1C]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x50]
        ldr     lr, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        ldr     r4, [sp, #0x28]
        ldr     r6, [sp, #0x54]
        add     r1, r2, r2, lsl #1
        mvn     r2, #2, 2
        str     r2, [sp, #0x64]
        str     r1, [sp, #0x44]
        str     r8, [sp, #0x40]
        str     r9, [sp, #0x48]
        str     r11, [sp, #0x4C]
        str     r10, [sp, #0x3C]
        str     r12, [sp, #0x30]
        str     r7, [sp, #0x2C]
LDGJ16:
        ldr     r1, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        ldr     r12, [sp, #0x88]
        add     r1, r1, #3, 24
        str     r1, [sp, #0x1C]
        mov     r2, #9, 26
        ldrsh   r2, [r2, +r1]
        ldrsh   r1, [r1]
        ldr     r7, [sp, #0x24]
        mla     r3, r12, r2, r3
        ldr     r2, [sp, #0x30]
        add     r4, r4, #6, 26
        mov     r12, r4, lsl #1
        cmp     r12, #0x12, 26
        mla     r3, r7, r1, r3
        ldr     r1, [sp, #0x2C]
        mov     r2, r5, lsl r2
        add     r2, r1, r2, lsl #1
        subge   r12, r12, #0x12, 26
        mov     r12, r12, lsl #1
        add     r1, lr, r12
        add     r1, r1, #9, 26
        ldr     r8, [sp, #0x88]
        ldrsh   r7, [r1]
        ldrsh   r1, [lr, +r12]
        add     r12, r2, #2
        mla     r3, r8, r7, r3
        ldr     r8, [sp, #0x4C]
        ldr     r7, [sp, #0x3C]
        cmp     r8, #1
        ldr     r8, [sp, #0x40]
        add     r7, r2, r7, lsl #1
        mla     r3, r1, r8, r3
        add     r1, r3, #2, 20
        mov     r1, r1, asr #14
        strh    r1, [r2]
        movle   r1, #0
        movle   r3, #1
        ble     LDGJ20
        ldr     r8, [sp, #0x80]
        mov     r1, #0
        mov     r3, #1
        add     r8, r8, #1
        add     r2, r0, #2
        str     r8, [sp, #0x6C]
        str     r7, [sp, #0x58]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0x54]
LDGJ17:
        ldr     r5, [sp, #0x54]
        add     r1, r5, r1
        cmp     r1, #0x12, 26
        subge   r1, r1, #0x12, 26
        ldrsh   r8, [r2]
        add     r5, lr, r1, lsl #1
        add     r5, r5, #9, 26
        ldrsh   r7, [r5]
        ldr     r5, [sp, #0x50]
        ldr     r9, [sp, #0x48]
        sub     r6, r5, r3
        ldr     r5, [sp, #0x6C]
        sub     r9, r9, r3
        mov     r6, r6, lsl #1
        str     r6, [sp, #0x60]
        mul     r6, r8, r7
        mov     r5, r5, lsl #1
        add     r10, r0, r5
        mov     r9, r9, lsl #1
        cmp     r6, #1, 2
        str     r10, [sp, #0x68]
        str     r9, [sp, #0x5C]
        mvneq   r10, #2, 2
        movne   r10, r6, lsl #1
        mov     r6, r1, lsl #1
        ldrsh   r6, [lr, +r6]
        ldrsh   r5, [r0, +r5]
        mul     r9, r6, r5
        cmp     r9, #1, 2
        mvneq   r11, #2, 2
        movne   r11, r9, lsl #1
        subs    r9, r10, r11
        mov     r11, r11, asr #31
        rsc     r11, r11, r10, asr #31
        ldr     r10, [sp, #0x64]
        str     r11, [sp, #0x70]
        subs    r10, r9, r10
        sbcs    r11, r11, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r9, #2, 2
        bne     LDGJ18
        ldr     r10, [sp, #0x18]
        ldr     r11, [sp, #0x70]
        cmp     r9, #2, 2
        sbcs    r11, r11, r10
        movlt   r9, #2, 2
LDGJ18:
        mul     r6, r8, r6
        cmp     r6, #1, 2
        mvneq   r6, #2, 2
        movne   r6, r6, lsl #1
        mul     r5, r7, r5
        cmp     r5, #1, 2
        mvneq   r5, #2, 2
        movne   r5, r5, lsl #1
        adds    r8, r6, r5
        mov     r5, r5, asr #31
        adc     r6, r5, r6, asr #31
        ldr     r5, [sp, #0x64]
        subs    r5, r8, r5
        sbcs    r7, r6, #0
        movlt   r5, #0
        movlt   r7, #0
        orrs    r7, r5, r7
        mvnne   r8, #2, 2
        bne     LDGJ19
        ldr     r5, [sp, #0x18]
        cmp     r8, #2, 2
        sbcs    r6, r6, r5
        movlt   r8, #2, 2
LDGJ19:
        add     r1, r4, r1
        cmp     r1, #0x12, 26
        subge   r1, r1, #0x12, 26
        ldr     r7, [sp, #0x84]
        ldr     r10, [sp, #0x68]
        mov     r6, r1, lsl #1
        ldrsh   r11, [r2, +r7]
        add     r5, lr, r6
        add     r5, r5, #9, 26
        ldrsh   r7, [r10, +r7]
        ldrsh   r5, [r5]
        ldrsh   r6, [lr, +r6]
        add     r1, r4, r1
        mul     r10, r11, r5
        cmp     r1, #0x12, 26
        mul     r11, r11, r6
        mul     r6, r6, r7
        mul     r7, r5, r7
        add     r10, r9, r10, lsl #1
        add     r11, r8, r11, lsl #1
        sub     r10, r10, r6, lsl #1
        add     r9, r11, r7, lsl #1
        subge   r1, r1, #0x12, 26
        mov     r6, r1, lsl #1
        ldr     r5, [sp, #0x60]
        add     r7, lr, r6
        add     r7, r7, #9, 26
        ldrsh   r8, [r7]
        ldrsh   r5, [r0, +r5]
        ldrsh   r7, [lr, +r6]
        ldr     r6, [sp, #0x5C]
        add     r1, r4, r1
        mul     r11, r8, r5
        mul     r5, r7, r5
        ldrsh   r6, [r0, +r6]
        cmp     r1, #0x12, 26
        mul     r7, r7, r6
        add     r11, r10, r11, lsl #1
        mul     r6, r8, r6
        add     r5, r9, r5, lsl #1
        add     r7, r11, r7, lsl #1
        sub     r5, r5, r6, lsl #1
        subge   r1, r1, #0x12, 26
        mov     r7, r7, lsl #1
        add     r6, r7, #2, 18
        mov     r5, r5, lsl #1
        mov     r6, r6, asr #16
        strh    r6, [r12], #2
        add     r5, r5, #2, 18
        add     r3, r3, #1
        mov     r6, r5, asr #16
        ldr     r5, [sp, #0x58]
        add     r2, r2, #2
        strh    r6, [r5], #-2
        ldr     r6, [sp, #0x4C]
        str     r5, [sp, #0x58]
        ldr     r5, [sp, #0x6C]
        cmp     r3, r6
        add     r5, r5, #1
        str     r5, [sp, #0x6C]
        blt     LDGJ17
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #0x54]
LDGJ20:
        add     r2, r6, r1
        cmp     r2, #0x12, 26
        subge   r2, r2, #0x12, 26
        ldr     r1, [sp, #0x80]
        mov     r9, r2, lsl #1
        add     r8, lr, r9
        add     r7, r1, r3
        ldrsh   r9, [lr, +r9]
        mov     r1, r3, lsl #1
        mov     r7, r7, lsl #1
        ldrsh   r7, [r0, +r7]
        add     r8, r8, #9, 26
        ldrsh   r8, [r8]
        ldrsh   r10, [r0, +r1]
        mul     r9, r9, r7
        ldr     r7, [sp, #0x50]
        add     r2, r4, r2
        mul     r8, r10, r8
        ldr     r10, [sp, #0x48]
        sub     r7, r7, r3
        add     r1, r0, r1
        sub     r3, r10, r3
        cmp     r2, #0x12, 26
        mov     r7, r7, lsl #1
        mov     r3, r3, lsl #1
        sub     r8, r8, r9
        subge   r2, r2, #0x12, 26
        ldr     r9, [sp, #0x84]
        ldrsh   r10, [r1, +r9]
        mov     r9, r2, lsl #1
        add     r1, lr, r9
        add     r1, r1, #9, 26
        ldrsh   r1, [r1]
        ldrsh   r9, [lr, +r9]
        rsb     r11, r10, #0
        mla     r8, r10, r1, r8
        add     r2, r4, r2
        cmp     r2, #0x12, 26
        mla     r9, r11, r9, r8
        subge   r2, r2, #0x12, 26
        mov     r2, r2, lsl #1
        add     r1, lr, r2
        add     r1, r1, #9, 26
        ldrsh   r1, [r1]
        ldrsh   r7, [r0, +r7]
        ldrsh   r2, [lr, +r2]
        ldrsh   r3, [r0, +r3]
        ldr     r8, [sp, #0x44]
        mla     r9, r7, r1, r9
        add     r5, r5, #1
        add     r6, r6, r8
        cmp     r5, #3
        mla     r9, r3, r2, r9
        mov     r1, r9, lsl #1
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r12]
        blt     LDGJ16
        ldr     r12, [sp, #0x84]
        ldr     r7, [sp, #0x2C]
        ldr     r6, [sp, #0x50]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r9, [pc, #0x180]
        add     r8, r7, r12
        add     r12, r8, r12
        str     r12, [sp, #0x14]
        subs    r12, r6, #0x80
        ldreq   r10, [pc, #0x170]
        addeq   r9, r9, #7, 26
        beq     LDGJ21
        adds    r12, r12, #0x40
        ldreq   r10, [pc, #0x164]
        addeq   r9, r9, #0xC0
        beq     LDGJ21
        adds    r12, r12, #0x20
        ldreq   r10, [pc, #0x158]
        addeq   r9, r9, #0x40
        beq     LDGJ21
        adds    r12, r12, #0x10
        ldreq   r10, [pc, #0x14C]
        movne   r9, #0
        movne   r10, r9
LDGJ21:
        mvn     r11, #0
        str     r9, [sp, #4]
        str     r10, [sp]
        str     r11, [sp, #8]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r6
        mov     r0, r7
        bl      LDGJ_ownRFFT
        str     r11, [sp, #8]
        str     r9, [sp, #4]
        str     r10, [sp]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r6
        mov     r0, r8
        bl      LDGJ_ownRFFT
        str     r11, [sp, #8]
        str     r9, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #0x14]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r6
        bl      LDGJ_ownRFFT
        ldr     r2, [sp, #0x7C]
        mov     r1, #0xAB
        orr     r1, r1, #0x2A, 24
        mul     r1, r2, r1
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, #0
        ble     LDGJ23
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x78]
LDGJ22:
        ldrsh   lr, [r7], #2
        ldrsh   r12, [r8], #2
        subs    r1, r1, #1
        strh    lr, [r2]
        ldrsh   lr, [r3], #2
        strh    r12, [r2, #2]
        strh    lr, [r2, #4]
        add     r2, r2, #6
        bne     LDGJ22
LDGJ23:
        add     sp, sp, #0x87, 30
        ldmia   sp!, {r4 - r11, pc}
LDGJ_ownIFFT9:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x27, 26
        add     r12, sp, #0xB0
        and     r12, r12, #0xF
        rsb     r12, r12, #0
        str     r1, [sp, #0x8C]
        add     r3, sp, #0xB0
        and     r12, r12, #0xF
        subs    r1, r2, #0x12, 26
        add     r8, r3, r12
        beq     LDGJ25
        adds    r1, r1, #9, 26
        mov     r5, #5
        mov     r7, #0x20
        beq     LDGJ24
        adds    r1, r1, #0x12, 28
        addne   sp, sp, #0x27, 26
        ldmneia sp!, {r4 - r11, pc}
        str     r5, [sp, #0x90]
        mov     r5, #4
        mov     r6, r7
        str     r5, [sp, #0x94]
        mov     r7, #0x10
        b       LDGJ26
LDGJ24:
        mov     r1, #6
        mov     lr, #2
        str     r1, [sp, #0x90]
        mov     r6, #0x40
        str     lr, [sp, #0x94]
        b       LDGJ26
        .long   LDGJ_phs_tbl_stg
        .long   LDGJ_ii_tbl_stg
        .long   LDGJ_ii_tbl_stg
        .long   LDGJ_ii_tbl_stg
        .long   LDGJ_ii_tbl_stg
LDGJ25:
        mov     r1, #7
        mov     r3, #1
        str     r1, [sp, #0x90]
        mov     r6, #0x80
        str     r3, [sp, #0x94]
        mov     r7, #0x40
        mov     r5, #6
LDGJ26:
        ldrsh   r10, [r0]
        mov     r4, r6, lsl #1
        ldrsh   r1, [r0, +r4]
        add     lr, r0, r4
        sub     r3, r6, #1
        str     r1, [sp, #0x9C]
        ldrsh   r9, [lr, +r4]
        add     lr, r4, lr
        str     lr, [sp, #0xA0]
        str     r9, [sp, #0xA4]
        ldrsh   r11, [lr, +r4]
        add     r1, r10, r1, lsl #1
        add     lr, r4, lr
        ldrsh   lr, [lr, +r4]
        add     r9, r1, r9, lsl #1
        add     r11, r9, r11, lsl #1
        mov     r9, r6, lsl #2
        mov     r1, r2, asr #1
        str     r9, [sp, #0xAC]
        add     lr, r11, lr, lsl #1
        add     r9, r1, r9
        str     r9, [sp, #0xA8]
        mov     lr, lr, lsl #14
        str     r3, [sp, #0x98]
        add     r9, r1, r6
        add     lr, lr, #1, 18
        str     r9, [sp, #0x7C]
        add     r3, r8, r3, lsl #1
        str     r3, [sp, #0x84]
        mov     lr, lr, asr #15
        add     r9, sp, #0xB0
        strh    lr, [r12, +r9]
        mov     r11, r6, asr #1
        add     r12, r8, #2
        cmp     r11, #1
        str     r12, [sp, #0x78]
        ble     LDGJ28
        str     r8, [sp, #0x54]
        ldr     r8, [sp, #0x78]
        mov     r9, #1
        add     lr, r0, #2
        add     r12, r1, #1
        str     r10, [sp, #0x74]
        str     r11, [sp, #0x30]
        str     r1, [sp, #0x44]
        str     r5, [sp, #0x48]
        str     r7, [sp, #0x4C]
        str     r6, [sp, #0x50]
        str     r2, [sp, #0x88]
LDGJ27:
        ldrsh   r7, [lr]
        ldrsh   r2, [lr, +r4]
        mov     r1, r12, lsl #1
        add     r5, r0, r1
        add     r10, r4, lr
        str     r2, [sp, #0x80]
        ldrsh   r1, [r0, +r1]
        add     lr, lr, #2
        add     r12, r12, #1
        str     r1, [sp, #0x70]
        ldrsh   r3, [r5, +r4]
        ldr     r1, [sp, #0xAC]
        ldrsh   r6, [r10, +r4]
        add     r10, r4, r10
        add     r5, r4, r5
        sub     r1, r1, r9
        mov     r2, r1, lsl #1
        ldrsh   r1, [r0, +r2]
        add     r2, r0, r2
        sub     r2, r2, r4
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0xA8]
        ldrsh   r11, [r10, +r4]
        add     r10, r4, r10
        sub     r1, r1, r9
        add     r9, r9, #1
        str     r11, [sp, #0x68]
        ldrsh   r11, [r5, +r4]
        mov     r1, r1, lsl #1
        str     r11, [sp, #0x64]
        ldrsh   r11, [r0, +r1]
        add     r1, r0, r1
        sub     r1, r1, r4
        str     r11, [sp, #0x60]
        ldrsh   r10, [r10, +r4]
        ldr     r11, [sp, #0x80]
        str     r10, [sp, #0x5C]
        ldrsh   r10, [r2]
        sub     r2, r2, r4
        add     r7, r11, r7
        ldr     r11, [sp, #0x68]
        str     r10, [sp, #0x58]
        add     r10, r4, r5
        ldrsh   r5, [r10, +r4]
        add     r10, r4, r10
        ldrsh   r10, [r10, +r4]
        str     r10, [sp, #0x80]
        add     r10, r6, r7
        ldr     r6, [sp, #0x70]
        ldrsh   r7, [r2]
        add     r10, r11, r10
        ldr     r11, [sp, #0x64]
        add     r3, r6, r3
        ldrsh   r6, [r1]
        sub     r1, r1, r4
        add     r3, r3, r11
        ldr     r11, [sp, #0x5C]
        sub     r2, r2, r4
        ldrsh   r2, [r2]
        add     r5, r3, r5
        add     r10, r10, r11
        ldr     r11, [sp, #0x6C]
        ldrsh   r3, [r1]
        sub     r1, r1, r4
        ldrsh   r1, [r1]
        add     r10, r10, r11
        ldr     r11, [sp, #0x80]
        add     r5, r5, r11
        ldr     r11, [sp, #0x58]
        add     r10, r10, r11
        ldr     r11, [sp, #0x60]
        add     r7, r10, r7
        add     r2, r7, r2
        sub     r5, r5, r11
        sub     r5, r5, r6
        sub     r5, r5, r3
        sub     r3, r5, r1
        mov     r2, r2, lsl #14
        add     r1, r2, #1, 18
        mov     r3, r3, lsl #14
        mov     r1, r1, asr #15
        strh    r1, [r8], #2
        ldr     r1, [sp, #0x84]
        add     r2, r3, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r1]
        ldr     r1, [sp, #0x30]
        cmp     r9, r1
        ldr     r1, [sp, #0x84]
        sub     r1, r1, #2
        str     r1, [sp, #0x84]
        blt     LDGJ27
        str     r8, [sp, #0x78]
        ldr     r10, [sp, #0x74]
        ldr     r11, [sp, #0x30]
        ldr     r1, [sp, #0x44]
        ldr     r5, [sp, #0x48]
        ldr     r7, [sp, #0x4C]
        ldr     r6, [sp, #0x50]
        ldr     r8, [sp, #0x54]
        ldr     r2, [sp, #0x88]
LDGJ28:
        mov     r9, r11, lsl #1
        add     r12, r0, r9
        str     r12, [sp, #0x80]
        str     r9, [sp, #0x84]
        ldrsh   r9, [r0, +r9]
        ldrsh   lr, [r12, +r4]
        add     r12, r4, r12
        str     r9, [sp, #0x70]
        ldrsh   r9, [r12, +r4]
        add     r12, r4, r12
        ldrsh   r3, [r12, +r4]
        add     r12, r4, r12
        ldrsh   r12, [r12, +r4]
        mov     lr, lr, lsl #1
        sub     r2, r2, r6
        mov     r10, r10, lsl #13
        str     r12, [sp, #0x6C]
        ldr     r12, [sp, #0x70]
        mov     r2, r2, lsl #1
        add     lr, lr, r12, lsl #1
        ldrsh   r12, [r0, +r2]
        add     r9, lr, r9, lsl #1
        ldr     lr, [sp, #0x6C]
        add     r3, r9, r3, lsl #1
        str     r12, [sp, #0x5C]
        add     r2, r0, r2
        add     lr, r3, lr
        ldr     r3, [sp, #0x7C]
        sub     r12, r2, r4
        sub     r9, r1, r6
        mov     r3, r3, lsl #1
        str     r3, [sp, #0x58]
        ldrsh   r3, [r0, +r3]
        mov     lr, lr, lsl #14
        str     lr, [sp, #0x88]
        str     r3, [sp, #0x70]
        add     r2, r1, r11
        sub     lr, r12, r4
        str     lr, [sp, #0x7C]
        mov     r2, r2, lsl #1
        ldrsh   r3, [r0, +r2]
        mov     r9, r9, lsl #1
        add     r2, r0, r2
        str     r3, [sp, #0x6C]
        ldrsh   r3, [r0, +r9]
        add     r9, r0, r9
        str     r3, [sp, #0x68]
        ldrsh   lr, [lr]
        mov     r3, #0
        str     lr, [sp, #0x64]
        ldrsh   r12, [r12]
        str     r12, [sp, #0x60]
        ldr     r12, [sp, #0x88]
        str     r3, [sp, #0x88]
        ldr     r3, [sp, #0x78]
        add     lr, r12, #1, 18
        ldr     r12, [pc, #-0x370]
        mov     lr, lr, asr #15
        strh    lr, [r3]
        str     r10, [sp, #0x78]
        ldr     r10, [sp, #0x58]
        sub     r12, r12, #0x2D, 26
        mov     lr, #1
        add     r10, r0, r10
        str     r10, [sp, #0x74]
        ldr     r10, [sp, #0x90]
        str     r6, [sp, #0x50]
        ldr     r6, [sp, #0x88]
        rsb     r10, r10, #7
        str     r10, [sp, #0x58]
        mov     r10, r12
        str     r10, [sp, #0x34]
        str     r2, [sp, #0x38]
        str     r9, [sp, #0x3C]
        str     r11, [sp, #0x30]
        str     r1, [sp, #0x44]
        str     r5, [sp, #0x48]
        str     r7, [sp, #0x4C]
        str     r8, [sp, #0x54]
LDGJ29:
        ldr     r1, [sp, #0x34]
        ldr     r5, [sp, #0x78]
        ldr     r8, [sp, #0x54]
        add     r2, r1, #1, 24
        str     r2, [sp, #0x34]
        mov     r1, #9, 26
        ldrsh   r1, [r1, +r2]
        ldrsh   r3, [r2]
        ldr     r2, [sp, #0x9C]
        add     r6, r6, #0x80
        mla     r1, r1, r2, r5
        ldr     r5, [sp, #0x70]
        mov     r2, r6, lsl #1
        cmp     r2, #0x12, 26
        mul     r3, r3, r5
        ldr     r5, [sp, #0x90]
        mov     r7, lr, lsl r5
        ldr     r5, [sp, #0x74]
        add     r7, r8, r7, lsl #1
        sub     r9, r1, r3
        add     r5, r4, r5
        subge   r2, r2, #0x12, 26
        mov     r1, r2, lsl #1
        add     r3, r12, r1
        add     r3, r3, #9, 26
        ldrsh   r8, [r3]
        ldr     r3, [sp, #0x74]
        ldr     r10, [sp, #0xA4]
        ldrsh   r1, [r12, +r1]
        add     r2, r6, r2
        mla     r9, r10, r8, r9
        ldrsh   r3, [r3, +r4]
        cmp     r2, #0x12, 26
        rsb     r8, r3, #0
        ldr     r3, [sp, #0xA0]
        mla     r11, r8, r1, r9
        add     r1, r4, r5
        add     r3, r4, r3
        subge   r2, r2, #0x12, 26
        ldr     r10, [sp, #0xA0]
        mov     r8, r2, lsl #1
        add     r9, r12, r8
        add     r9, r9, #9, 26
        ldrsh   r5, [r5, +r4]
        ldrsh   r9, [r9]
        ldrsh   r10, [r10, +r4]
        str     r5, [sp, #0x28]
        ldrsh   r8, [r12, +r8]
        add     r5, r4, r3
        mla     r11, r10, r9, r11
        str     r5, [sp, #0x2C]
        ldr     r5, [sp, #0x28]
        rsb     r9, r5, #0
        add     r5, r6, r2
        mla     r8, r9, r8, r11
        cmp     r5, #0x12, 26
        add     r2, r4, r1
        subge   r5, r5, #0x12, 26
        ldrsh   r3, [r3, +r4]
        mov     r10, r5, lsl #1
        add     r9, r12, r10
        add     r9, r9, #9, 26
        ldrsh   r9, [r9]
        ldrsh   r1, [r1, +r4]
        ldrsh   r10, [r12, +r10]
        mla     r8, r3, r9, r8
        add     r5, r6, r5
        rsb     r9, r1, #0
        cmp     r5, #0x12, 26
        mla     r10, r9, r10, r8
        subge   r5, r5, #0x12, 26
        mov     r8, r5, lsl #1
        add     r9, r12, r8
        add     r9, r9, #9, 26
        ldrsh   r9, [r9]
        ldrsh   r8, [r12, +r8]
        ldr     r11, [sp, #0x2C]
        mla     r10, r3, r9, r10
        add     r3, r6, r5
        sub     r11, r11, r4
        cmp     r3, #0x12, 26
        sub     r5, r2, r4
        mla     r8, r1, r8, r10
        subge   r3, r3, #0x12, 26
        mov     r2, r3, lsl #1
        add     r1, r12, r2
        add     r1, r1, #9, 26
        ldrsh   r9, [r11]
        ldrsh   r1, [r1]
        ldrsh   r10, [r5]
        ldrsh   r2, [r12, +r2]
        sub     r11, r11, r4
        mla     r8, r9, r1, r8
        add     r3, r6, r3
        cmp     r3, #0x12, 26
        sub     r5, r5, r4
        mla     r10, r10, r2, r8
        subge   r3, r3, #0x12, 26
        mov     r2, r3, lsl #1
        add     r1, r12, r2
        add     r1, r1, #9, 26
        ldrsh   r8, [r11]
        ldrsh   r1, [r1]
        ldrsh   r2, [r12, +r2]
        ldrsh   r9, [r5]
        sub     r11, r11, r4
        mla     r10, r8, r1, r10
        add     r3, r6, r3
        cmp     r3, #0x12, 26
        sub     r5, r5, r4
        mla     r2, r9, r2, r10
        subge   r3, r3, #0x12, 26
        ldrsh   r11, [r11]
        mov     r3, r3, lsl #1
        add     r1, r12, r3
        add     r1, r1, #9, 26
        ldrsh   r1, [r1]
        ldrsh   r5, [r5]
        ldrsh   r3, [r12, +r3]
        mla     r2, r11, r1, r2
        ldr     r1, [sp, #0x98]
        add     r8, r7, #2
        str     r8, [sp, #0x20]
        ldr     r8, [sp, #0x30]
        mla     r2, r5, r3, r2
        add     r1, r7, r1, lsl #1
        cmp     r8, #1
        mov     r2, r2, lsl #1
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r7]
        movle   r2, #0
        ble     LDGJ31
        ldr     r7, [sp, #0x44]
        mov     r3, #1
        mov     r2, #0
        add     r7, r7, #1
        add     r5, r0, #2
        str     r7, [sp, #0x18]
        str     r3, [sp, #0x10]
        str     r1, [sp, #0x2C]
        str     lr, [sp, #0x40]
LDGJ30:
        ldr     r1, [sp, #0x94]
        add     r1, r2, r1
        cmp     r1, #0x12, 26
        subge   r1, r1, #0x12, 26
        ldrsh   r2, [r5]
        mov     r7, r1, lsl #1
        ldrsh   lr, [r12, +r7]
        ldr     r3, [sp, #0x18]
        ldr     r8, [sp, #0x10]
        add     r7, r12, r7
        mul     r11, r2, lr
        mov     r3, r3, lsl #1
        ldrsh   r10, [r0, +r3]
        add     r7, r7, #9, 26
        ldrsh   r9, [r7]
        mul     lr, lr, r10
        ldr     r7, [sp, #0xAC]
        add     r1, r6, r1
        mul     r2, r2, r9
        mla     r10, r9, r10, r11
        ldr     r9, [sp, #0xA8]
        sub     r7, r7, r8
        add     r3, r0, r3
        cmp     r1, #0x12, 26
        sub     r8, r9, r8
        mov     r7, r7, lsl #1
        str     r7, [sp, #0x14]
        mov     r8, r8, lsl #1
        str     r8, [sp, #0x1C]
        add     r7, r0, r7
        add     r8, r0, r8
        str     r7, [sp, #0x24]
        str     r8, [sp, #0x28]
        sub     r9, r2, lr
        add     r8, r4, r5
        add     r7, r4, r3
        subge   r1, r1, #0x12, 26
        ldrsh   r11, [r5, +r4]
        mov     lr, r1, lsl #1
        add     r2, r12, lr
        add     r2, r2, #9, 26
        ldrsh   lr, [r12, +lr]
        ldrsh   r2, [r2]
        ldrsh   r3, [r3, +r4]
        mla     r10, r11, lr, r10
        add     r1, r6, r1
        mla     r9, r11, r2, r9
        rsb     r11, r3, #0
        cmp     r1, #0x12, 26
        mla     r3, r2, r3, r10
        mla     lr, r11, lr, r9
        subge   r1, r1, #0x12, 26
        ldrsh   r9, [r8, +r4]
        mov     r2, r1, lsl #1
        ldrsh   r10, [r12, +r2]
        add     r2, r12, r2
        add     r2, r2, #9, 26
        ldrsh   r2, [r2]
        mla     r3, r9, r10, r3
        ldrsh   r11, [r7, +r4]
        mla     lr, r9, r2, lr
        add     r1, r6, r1
        mul     r10, r10, r11
        mla     r3, r2, r11, r3
        cmp     r1, #0x12, 26
        add     r8, r4, r8
        add     r7, r4, r7
        sub     lr, lr, r10
        subge   r1, r1, #0x12, 26
        ldrsh   r11, [r8, +r4]
        mov     r2, r1, lsl #1
        ldrsh   r10, [r12, +r2]
        add     r2, r12, r2
        add     r2, r2, #9, 26
        ldrsh   r2, [r2]
        mla     r3, r11, r10, r3
        ldrsh   r9, [r7, +r4]
        mla     lr, r11, r2, lr
        add     r1, r6, r1
        mul     r10, r10, r9
        mla     r3, r2, r9, r3
        add     r2, r4, r8
        cmp     r1, #0x12, 26
        add     r8, r4, r7
        sub     r10, lr, r10
        subge   r1, r1, #0x12, 26
        ldrsh   lr, [r2, +r4]
        mov     r2, r1, lsl #1
        ldrsh   r7, [r12, +r2]
        add     r2, r12, r2
        add     r2, r2, #9, 26
        ldrsh   r2, [r2]
        mla     r3, lr, r7, r3
        ldrsh   r8, [r8, +r4]
        mla     lr, lr, r2, r10
        add     r1, r6, r1
        mul     r7, r7, r8
        mla     r10, r2, r8, r3
        cmp     r1, #0x12, 26
        sub     r9, lr, r7
        subge   r1, r1, #0x12, 26
        ldr     r3, [sp, #0x14]
        mov     r2, r1, lsl #1
        ldrsh   r7, [r12, +r2]
        ldrsh   r8, [r0, +r3]
        add     r3, r12, r2
        add     r3, r3, #9, 26
        ldrsh   r3, [r3]
        ldr     r2, [sp, #0x1C]
        mla     r10, r7, r8, r10
        mla     r9, r3, r8, r9
        ldrsh   lr, [r0, +r2]
        add     r2, r6, r1
        cmp     r2, #0x12, 26
        mla     r8, r7, lr, r9
        rsb     r1, lr, #0
        mla     r9, r1, r3, r10
        subge   r2, r2, #0x12, 26
        mov     r7, r2, lsl #1
        add     r1, r12, r7
        ldr     r3, [sp, #0x24]
        add     r1, r1, #9, 26
        ldrsh   lr, [r1]
        ldr     r1, [sp, #0x28]
        sub     r3, r3, r4
        ldrsh   r10, [r3]
        ldrsh   r7, [r12, +r7]
        sub     r1, r1, r4
        ldrsh   r11, [r1]
        mla     r8, lr, r10, r8
        mla     r9, r7, r10, r9
        add     r2, r6, r2
        mul     lr, lr, r11
        mla     r8, r7, r11, r8
        cmp     r2, #0x12, 26
        sub     r7, r9, lr
        subge   r2, r2, #0x12, 26
        mov     r9, r2, lsl #1
        add     lr, r12, r9
        add     lr, lr, #9, 26
        ldrsh   lr, [lr]
        sub     r3, r3, r4
        ldrsh   r10, [r3]
        ldrsh   r9, [r12, +r9]
        sub     r1, r1, r4
        ldrsh   r11, [r1]
        mla     r8, lr, r10, r8
        mla     r7, r9, r10, r7
        add     r2, r6, r2
        mul     lr, lr, r11
        mla     r8, r9, r11, r8
        cmp     r2, #0x12, 26
        sub     lr, r7, lr
        subge   r2, r2, #0x12, 26
        mov     r9, r2, lsl #1
        add     r10, r12, r9
        sub     r7, r3, r4
        add     r10, r10, #9, 26
        ldrsh   r3, [r10]
        ldrsh   r7, [r7]
        sub     r1, r1, r4
        ldrsh   r9, [r12, +r9]
        ldrsh   r1, [r1]
        mla     r8, r3, r7, r8
        add     r2, r6, r2
        mla     lr, r9, r7, lr
        mul     r3, r3, r1
        cmp     r2, #0x12, 26
        mla     r8, r9, r1, r8
        sub     lr, lr, r3
        subge   r2, r2, #0x12, 26
        mov     r8, r8, lsl #1
        add     r1, r8, #1, 18
        mov     r3, lr, lsl #1
        mov     lr, r1, asr #15
        ldr     r1, [sp, #0x20]
        add     r3, r3, #1, 18
        add     r5, r5, #2
        strh    lr, [r1], #2
        ldr     lr, [sp, #0x10]
        mov     r7, r3, asr #15
        ldr     r3, [sp, #0x2C]
        add     lr, lr, #1
        str     lr, [sp, #0x10]
        strh    r7, [r3], #-2
        ldr     r7, [sp, #0x30]
        str     r1, [sp, #0x20]
        cmp     lr, r7
        ldr     lr, [sp, #0x18]
        str     r3, [sp, #0x2C]
        add     lr, lr, #1
        str     lr, [sp, #0x18]
        blt     LDGJ30
        ldr     lr, [sp, #0x40]
LDGJ31:
        ldr     r1, [sp, #0x94]
        add     r2, r2, r1
        cmp     r2, #0x12, 26
        subge   r2, r2, #0x12, 26
        ldr     r5, [sp, #0x84]
        mov     r3, r2, lsl #1
        add     r1, r12, r3
        add     r1, r1, #9, 26
        ldrsh   r1, [r1]
        ldrsh   r5, [r0, +r5]
        ldrsh   r3, [r12, +r3]
        add     r2, r6, r2
        cmp     r2, #0x12, 26
        mul     r1, r5, r1
        ldr     r5, [sp, #0x6C]
        mul     r3, r5, r3
        sub     r8, r1, r3
        subge   r2, r2, #0x12, 26
        ldr     r10, [sp, #0x80]
        ldr     r5, [sp, #0x38]
        mov     r3, r2, lsl #1
        add     r1, r12, r3
        add     r1, r1, #9, 26
        ldrsh   r7, [r5, +r4]
        ldrsh   r1, [r1]
        ldrsh   r9, [r10, +r4]
        ldrsh   r3, [r12, +r3]
        add     r2, r6, r2
        mla     r8, r9, r1, r8
        add     r1, r4, r10
        mul     r7, r7, r3
        cmp     r2, #0x12, 26
        add     r3, r4, r5
        sub     r9, r8, r7
        subge   r2, r2, #0x12, 26
        mov     r5, r2, lsl #1
        add     r7, r12, r5
        add     r7, r7, #9, 26
        ldrsh   r8, [r7]
        ldrsh   r5, [r12, +r5]
        ldrsh   r10, [r1, +r4]
        ldrsh   r7, [r3, +r4]
        add     r2, r6, r2
        mla     r8, r10, r8, r9
        add     r1, r4, r1
        mul     r5, r7, r5
        cmp     r2, #0x12, 26
        add     r9, r4, r3
        sub     r7, r8, r5
        subge   r2, r2, #0x12, 26
        ldrsh   r8, [r1, +r4]
        mov     r3, r2, lsl #1
        add     r5, r12, r3
        add     r5, r5, #9, 26
        ldrsh   r5, [r5]
        ldrsh   r3, [r12, +r3]
        ldrsh   r9, [r9, +r4]
        mla     r7, r8, r5, r7
        add     r2, r6, r2
        mul     r3, r9, r3
        add     r5, r4, r1
        cmp     r2, #0x12, 26
        sub     r1, r7, r3
        subge   r2, r2, #0x12, 26
        ldrsh   r3, [r5, +r4]
        mov     r7, r2, lsl #1
        add     r5, r12, r7
        add     r5, r5, #9, 26
        ldrsh   r5, [r5]
        ldrsh   r7, [r12, +r7]
        add     r2, r6, r2
        mla     r1, r3, r5, r1
        cmp     r2, #0x12, 26
        sub     r7, r7, r7, lsl #15
        add     r1, r7, r1
        subge   r2, r2, #0x12, 26
        mov     r3, r2, lsl #1
        add     r5, r12, r3
        add     r5, r5, #9, 26
        ldrsh   r5, [r5]
        ldr     r7, [sp, #0x68]
        ldrsh   r3, [r12, +r3]
        add     r2, r6, r2
        cmp     r2, #0x12, 26
        mla     r1, r7, r5, r1
        ldr     r5, [sp, #0x5C]
        mla     r3, r5, r3, r1
        subge   r2, r2, #0x12, 26
        ldr     r1, [sp, #0x3C]
        mov     r5, r2, lsl #1
        add     r7, r12, r5
        add     r7, r7, #9, 26
        ldrsh   r7, [r7]
        sub     r1, r1, r4
        ldrsh   r8, [r1]
        ldrsh   r5, [r12, +r5]
        add     r2, r6, r2
        cmp     r2, #0x12, 26
        mla     r3, r8, r7, r3
        ldr     r7, [sp, #0x60]
        mla     r3, r7, r5, r3
        subge   r2, r2, #0x12, 26
        mov     r5, r2, lsl #1
        add     r7, r12, r5
        add     r7, r7, #9, 26
        ldrsh   r8, [r7]
        ldrsh   r5, [r12, +r5]
        sub     r1, r1, r4
        ldrsh   r9, [r1]
        add     r7, r6, r2
        ldr     r2, [sp, #0x64]
        cmp     r7, #0x12, 26
        mla     r3, r9, r8, r3
        mla     r2, r2, r5, r3
        subge   r7, r7, #0x12, 26
        mov     r3, r7, lsl #1
        sub     r1, r1, r4
        ldrsh   r7, [r1]
        add     r5, r12, r3
        ldr     r1, [sp, #0x7C]
        add     r5, r5, #9, 26
        ldrsh   r5, [r5]
        ldrsh   r3, [r12, +r3]
        sub     r1, r1, r4
        ldrsh   r1, [r1]
        mla     r2, r7, r5, r2
        ldr     r8, [sp, #0x58]
        ldr     r5, [sp, #0x94]
        mov     r7, #1
        add     lr, lr, #1
        mla     r2, r1, r3, r2
        add     r8, r5, r7, lsl r8
        str     r8, [sp, #0x94]
        cmp     lr, #9
        mov     r1, r2, lsl #1
        ldr     r2, [sp, #0x20]
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r2]
        blt     LDGJ29
        ldr     r8, [sp, #0x54]
        ldr     r5, [sp, #0x48]
        ldr     r7, [sp, #0x4C]
        ldr     r6, [sp, #0x50]
        add     r12, r8, r4
        str     r12, [sp, #0x84]
        add     r12, r12, r4
        str     r12, [sp, #0x7C]
        add     r12, r12, r4
        str     r12, [sp, #0x80]
        add     r12, r12, r4
        add     r10, r12, r4
        str     r12, [sp, #0x6C]
        add     r12, r10, r4
        add     r9, r12, r4
        str     r12, [sp, #0x74]
        add     r4, r9, r4
        subs    r12, r6, #0x80
        str     r4, [sp, #0x78]
        beq     LDGJ35
        adds    r12, r12, #0x40
        beq     LDGJ36
        adds    r12, r12, #0x20
        beq     LDGJ37
        adds    r12, r12, #0x10
        ldreq   r4, [pc, #-0xBA0]
        ldreq   r11, [pc, #-0xB94]
        movne   r4, #0
        movne   r11, r4
LDGJ32:
        mvn     r12, #0
        str     r12, [sp, #0x70]
        str     r12, [sp, #8]
        str     r4, [sp, #4]
        str     r11, [sp]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r6
        mov     r0, r8
        bl      LDGJ_ownRFFT
        ldr     r12, [sp, #0x70]
        str     r4, [sp, #4]
        str     r11, [sp]
        str     r12, [sp, #8]
        ldr     r0, [sp, #0x84]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r6
        bl      LDGJ_ownRFFT
        mvn     r12, #0
        str     r12, [sp, #8]
        str     r4, [sp, #4]
        str     r11, [sp]
        ldr     r0, [sp, #0x7C]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r6
        bl      LDGJ_ownRFFT
        mvn     r12, #0
        str     r12, [sp, #8]
        str     r4, [sp, #4]
        str     r11, [sp]
        ldr     r0, [sp, #0x80]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r6
        bl      LDGJ_ownRFFT
        mvn     r12, #0
        str     r12, [sp, #8]
        str     r4, [sp, #4]
        str     r11, [sp]
        ldr     r0, [sp, #0x6C]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r6
        bl      LDGJ_ownRFFT
        mvn     r12, #0
        str     r12, [sp, #8]
        str     r4, [sp, #4]
        str     r11, [sp]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r6
        mov     r0, r10
        bl      LDGJ_ownRFFT
        mvn     r12, #0
        str     r12, [sp, #8]
        str     r4, [sp, #4]
        str     r11, [sp]
        ldr     r0, [sp, #0x74]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r6
        bl      LDGJ_ownRFFT
        mvn     r12, #0
        str     r12, [sp, #8]
        str     r4, [sp, #4]
        str     r11, [sp]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r6
        mov     r0, r9
        bl      LDGJ_ownRFFT
        mvn     r12, #0
        str     r12, [sp, #8]
        str     r4, [sp, #4]
        str     r11, [sp]
        ldr     r0, [sp, #0x78]
        mov     r3, r5
        mov     r2, r7
        mov     r1, r6
        bl      LDGJ_ownRFFT
        cmp     r6, #0
        ble     LDGJ34
        ldr     r12, [sp, #0x78]
        ldr     r11, [sp, #0x74]
        ldr     lr, [sp, #0x6C]
        ldr     r4, [sp, #0x80]
        ldr     r5, [sp, #0x7C]
        ldr     r7, [sp, #0x84]
        ldr     r3, [sp, #0x8C]
        mov     r2, #0
LDGJ33:
        ldrsh   r0, [r8], #2
        add     r2, r2, #1
        cmp     r2, r6
        strh    r0, [r3]
        ldrsh   r0, [r7], #2
        strh    r0, [r3, #2]
        ldrsh   r0, [r5], #2
        strh    r0, [r3, #4]
        ldrsh   r0, [r4], #2
        strh    r0, [r3, #6]
        ldrsh   r0, [lr], #2
        strh    r0, [r3, #8]
        ldrsh   r0, [r10], #2
        strh    r0, [r3, #0xA]
        ldrsh   r0, [r11], #2
        strh    r0, [r3, #0xC]
        ldrsh   r0, [r9], #2
        strh    r0, [r3, #0xE]
        ldrsh   r0, [r12], #2
        strh    r0, [r3, #0x10]
        add     r3, r3, #0x12
        blt     LDGJ33
LDGJ34:
        add     sp, sp, #0x27, 26
        ldmia   sp!, {r4 - r11, pc}
LDGJ35:
        ldr     r12, [pc, #-0xD80]
        ldr     r11, [pc, #-0xD80]
        add     r4, r12, #7, 26
        b       LDGJ32
LDGJ36:
        ldr     r12, [pc, #-0xD90]
        ldr     r11, [pc, #-0xD8C]
        add     r4, r12, #0xC0
        b       LDGJ32
LDGJ37:
        ldr     r12, [pc, #-0xDA0]
        ldr     r11, [pc, #-0xD98]
        add     r4, r12, #0x40
        b       LDGJ32
LDGJ_ownRFFT:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4E, 30
        ldr     r12, [sp, #0x15C]
        ldr     r4, [sp, #0x164]
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x160]
        cmp     r4, #1
        beq     LDGJ74
        ldrsh   lr, [r0]
        mov     r5, r2, lsl #1
        ldrsh   r6, [r0, +r5]
        sub     r5, r1, #1
        add     r9, r0, #2
        cmp     r1, #2
        add     r5, r0, r5, lsl #1
        mov     r10, r9
        ble     LDGJ39
        mov     r8, #2
        mov     r7, #4
        str     r3, [sp, #0x24]
        str     r2, [sp, #0x18]
        str     r0, [sp, #0x28]
LDGJ38:
        ldrsh   r3, [r5], #-2
        add     r2, sp, #0x38
        add     r10, r10, #2
        ldrsh   r0, [r10, #-2]
        add     r8, r8, #2
        add     r11, r2, r7
        cmp     r8, r1
        strh    r0, [r2, +r7]
        strh    r3, [r11, #2]
        add     r7, r7, #4
        blt     LDGJ38
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #0x18]
        ldr     r0, [sp, #0x28]
LDGJ39:
        add     r5, sp, #0x38
        add     r7, sp, #0x38
        cmp     r1, #0
        strh    lr, [r5]
        strh    r6, [r7, #2]
        ble     LDGJ41
        mov     r5, r0
        mov     lr, #0
        mov     r6, r1
LDGJ40:
        add     r7, sp, #0x38
        ldrsh   r7, [r7, +lr]
        subs    r6, r6, #1
        add     lr, lr, #2
        strh    r7, [r5], #2
        bne     LDGJ40
        ldrsh   lr, [r0]
LDGJ41:
        ldrsh   r5, [r0, #2]
        cmp     r2, #2
        sub     r10, r1, #2
        add     r6, lr, r5
        sub     r5, lr, r5
        mov     r6, r6, lsl #14
        add     lr, r6, #1, 18
        mov     r5, r5, lsl #14
        add     r5, r5, #1, 18
        mov     lr, lr, asr #15
        strh    lr, [r0]
        mov     r5, r5, asr #15
        strh    r5, [r0, #2]
        mov     lr, r10
        blt     LDGJ43
        mov     r5, #2
        str     r5, [sp, #0x2C]
        add     r5, r12, #2
        add     r11, r12, #4
        str     r5, [sp, #4]
        mov     r8, #4
        add     r7, r0, #4
        add     r6, r0, #6
        add     r5, r12, #8
        str     r11, [sp, #0x20]
        str     r10, [sp, #0x14]
        str     r9, [sp, #0x1C]
        str     r4, [sp, #0xC]
        str     r12, [sp, #8]
        str     r3, [sp, #0x24]
        str     r2, [sp, #0x18]
        str     r1, [sp]
LDGJ42:
        ldrsh   r2, [r7]
        ldr     r12, [sp, #0x1C]
        mov     r3, lr, lsl #1
        ldrsh   r1, [r0, +r3]
        ldrsh   r10, [r6]
        ldrsh   r4, [r12, +r3]
        ldr     r9, [sp, #0x20]
        mov     r12, r8, lsl #1
        str     r12, [sp, #0x30]
        ldrsh   r12, [r9, +r12]
        ldrsh   r9, [r5]
        add     r8, r8, #4
        str     r9, [sp, #0x34]
        sub     r9, r2, r1
        add     r1, r2, r1
        sub     r2, r10, r4
        mov     r9, r9, lsl #16
        add     r4, r10, r4
        rsb     r11, r4, #0
        mov     r4, r9, asr #16
        mul     r10, r12, r4
        mov     r9, lr, lsl #2
        ldr     lr, [sp, #0x34]
        mov     r11, r11, lsl #16
        mov     r12, r11, asr #16
        ldr     r11, [sp, #0x18]
        mla     r10, r12, lr, r10
        ldr     lr, [sp]
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x2C]
        add     r10, r10, #2
        str     r10, [sp, #0x2C]
        cmp     r10, r11
        sub     lr, lr, r10
        ldr     r10, [sp, #0x34]
        add     r10, r10, r1, lsl #14
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        strh    r10, [r7], #4
        ldrsh   r10, [r5], #8
        ldr     r11, [sp, #4]
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x30]
        ldrsh   r10, [r11, +r10]
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x34]
        ldr     r11, [sp, #0x30]
        mul     r10, r10, r4
        mla     r10, r12, r11, r10
        add     r10, r10, r2, lsl #14
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        strh    r10, [r6], #4
        ldr     r10, [sp, #4]
        ldr     r11, [sp, #8]
        ldrsh   r10, [r10, +r9]
        ldrsh   r11, [r11, +r9]
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x34]
        mul     r10, r10, r4
        mla     r10, r12, r11, r10
        add     r1, r10, r1, lsl #14
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r0, +r3]
        ldr     r1, [sp, #8]
        ldr     r10, [sp, #0x20]
        ldrsh   r1, [r1, +r9]
        mul     r4, r1, r4
        ldrsh   r9, [r10, +r9]
        mla     r4, r12, r9, r4
        add     r2, r4, r2, lsl #14
        rsb     r1, r2, #1, 18
        ldr     r2, [sp, #0x1C]
        mov     r1, r1, asr #15
        strh    r1, [r2, +r3]
        ble     LDGJ42
        ldr     r10, [sp, #0x14]
        ldr     r4, [sp, #0xC]
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #0x24]
        ldr     r1, [sp]
LDGJ43:
        subs    r2, r3, #6
        ldreq   r5, [pc, #0xAC0]
        beq     LDGJ45
        adds    r2, r2, #1
        ldreq   r5, [pc, #0xAB8]
        beq     LDGJ45
        adds    r2, r2, #1
        ldreq   r5, [pc, #0xAB0]
        beq     LDGJ45
        adds    r2, r2, #1
        ldreq   r5, [pc, #0xAA8]
        beq     LDGJ45
LDGJ44:
        add     sp, sp, #0x4E, 30
        ldmia   sp!, {r4 - r11, pc}
LDGJ45:
        cmp     r10, #0
        ble     LDGJ48
        mov     r8, #0
        mov     r7, r8
        mov     r2, r7
        mov     r6, r0
LDGJ46:
        cmp     r2, r7
        ble     LDGJ47
        mov     r2, r2, lsl #1
        ldrsh   lr, [r0, +r2]
        ldrsh   r9, [r6]
        add     r11, r0, r2
        strh    lr, [r6]
        ldrsh   lr, [r11, #2]
        strh    r9, [r0, +r2]
        ldrsh   r2, [r6, #2]
        strh    lr, [r6, #2]
        strh    r2, [r11, #2]
LDGJ47:
        ldrsh   r2, [r5, +r8]
        add     r7, r7, #2
        cmp     r7, r10
        add     r8, r8, #2
        add     r6, r6, #4
        blt     LDGJ46
LDGJ48:
        cmp     r4, #1
        mov     r8, #0
        mov     r5, #2
        beq     LDGJ68
        cmp     r3, #0
        ble     LDGJ44
        mvn     r2, #0xFF
        ldr     r9, [sp, #0x10]
        bic     r2, r2, #0x7F, 24
        add     r6, r12, #2
        sub     lr, r2, #2, 2
        add     r4, r12, #4
        mvn     r2, r2
        str     r6, [sp, #0x1C]
        str     r12, [sp, #8]
LDGJ49:
        ldrsh   r7, [r9], #2
        mov     r12, r5, lsl r8
        cmp     r12, #0
        ble     LDGJ67
        mov     r6, #0
        str     r9, [sp, #0x10]
        str     r8, [sp, #0x20]
        str     r3, [sp, #0x24]
LDGJ50:
        cmp     r6, r1
        mov     r3, r6, lsl r7
        mov     r5, r6
        bge     LDGJ66
        mov     r3, r3, lsl #2
        str     r6, [sp, #0x18]
        str     r7, [sp, #0x14]
        str     r1, [sp]
LDGJ51:
        ldr     r6, [sp, #8]
        add     r1, r12, r5
        mov     r8, r1, lsl #1
        ldrsh   r7, [r6, +r3]
        ldrsh   r6, [r4, +r3]
        ldr     r1, [sp, #0x1C]
        add     r11, r0, r8
        ldrsh   r10, [r11, #2]
        ldrsh   r9, [r0, +r8]
        ldrsh   r1, [r1, +r3]
        mul     r6, r6, r10
        mul     r1, r1, r9
        mla     r6, r7, r9, r6
        mla     r10, r7, r10, r1
        cmn     r6, #0x1E, 4
        mvngt   r6, #2, 2
        bgt     LDGJ52
        cmp     r6, #0xE, 4
        movge   r6, r6, lsl #2
        movlt   r6, #2, 2
LDGJ52:
        cmp     lr, r6
        ble     LDGJ53
        add     r1, r6, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDGJ54
LDGJ53:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDGJ54:
        cmn     r10, #0x1E, 4
        mvngt   r10, #2, 2
        bgt     LDGJ55
        cmp     r10, #0xE, 4
        movge   r10, r10, lsl #2
        movlt   r10, #2, 2
LDGJ55:
        cmp     lr, r10
        ble     LDGJ56
        add     r6, r10, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        b       LDGJ57
LDGJ56:
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r6, r6
LDGJ57:
        mov     r9, r5, lsl #1
        ldrsh   r10, [r0, +r9]
        add     r7, r0, r9
        sub     r10, r10, r1
        cmp     r2, r10
        blt     LDGJ58
        cmn     r10, #2, 18
        movge   r10, r10, lsl #16
        movge   r10, r10, asr #16
        movlt   r10, #0
        sublt   r10, r10, #2, 18
        b       LDGJ59
LDGJ58:
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
LDGJ59:
        strh    r10, [r0, +r8]
        ldrsh   r8, [r7, #2]
        sub     r8, r8, r6
        cmp     r2, r8
        blt     LDGJ60
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDGJ61
LDGJ60:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDGJ61:
        strh    r8, [r11, #2]
        ldrsh   r8, [r0, +r9]
        add     r8, r1, r8
        cmp     r2, r8
        blt     LDGJ62
        cmn     r8, #2, 18
        movge   r1, r8, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LDGJ63
LDGJ62:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDGJ63:
        ldrsh   r8, [r7, #2]
        strh    r1, [r0, +r9]
        add     r8, r6, r8
        cmp     r2, r8
        blt     LDGJ64
        cmn     r8, #2, 18
        movge   r1, r8, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LDGJ65
LDGJ64:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDGJ65:
        ldr     r6, [sp]
        add     r5, r5, r12, lsl #1
        strh    r1, [r7, #2]
        cmp     r5, r6
        blt     LDGJ51
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x14]
        ldr     r1, [sp]
LDGJ66:
        add     r6, r6, #2
        cmp     r6, r12
        blt     LDGJ50
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        mov     r5, #2
LDGJ67:
        add     r8, r8, #1
        cmp     r8, r3
        blt     LDGJ49
        add     sp, sp, #0x4E, 30
        ldmia   sp!, {r4 - r11, pc}
LDGJ68:
        cmp     r3, #0
        ble     LDGJ44
        mov     r6, r8
        add     r2, r12, #4
        add     lr, r12, #2
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r2, [sp, #4]
LDGJ69:
        ldrsh   lr, [r12], #2
        mov     r2, r5, lsl r6
        cmp     r2, #0
        ble     LDGJ73
        mov     r4, r8
        str     r12, [sp, #0x10]
        str     r6, [sp, #0x1C]
        str     r8, [sp, #0x20]
        str     r3, [sp, #0x24]
LDGJ70:
        cmp     r4, r1
        mov     r3, r4, lsl lr
        mov     r12, r4
        bge     LDGJ72
        mov     r3, r3, lsl #2
        str     r4, [sp, #0x14]
        str     lr, [sp, #0x18]
        str     r1, [sp]
LDGJ71:
        add     r1, r2, r12
        ldr     lr, [sp, #8]
        mov     r5, r1, lsl #1
        ldr     r1, [sp, #0xC]
        ldrsh   lr, [lr, +r3]
        ldrsh   r7, [r0, +r5]
        add     r8, r0, r5
        ldrsh   r4, [r1, +r3]
        ldr     r1, [sp, #4]
        ldrsh   r6, [r8, #2]
        mov     r10, r12, lsl #1
        ldrsh   r1, [r1, +r3]
        ldrsh   r9, [r0, +r10]
        mul     r4, r4, r6
        add     r11, r0, r10
        mul     r1, r1, r7
        add     r12, r12, r2, lsl #1
        mla     r4, lr, r7, r4
        mla     r1, lr, r6, r1
        ldr     r6, [sp]
        rsb     r9, r4, r9, lsl #14
        add     lr, r9, #1, 18
        mov     lr, lr, asr #15
        strh    lr, [r0, +r5]
        ldrsh   lr, [r11, #2]
        cmp     r12, r6
        rsb     lr, r1, lr, lsl #14
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        strh    lr, [r8, #2]
        ldrsh   r5, [r0, +r10]
        ldrsh   lr, [r11, #2]
        add     r5, r4, r5, lsl #14
        add     r4, r5, #1, 18
        add     lr, r1, lr, lsl #14
        add     r1, lr, #1, 18
        mov     r4, r4, asr #15
        strh    r4, [r0, +r10]
        mov     r1, r1, asr #15
        strh    r1, [r11, #2]
        blt     LDGJ71
        ldr     r4, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        ldr     r1, [sp]
LDGJ72:
        add     r4, r4, #2
        cmp     r4, r2
        blt     LDGJ70
        ldr     r12, [sp, #0x10]
        ldr     r6, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        mov     r5, #2
LDGJ73:
        add     r6, r6, #1
        cmp     r6, r3
        blt     LDGJ69
        add     sp, sp, #0x4E, 30
        ldmia   sp!, {r4 - r11, pc}
LDGJ74:
        subs    lr, r3, #6
        ldreq   r5, [pc, #0x674]
        beq     LDGJ75
        adds    lr, lr, #1
        ldreq   r5, [pc, #0x66C]
        beq     LDGJ75
        adds    lr, lr, #1
        ldreq   r5, [pc, #0x664]
        beq     LDGJ75
        adds    lr, lr, #1
        subne   lr, r1, #2
        ldreq   r5, [pc, #0x658]
        bne     LDGJ98
LDGJ75:
        sub     lr, r1, #2
        cmp     lr, #0
        ble     LDGJ78
        mov     r8, #0
        mov     r7, r8
        mov     r6, r0
        mov     r9, r7
        str     r1, [sp]
LDGJ76:
        cmp     r9, r7
        ble     LDGJ77
        mov     r1, r9, lsl #1
        ldrsh   r9, [r0, +r1]
        ldrsh   r10, [r6]
        add     r11, r0, r1
        strh    r9, [r6]
        ldrsh   r9, [r11, #2]
        strh    r10, [r0, +r1]
        ldrsh   r1, [r6, #2]
        strh    r9, [r6, #2]
        strh    r1, [r11, #2]
LDGJ77:
        ldrsh   r9, [r5, +r8]
        add     r7, r7, #2
        cmp     r7, lr
        add     r8, r8, #2
        add     r6, r6, #4
        blt     LDGJ76
        ldr     r1, [sp]
LDGJ78:
        cmp     r4, #1
        mov     r7, #2
        mov     r6, #0
        beq     LDGJ104
        cmp     r3, #0
        ble     LDGJ98
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        str     lr, [sp, #0x14]
        ldr     lr, [sp, #0x10]
        add     r9, r12, #4
        add     r8, r12, #2
        sub     r5, r4, #2, 2
        mvn     r4, r4
        str     r8, [sp, #0xC]
        str     r9, [sp, #4]
        str     r2, [sp, #0x18]
LDGJ79:
        ldrsh   r9, [lr], #2
        mov     r2, r7, lsl r6
        cmp     r2, #0
        ble     LDGJ97
        mov     r8, #0
        str     lr, [sp, #0x10]
        str     r6, [sp, #0x2C]
        str     r3, [sp, #0x24]
LDGJ80:
        cmp     r8, r1
        mov     r3, r8, lsl r9
        mov     lr, r8
        bge     LDGJ96
        mov     r3, r3, lsl #2
        str     r8, [sp, #0x1C]
        str     r9, [sp, #0x20]
        str     r1, [sp]
LDGJ81:
        add     r1, r2, lr
        ldrsh   r10, [r12, +r3]
        mov     r6, r1, lsl #1
        ldr     r1, [sp, #4]
        ldr     r7, [sp, #0xC]
        ldrsh   r9, [r0, +r6]
        add     r11, r0, r6
        ldrsh   r1, [r1, +r3]
        ldrsh   r8, [r11, #2]
        ldrsh   r7, [r7, +r3]
        mul     r1, r1, r8
        mul     r7, r7, r9
        mla     r1, r10, r9, r1
        mla     r7, r10, r8, r7
        cmn     r1, #0x1E, 4
        mvngt   r1, #2, 2
        bgt     LDGJ82
        cmp     r1, #0xE, 4
        movge   r1, r1, lsl #2
        movlt   r1, #2, 2
LDGJ82:
        cmp     r5, r1
        ble     LDGJ83
        add     r1, r1, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDGJ84
LDGJ83:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDGJ84:
        cmn     r7, #0x1E, 4
        mvngt   r7, #2, 2
        bgt     LDGJ85
        cmp     r7, #0xE, 4
        movge   r7, r7, lsl #2
        movlt   r7, #2, 2
LDGJ85:
        cmp     r5, r7
        ble     LDGJ86
        add     r7, r7, #2, 18
        mov     r7, r7, asr #16
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
        b       LDGJ87
LDGJ86:
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r7, r7
LDGJ87:
        mov     r9, lr, lsl #1
        ldrsh   r10, [r0, +r9]
        add     r8, r0, r9
        sub     r10, r10, r1
        cmp     r4, r10
        blt     LDGJ88
        cmn     r10, #2, 18
        movge   r10, r10, lsl #16
        movge   r10, r10, asr #16
        movlt   r10, #0
        sublt   r10, r10, #2, 18
        b       LDGJ89
LDGJ88:
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
LDGJ89:
        strh    r10, [r0, +r6]
        ldrsh   r6, [r8, #2]
        sub     r6, r6, r7
        cmp     r4, r6
        blt     LDGJ90
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        movlt   r6, #0
        sublt   r6, r6, #2, 18
        b       LDGJ91
LDGJ90:
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r6, r6
LDGJ91:
        strh    r6, [r11, #2]
        ldrsh   r6, [r0, +r9]
        add     r6, r1, r6
        cmp     r4, r6
        blt     LDGJ92
        cmn     r6, #2, 18
        movge   r1, r6, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LDGJ93
LDGJ92:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDGJ93:
        ldrsh   r6, [r8, #2]
        strh    r1, [r0, +r9]
        add     r6, r7, r6
        cmp     r4, r6
        blt     LDGJ94
        cmn     r6, #2, 18
        movge   r1, r6, lsl #16
        movge   r1, r1, asr #16
        mvnlt   r1, #0xFF
        biclt   r1, r1, #0x7F, 24
        b       LDGJ95
LDGJ94:
        mov     r1, #0
        sub     r1, r1, #2, 18
        mvn     r1, r1
LDGJ95:
        ldr     r6, [sp]
        add     lr, lr, r2, lsl #1
        strh    r1, [r8, #2]
        cmp     lr, r6
        blt     LDGJ81
        ldr     r8, [sp, #0x1C]
        ldr     r9, [sp, #0x20]
        ldr     r1, [sp]
LDGJ96:
        add     r8, r8, #2
        cmp     r8, r2
        blt     LDGJ80
        ldr     lr, [sp, #0x10]
        ldr     r6, [sp, #0x2C]
        ldr     r3, [sp, #0x24]
        mov     r7, #2
LDGJ97:
        add     r6, r6, #1
        cmp     r6, r3
        blt     LDGJ79
        ldr     lr, [sp, #0x14]
        ldr     r2, [sp, #0x18]
LDGJ98:
        ldrsh   r4, [r0, #2]
        ldrsh   r5, [r0]
        cmp     r2, #2
        mov     r9, #2
        add     r8, r0, #2
        add     r3, r4, r5
        sub     r4, r5, r4
        sub     r3, r3, #3
        strh    r3, [r0]
        strh    r4, [r0, #2]
        blt     LDGJ100
        mov     r7, r9
        add     r11, r12, #4
        add     r10, r12, #2
        mov     r6, #4
        add     r5, r0, #4
        add     r4, r0, #6
        add     r3, r12, #8
        str     r10, [sp, #0x20]
        str     r11, [sp, #0x1C]
        str     r8, [sp, #0x24]
        str     r9, [sp, #0x2C]
        str     r12, [sp, #8]
        str     r2, [sp, #0x18]
        str     r1, [sp]
        str     r0, [sp, #0x28]
LDGJ99:
        ldr     r0, [sp, #0x28]
        ldrsh   r10, [r4]
        ldrsh   r8, [r5]
        mov     r9, lr, lsl #1
        ldrsh   r2, [r0, +r9]
        ldr     r0, [sp, #0x24]
        ldr     r11, [sp, #0x18]
        mov     r1, r6, lsl #1
        ldrsh   r12, [r0, +r9]
        ldr     r0, [sp, #0x20]
        str     r1, [sp, #0x34]
        add     r6, r6, #4
        add     r7, r7, #2
        ldrsh   r1, [r0, +r1]
        ldrsh   r0, [r3]
        cmp     r7, r11
        str     r0, [sp, #0x30]
        sub     r0, r2, r8
        add     r2, r8, r2
        sub     r8, r10, r12
        add     r10, r10, r12
        mov     r0, r0, lsl #16
        mov     r12, lr, lsl #2
        mov     r0, r0, asr #16
        mul     lr, r1, r0
        mov     r10, r10, lsl #16
        mov     r1, r10, asr #16
        ldr     r10, [sp, #0x30]
        mla     r10, r1, r10, lr
        ldr     lr, [sp]
        add     r10, r10, r2, lsl #14
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        strh    r10, [r5], #4
        ldrsh   r10, [r3], #8
        ldr     r11, [sp, #0x34]
        sub     lr, lr, r7
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x1C]
        ldrsh   r11, [r10, +r11]
        ldr     r10, [sp, #0x30]
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x34]
        mul     r10, r10, r0
        mla     r10, r1, r11, r10
        add     r10, r10, r8, lsl #14
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        strh    r10, [r4], #4
        ldr     r10, [sp, #0x1C]
        ldr     r11, [sp, #8]
        ldrsh   r10, [r10, +r12]
        ldrsh   r11, [r11, +r12]
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x34]
        mul     r10, r10, r0
        mla     r10, r1, r11, r10
        add     r2, r10, r2, lsl #14
        ldr     r10, [sp, #0x28]
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r10, +r9]
        ldr     r2, [sp, #8]
        ldr     r10, [sp, #0x20]
        ldrsh   r2, [r2, +r12]
        mul     r0, r2, r0
        ldrsh   r12, [r10, +r12]
        mla     r0, r1, r12, r0
        ldr     r1, [sp, #0x24]
        add     r8, r0, r8, lsl #14
        rsb     r0, r8, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r1, +r9]
        ble     LDGJ99
        ldr     r9, [sp, #0x2C]
        ldr     r1, [sp]
        ldr     r0, [sp, #0x28]
LDGJ100:
        sub     r3, r1, #1
        add     r12, sp, #0x38
        cmp     r3, #2
        add     r2, sp, #0x3A
        add     r12, r12, r3, lsl #1
        ble     LDGJ102
        add     r5, r0, #4
        add     r6, r0, #6
LDGJ101:
        ldrsh   r4, [r5], #4
        ldrsh   lr, [r6], #4
        strh    r4, [r2], #2
        add     r9, r9, #2
        strh    lr, [r12], #-2
        cmp     r9, r3
        blt     LDGJ101
LDGJ102:
        ldrsh   r12, [r0, #2]
        ldrsh   r3, [r0]
        cmp     r1, #0
        strh    r12, [r2]
        ble     LDGJ44
        add     r12, sp, #0x38
        mov     r2, #0
        strh    r3, [r12]
        mov     r3, r2
LDGJ103:
        add     r12, sp, #0x38
        ldrsh   r12, [r12, +r2]
        add     r3, r3, #1
        cmp     r3, r1
        strh    r12, [r0], #2
        add     r2, r2, #2
        blt     LDGJ103
        add     sp, sp, #0x4E, 30
        ldmia   sp!, {r4 - r11, pc}
LDGJ104:
        cmp     r3, #0
        ble     LDGJ98
        add     r4, r12, #4
        add     r5, r12, #2
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r4, [sp, #4]
        str     lr, [sp, #0x14]
        str     r2, [sp, #0x18]
LDGJ105:
        ldrsh   r4, [r12], #2
        mov     r2, r7, lsl r6
        cmp     r2, #0
        ble     LDGJ109
        mov     lr, #0
        str     r12, [sp, #0x10]
        str     r6, [sp, #0x2C]
        str     r3, [sp, #0x24]
LDGJ106:
        cmp     lr, r1
        mov     r3, lr, lsl r4
        mov     r12, lr
        bge     LDGJ108
        mov     r3, r3, lsl #2
        str     lr, [sp, #0x1C]
        str     r4, [sp, #0x20]
        str     r1, [sp]
LDGJ107:
        add     r1, r2, r12
        ldr     lr, [sp, #8]
        mov     r5, r1, lsl #1
        ldr     r1, [sp, #0xC]
        ldrsh   lr, [lr, +r3]
        ldrsh   r7, [r0, +r5]
        add     r8, r0, r5
        ldrsh   r4, [r1, +r3]
        ldr     r1, [sp, #4]
        ldrsh   r6, [r8, #2]
        mov     r10, r12, lsl #1
        ldrsh   r1, [r1, +r3]
        ldrsh   r9, [r0, +r10]
        mul     r4, r4, r6
        add     r11, r0, r10
        mul     r1, r1, r7
        add     r12, r12, r2, lsl #1
        mla     r4, lr, r7, r4
        mla     r1, lr, r6, r1
        ldr     r6, [sp]
        rsb     r9, r4, r9, lsl #14
        add     r9, r9, #1, 18
        mov     r9, r9, asr #15
        strh    r9, [r0, +r5]
        ldrsh   lr, [r11, #2]
        cmp     r12, r6
        rsb     lr, r1, lr, lsl #14
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        strh    lr, [r8, #2]
        ldrsh   r5, [r0, +r10]
        ldrsh   lr, [r11, #2]
        add     r5, r4, r5, lsl #14
        add     r4, r5, #1, 18
        add     lr, r1, lr, lsl #14
        add     r1, lr, #1, 18
        mov     r4, r4, asr #15
        strh    r4, [r0, +r10]
        mov     r1, r1, asr #15
        strh    r1, [r11, #2]
        blt     LDGJ107
        ldr     lr, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r1, [sp]
LDGJ108:
        add     lr, lr, #2
        cmp     lr, r2
        blt     LDGJ106
        ldr     r12, [sp, #0x10]
        ldr     r6, [sp, #0x2C]
        ldr     r3, [sp, #0x24]
        mov     r7, #2
LDGJ109:
        add     r6, r6, #1
        cmp     r6, r3
        blt     LDGJ105
        ldr     lr, [sp, #0x14]
        ldr     r12, [sp, #8]
        ldr     r2, [sp, #0x18]
        b       LDGJ98
        .long   LDGJ_ii_cfft_tbl
        .long   LDGJ_ii_cfft_tbl
        .long   LDGJ_ii_cfft_tbl
        .long   LDGJ_ii_cfft_tbl


        .data
        .align  4


LDGJ_ii_tbl_stg:
        .byte   0x06,0x00,0x05,0x00,0x04,0x00,0x03,0x00,0x02,0x00,0x01,0x00
LDGJ_ii_cfft_tbl:
        .byte   0x08,0x00,0x04,0x00,0x0C,0x00,0x02,0x00,0x0A,0x00,0x06,0x00,0x0E,0x00,0x00,0x00
        .byte   0x10,0x00,0x08,0x00,0x18,0x00,0x04,0x00,0x14,0x00,0x0C,0x00,0x1C,0x00,0x02,0x00
        .byte   0x12,0x00,0x0A,0x00,0x1A,0x00,0x06,0x00,0x16,0x00,0x0E,0x00,0x1E,0x00,0x00,0x00
        .byte   0x20,0x00,0x10,0x00,0x30,0x00,0x08,0x00,0x28,0x00,0x18,0x00,0x38,0x00,0x04,0x00
        .byte   0x24,0x00,0x14,0x00,0x34,0x00,0x0C,0x00,0x2C,0x00,0x1C,0x00,0x3C,0x00,0x02,0x00
        .byte   0x22,0x00,0x12,0x00,0x32,0x00,0x0A,0x00,0x2A,0x00,0x1A,0x00,0x3A,0x00,0x06,0x00
        .byte   0x26,0x00,0x16,0x00,0x36,0x00,0x0E,0x00,0x2E,0x00,0x1E,0x00,0x3E,0x00,0x00,0x00
        .byte   0x40,0x00,0x20,0x00,0x60,0x00,0x10,0x00,0x50,0x00,0x30,0x00,0x70,0x00,0x08,0x00
        .byte   0x48,0x00,0x28,0x00,0x68,0x00,0x18,0x00,0x58,0x00,0x38,0x00,0x78,0x00,0x04,0x00
        .byte   0x44,0x00,0x24,0x00,0x64,0x00,0x14,0x00,0x54,0x00,0x34,0x00,0x74,0x00,0x0C,0x00
        .byte   0x4C,0x00,0x2C,0x00,0x6C,0x00,0x1C,0x00,0x5C,0x00,0x3C,0x00,0x7C,0x00,0x02,0x00
        .byte   0x42,0x00,0x22,0x00,0x62,0x00,0x12,0x00,0x52,0x00,0x32,0x00,0x72,0x00,0x0A,0x00
        .byte   0x4A,0x00,0x2A,0x00,0x6A,0x00,0x1A,0x00,0x5A,0x00,0x3A,0x00,0x7A,0x00,0x06,0x00
        .byte   0x46,0x00,0x26,0x00,0x66,0x00,0x16,0x00,0x56,0x00,0x36,0x00,0x76,0x00,0x0E,0x00
        .byte   0x4E,0x00,0x2E,0x00,0x6E,0x00,0x1E,0x00,0x5E,0x00,0x3E,0x00,0x7E,0x00,0x00,0x00


        .data
        .align  4


LDGJ_t_sinFxS4:
        .byte   0x00,0x00,0x2D,0x00,0x59,0x00,0x86,0x00,0xB3,0x00,0xDF,0x00,0x0C,0x01,0x39,0x01
        .byte   0x65,0x01,0x92,0x01,0xBF,0x01,0xEB,0x01,0x18,0x02,0x44,0x02,0x71,0x02,0x9D,0x02
        .byte   0xCA,0x02,0xF6,0x02,0x23,0x03,0x4F,0x03,0x7C,0x03,0xA8,0x03,0xD5,0x03,0x01,0x04
        .byte   0x2D,0x04,0x5A,0x04,0x86,0x04,0xB2,0x04,0xDE,0x04,0x0A,0x05,0x36,0x05,0x63,0x05
        .byte   0x8F,0x05,0xBB,0x05,0xE6,0x05,0x12,0x06,0x3E,0x06,0x6A,0x06,0x96,0x06,0xC1,0x06
        .byte   0xED,0x06,0x19,0x07,0x44,0x07,0x70,0x07,0x9B,0x07,0xC6,0x07,0xF2,0x07,0x1D,0x08
        .byte   0x48,0x08,0x73,0x08,0x9E,0x08,0xC9,0x08,0xF4,0x08,0x1F,0x09,0x4A,0x09,0x75,0x09
        .byte   0x9F,0x09,0xCA,0x09,0xF4,0x09,0x1F,0x0A,0x49,0x0A,0x74,0x0A,0x9E,0x0A,0xC8,0x0A
        .byte   0xF2,0x0A,0x1C,0x0B,0x46,0x0B,0x6F,0x0B,0x99,0x0B,0xC3,0x0B,0xEC,0x0B,0x16,0x0C
        .byte   0x3F,0x0C,0x68,0x0C,0x91,0x0C,0xBA,0x0C,0xE3,0x0C,0x0C,0x0D,0x35,0x0D,0x5E,0x0D
        .byte   0x86,0x0D,0xAF,0x0D,0xD7,0x0D,0xFF,0x0D,0x27,0x0E,0x4F,0x0E,0x77,0x0E,0x9F,0x0E
        .byte   0xC7,0x0E,0xEE,0x0E,0x16,0x0F,0x3D,0x0F,0x64,0x0F,0x8B,0x0F,0xB2,0x0F,0xD9,0x0F
        .byte   0x00,0x10,0x27,0x10,0x4D,0x10,0x74,0x10,0x9A,0x10,0xC0,0x10,0xE6,0x10,0x0C,0x11
        .byte   0x32,0x11,0x57,0x11,0x7D,0x11,0xA2,0x11,0xC7,0x11,0xEC,0x11,0x11,0x12,0x36,0x12
        .byte   0x5B,0x12,0x7F,0x12,0xA4,0x12,0xC8,0x12,0xEC,0x12,0x10,0x13,0x34,0x13,0x57,0x13
        .byte   0x7B,0x13,0x9E,0x13,0xC2,0x13,0xE5,0x13,0x08,0x14,0x2A,0x14,0x4D,0x14,0x6F,0x14
        .byte   0x92,0x14,0xB4,0x14,0xD6,0x14,0xF8,0x14,0x19,0x15,0x3B,0x15,0x5C,0x15,0x7D,0x15
        .byte   0x9E,0x15,0xBF,0x15,0xE0,0x15,0x01,0x16,0x21,0x16,0x41,0x16,0x61,0x16,0x81,0x16
        .byte   0xA1,0x16,0xC0,0x16,0xDF,0x16,0xFF,0x16,0x1E,0x17,0x3C,0x17,0x5B,0x17,0x7A,0x17
        .byte   0x98,0x17,0xB6,0x17,0xD4,0x17,0xF2,0x17,0x0F,0x18,0x2C,0x18,0x4A,0x18,0x67,0x18
        .byte   0x83,0x18,0xA0,0x18,0xBD,0x18,0xD9,0x18,0xF5,0x18,0x11,0x19,0x2C,0x19,0x48,0x19
        .byte   0x63,0x19,0x7E,0x19,0x99,0x19,0xB4,0x19,0xCE,0x19,0xE9,0x19,0x03,0x1A,0x1D,0x1A
        .byte   0x36,0x1A,0x50,0x1A,0x69,0x1A,0x82,0x1A,0x9B,0x1A,0xB4,0x1A,0xCD,0x1A,0xE5,0x1A
        .byte   0xFD,0x1A,0x15,0x1B,0x2D,0x1B,0x44,0x1B,0x5B,0x1B,0x73,0x1B,0x89,0x1B,0xA0,0x1B
        .byte   0xB6,0x1B,0xCD,0x1B,0xE3,0x1B,0xF9,0x1B,0x0E,0x1C,0x24,0x1C,0x39,0x1C,0x4E,0x1C
        .byte   0x62,0x1C,0x77,0x1C,0x8B,0x1C,0x9F,0x1C,0xB3,0x1C,0xC7,0x1C,0xDA,0x1C,0xED,0x1C
        .byte   0x00,0x1D,0x13,0x1D,0x26,0x1D,0x38,0x1D,0x4A,0x1D,0x5C,0x1D,0x6E,0x1D,0x7F,0x1D
        .byte   0x90,0x1D,0xA1,0x1D,0xB2,0x1D,0xC3,0x1D,0xD3,0x1D,0xE3,0x1D,0xF3,0x1D,0x03,0x1E
        .byte   0x12,0x1E,0x21,0x1E,0x30,0x1E,0x3F,0x1E,0x4D,0x1E,0x5B,0x1E,0x6A,0x1E,0x77,0x1E
        .byte   0x85,0x1E,0x92,0x1E,0x9F,0x1E,0xAC,0x1E,0xB9,0x1E,0xC5,0x1E,0xD1,0x1E,0xDD,0x1E
        .byte   0xE9,0x1E,0xF4,0x1E,0x00,0x1F,0x0A,0x1F,0x15,0x1F,0x20,0x1F,0x2A,0x1F,0x34,0x1F
        .byte   0x3E,0x1F,0x47,0x1F,0x51,0x1F,0x5A,0x1F,0x63,0x1F,0x6B,0x1F,0x74,0x1F,0x7C,0x1F
        .byte   0x84,0x1F,0x8B,0x1F,0x93,0x1F,0x9A,0x1F,0xA1,0x1F,0xA7,0x1F,0xAE,0x1F,0xB4,0x1F
        .byte   0xBA,0x1F,0xC0,0x1F,0xC5,0x1F,0xCA,0x1F,0xCF,0x1F,0xD4,0x1F,0xD9,0x1F,0xDD,0x1F
        .byte   0xE1,0x1F,0xE5,0x1F,0xE8,0x1F,0xEB,0x1F,0xEE,0x1F,0xF1,0x1F,0xF4,0x1F,0xF6,0x1F
        .byte   0xF8,0x1F,0xFA,0x1F,0xFC,0x1F,0xFD,0x1F,0xFE,0x1F,0xFF,0x1F,0x00,0x20,0x00,0x20
        .byte   0x00,0x20,0x00,0x20,0x00,0x20,0xFF,0x1F,0xFE,0x1F,0xFD,0x1F,0xFC,0x1F,0xFA,0x1F
        .byte   0xF8,0x1F,0xF6,0x1F,0xF4,0x1F,0xF1,0x1F,0xEE,0x1F,0xEB,0x1F,0xE8,0x1F,0xE5,0x1F
        .byte   0xE1,0x1F,0xDD,0x1F,0xD9,0x1F,0xD4,0x1F,0xCF,0x1F,0xCA,0x1F,0xC5,0x1F,0xC0,0x1F
        .byte   0xBA,0x1F,0xB4,0x1F,0xAE,0x1F,0xA7,0x1F,0xA1,0x1F,0x9A,0x1F,0x93,0x1F,0x8B,0x1F
        .byte   0x84,0x1F,0x7C,0x1F,0x74,0x1F,0x6B,0x1F,0x63,0x1F,0x5A,0x1F,0x51,0x1F,0x47,0x1F
        .byte   0x3E,0x1F,0x34,0x1F,0x2A,0x1F,0x20,0x1F,0x15,0x1F,0x0A,0x1F,0x00,0x1F,0xF4,0x1E
        .byte   0xE9,0x1E,0xDD,0x1E,0xD1,0x1E,0xC5,0x1E,0xB9,0x1E,0xAC,0x1E,0x9F,0x1E,0x92,0x1E
        .byte   0x85,0x1E,0x77,0x1E,0x6A,0x1E,0x5B,0x1E,0x4D,0x1E,0x3F,0x1E,0x30,0x1E,0x21,0x1E
        .byte   0x12,0x1E,0x03,0x1E,0xF3,0x1D,0xE3,0x1D,0xD3,0x1D,0xC3,0x1D,0xB2,0x1D,0xA1,0x1D
        .byte   0x90,0x1D,0x7F,0x1D,0x6E,0x1D,0x5C,0x1D,0x4A,0x1D,0x38,0x1D,0x26,0x1D,0x13,0x1D
        .byte   0x00,0x1D,0xED,0x1C,0xDA,0x1C,0xC7,0x1C,0xB3,0x1C,0x9F,0x1C,0x8B,0x1C,0x77,0x1C
        .byte   0x62,0x1C,0x4E,0x1C,0x39,0x1C,0x24,0x1C,0x0E,0x1C,0xF9,0x1B,0xE3,0x1B,0xCD,0x1B
        .byte   0xB6,0x1B,0xA0,0x1B,0x89,0x1B,0x73,0x1B,0x5B,0x1B,0x44,0x1B,0x2D,0x1B,0x15,0x1B
        .byte   0xFD,0x1A,0xE5,0x1A,0xCD,0x1A,0xB4,0x1A,0x9B,0x1A,0x82,0x1A,0x69,0x1A,0x50,0x1A
        .byte   0x36,0x1A,0x1D,0x1A,0x03,0x1A,0xE9,0x19,0xCE,0x19,0xB4,0x19,0x99,0x19,0x7E,0x19
        .byte   0x63,0x19,0x48,0x19,0x2C,0x19,0x11,0x19,0xF5,0x18,0xD9,0x18,0xBD,0x18,0xA0,0x18
        .byte   0x83,0x18,0x67,0x18,0x4A,0x18,0x2C,0x18,0x0F,0x18,0xF2,0x17,0xD4,0x17,0xB6,0x17
        .byte   0x98,0x17,0x7A,0x17,0x5B,0x17,0x3C,0x17,0x1E,0x17,0xFF,0x16,0xDF,0x16,0xC0,0x16
        .byte   0xA1,0x16,0x81,0x16,0x61,0x16,0x41,0x16,0x21,0x16,0x01,0x16,0xE0,0x15,0xBF,0x15
        .byte   0x9E,0x15,0x7D,0x15,0x5C,0x15,0x3B,0x15,0x19,0x15,0xF8,0x14,0xD6,0x14,0xB4,0x14
        .byte   0x92,0x14,0x6F,0x14,0x4D,0x14,0x2A,0x14,0x08,0x14,0xE5,0x13,0xC2,0x13,0x9E,0x13
        .byte   0x7B,0x13,0x57,0x13,0x34,0x13,0x10,0x13,0xEC,0x12,0xC8,0x12,0xA4,0x12,0x7F,0x12
        .byte   0x5B,0x12,0x36,0x12,0x11,0x12,0xEC,0x11,0xC7,0x11,0xA2,0x11,0x7D,0x11,0x57,0x11
        .byte   0x32,0x11,0x0C,0x11,0xE6,0x10,0xC0,0x10,0x9A,0x10,0x74,0x10,0x4D,0x10,0x27,0x10
        .byte   0x00,0x10,0xD9,0x0F,0xB2,0x0F,0x8B,0x0F,0x64,0x0F,0x3D,0x0F,0x16,0x0F,0xEE,0x0E
        .byte   0xC7,0x0E,0x9F,0x0E,0x77,0x0E,0x4F,0x0E,0x27,0x0E,0xFF,0x0D,0xD7,0x0D,0xAF,0x0D
        .byte   0x86,0x0D,0x5E,0x0D,0x35,0x0D,0x0C,0x0D,0xE3,0x0C,0xBA,0x0C,0x91,0x0C,0x68,0x0C
        .byte   0x3F,0x0C,0x16,0x0C,0xEC,0x0B,0xC3,0x0B,0x99,0x0B,0x6F,0x0B,0x46,0x0B,0x1C,0x0B
        .byte   0xF2,0x0A,0xC8,0x0A,0x9E,0x0A,0x74,0x0A,0x49,0x0A,0x1F,0x0A,0xF4,0x09,0xCA,0x09
        .byte   0x9F,0x09,0x75,0x09,0x4A,0x09,0x1F,0x09,0xF4,0x08,0xC9,0x08,0x9E,0x08,0x73,0x08
        .byte   0x48,0x08,0x1D,0x08,0xF2,0x07,0xC6,0x07,0x9B,0x07,0x70,0x07,0x44,0x07,0x19,0x07
        .byte   0xED,0x06,0xC1,0x06,0x96,0x06,0x6A,0x06,0x3E,0x06,0x12,0x06,0xE6,0x05,0xBB,0x05
        .byte   0x8F,0x05,0x63,0x05,0x36,0x05,0x0A,0x05,0xDE,0x04,0xB2,0x04,0x86,0x04,0x5A,0x04
        .byte   0x2D,0x04,0x01,0x04,0xD5,0x03,0xA8,0x03,0x7C,0x03,0x4F,0x03,0x23,0x03,0xF6,0x02
        .byte   0xCA,0x02,0x9D,0x02,0x71,0x02,0x44,0x02,0x18,0x02,0xEB,0x01,0xBF,0x01,0x92,0x01
        .byte   0x65,0x01,0x39,0x01,0x0C,0x01,0xDF,0x00,0xB3,0x00,0x86,0x00,0x59,0x00,0x2D,0x00
        .byte   0x00,0x00,0xD3,0xFF,0xA7,0xFF,0x7A,0xFF,0x4D,0xFF,0x21,0xFF,0xF4,0xFE,0xC7,0xFE
        .byte   0x9B,0xFE,0x6E,0xFE,0x41,0xFE,0x15,0xFE,0xE8,0xFD,0xBC,0xFD,0x8F,0xFD,0x63,0xFD
        .byte   0x36,0xFD,0x0A,0xFD,0xDD,0xFC,0xB1,0xFC,0x84,0xFC,0x58,0xFC,0x2B,0xFC,0xFF,0xFB
        .byte   0xD3,0xFB,0xA6,0xFB,0x7A,0xFB,0x4E,0xFB,0x22,0xFB,0xF6,0xFA,0xCA,0xFA,0x9D,0xFA
        .byte   0x71,0xFA,0x45,0xFA,0x1A,0xFA,0xEE,0xF9,0xC2,0xF9,0x96,0xF9,0x6A,0xF9,0x3F,0xF9
        .byte   0x13,0xF9,0xE7,0xF8,0xBC,0xF8,0x90,0xF8,0x65,0xF8,0x3A,0xF8,0x0E,0xF8,0xE3,0xF7
        .byte   0xB8,0xF7,0x8D,0xF7,0x62,0xF7,0x37,0xF7,0x0C,0xF7,0xE1,0xF6,0xB6,0xF6,0x8B,0xF6
        .byte   0x61,0xF6,0x36,0xF6,0x0C,0xF6,0xE1,0xF5,0xB7,0xF5,0x8C,0xF5,0x62,0xF5,0x38,0xF5
        .byte   0x0E,0xF5,0xE4,0xF4,0xBA,0xF4,0x91,0xF4,0x67,0xF4,0x3D,0xF4,0x14,0xF4,0xEA,0xF3
        .byte   0xC1,0xF3,0x98,0xF3,0x6F,0xF3,0x46,0xF3,0x1D,0xF3,0xF4,0xF2,0xCB,0xF2,0xA2,0xF2
        .byte   0x7A,0xF2,0x51,0xF2,0x29,0xF2,0x01,0xF2,0xD9,0xF1,0xB1,0xF1,0x89,0xF1,0x61,0xF1
        .byte   0x39,0xF1,0x12,0xF1,0xEA,0xF0,0xC3,0xF0,0x9C,0xF0,0x75,0xF0,0x4E,0xF0,0x27,0xF0
        .byte   0x00,0xF0,0xD9,0xEF,0xB3,0xEF,0x8C,0xEF,0x66,0xEF,0x40,0xEF,0x1A,0xEF,0xF4,0xEE
        .byte   0xCE,0xEE,0xA9,0xEE,0x83,0xEE,0x5E,0xEE,0x39,0xEE,0x14,0xEE,0xEF,0xED,0xCA,0xED
        .byte   0xA5,0xED,0x81,0xED,0x5C,0xED,0x38,0xED,0x14,0xED,0xF0,0xEC,0xCC,0xEC,0xA9,0xEC
        .byte   0x85,0xEC,0x62,0xEC,0x3E,0xEC,0x1B,0xEC,0xF8,0xEB,0xD6,0xEB,0xB3,0xEB,0x91,0xEB
        .byte   0x6E,0xEB,0x4C,0xEB,0x2A,0xEB,0x08,0xEB,0xE7,0xEA,0xC5,0xEA,0xA4,0xEA,0x83,0xEA
        .byte   0x62,0xEA,0x41,0xEA,0x20,0xEA,0xFF,0xE9,0xDF,0xE9,0xBF,0xE9,0x9F,0xE9,0x7F,0xE9
        .byte   0x5F,0xE9,0x40,0xE9,0x21,0xE9,0x01,0xE9,0xE2,0xE8,0xC4,0xE8,0xA5,0xE8,0x86,0xE8
        .byte   0x68,0xE8,0x4A,0xE8,0x2C,0xE8,0x0E,0xE8,0xF1,0xE7,0xD4,0xE7,0xB6,0xE7,0x99,0xE7
        .byte   0x7D,0xE7,0x60,0xE7,0x43,0xE7,0x27,0xE7,0x0B,0xE7,0xEF,0xE6,0xD4,0xE6,0xB8,0xE6
        .byte   0x9D,0xE6,0x82,0xE6,0x67,0xE6,0x4C,0xE6,0x32,0xE6,0x17,0xE6,0xFD,0xE5,0xE3,0xE5
        .byte   0xCA,0xE5,0xB0,0xE5,0x97,0xE5,0x7E,0xE5,0x65,0xE5,0x4C,0xE5,0x33,0xE5,0x1B,0xE5
        .byte   0x03,0xE5,0xEB,0xE4,0xD3,0xE4,0xBC,0xE4,0xA5,0xE4,0x8D,0xE4,0x77,0xE4,0x60,0xE4
        .byte   0x4A,0xE4,0x33,0xE4,0x1D,0xE4,0x07,0xE4,0xF2,0xE3,0xDC,0xE3,0xC7,0xE3,0xB2,0xE3
        .byte   0x9E,0xE3,0x89,0xE3,0x75,0xE3,0x61,0xE3,0x4D,0xE3,0x39,0xE3,0x26,0xE3,0x13,0xE3
        .byte   0x00,0xE3,0xED,0xE2,0xDA,0xE2,0xC8,0xE2,0xB6,0xE2,0xA4,0xE2,0x92,0xE2,0x81,0xE2
        .byte   0x70,0xE2,0x5F,0xE2,0x4E,0xE2,0x3D,0xE2,0x2D,0xE2,0x1D,0xE2,0x0D,0xE2,0xFD,0xE1
        .byte   0xEE,0xE1,0xDF,0xE1,0xD0,0xE1,0xC1,0xE1,0xB3,0xE1,0xA5,0xE1,0x96,0xE1,0x89,0xE1
        .byte   0x7B,0xE1,0x6E,0xE1,0x61,0xE1,0x54,0xE1,0x47,0xE1,0x3B,0xE1,0x2F,0xE1,0x23,0xE1
        .byte   0x17,0xE1,0x0C,0xE1,0x00,0xE1,0xF6,0xE0,0xEB,0xE0,0xE0,0xE0,0xD6,0xE0,0xCC,0xE0
        .byte   0xC2,0xE0,0xB9,0xE0,0xAF,0xE0,0xA6,0xE0,0x9D,0xE0,0x95,0xE0,0x8C,0xE0,0x84,0xE0
        .byte   0x7C,0xE0,0x75,0xE0,0x6D,0xE0,0x66,0xE0,0x5F,0xE0,0x59,0xE0,0x52,0xE0,0x4C,0xE0
        .byte   0x46,0xE0,0x40,0xE0,0x3B,0xE0,0x36,0xE0,0x31,0xE0,0x2C,0xE0,0x27,0xE0,0x23,0xE0
        .byte   0x1F,0xE0,0x1B,0xE0,0x18,0xE0,0x15,0xE0,0x12,0xE0,0x0F,0xE0,0x0C,0xE0,0x0A,0xE0
        .byte   0x08,0xE0,0x06,0xE0,0x04,0xE0,0x03,0xE0,0x02,0xE0,0x01,0xE0,0x00,0xE0,0x00,0xE0
        .byte   0x00,0xE0,0x00,0xE0,0x00,0xE0,0x01,0xE0,0x02,0xE0,0x03,0xE0,0x04,0xE0,0x06,0xE0
        .byte   0x08,0xE0,0x0A,0xE0,0x0C,0xE0,0x0F,0xE0,0x12,0xE0,0x15,0xE0,0x18,0xE0,0x1B,0xE0
        .byte   0x1F,0xE0,0x23,0xE0,0x27,0xE0,0x2C,0xE0,0x31,0xE0,0x36,0xE0,0x3B,0xE0,0x40,0xE0
        .byte   0x46,0xE0,0x4C,0xE0,0x52,0xE0,0x59,0xE0,0x5F,0xE0,0x66,0xE0,0x6D,0xE0,0x75,0xE0
        .byte   0x7C,0xE0,0x84,0xE0,0x8C,0xE0,0x95,0xE0,0x9D,0xE0,0xA6,0xE0,0xAF,0xE0,0xB9,0xE0
        .byte   0xC2,0xE0,0xCC,0xE0,0xD6,0xE0,0xE0,0xE0,0xEB,0xE0,0xF6,0xE0,0x00,0xE1,0x0C,0xE1
        .byte   0x17,0xE1,0x23,0xE1,0x2F,0xE1,0x3B,0xE1,0x47,0xE1,0x54,0xE1,0x61,0xE1,0x6E,0xE1
        .byte   0x7B,0xE1,0x89,0xE1,0x96,0xE1,0xA5,0xE1,0xB3,0xE1,0xC1,0xE1,0xD0,0xE1,0xDF,0xE1
        .byte   0xEE,0xE1,0xFD,0xE1,0x0D,0xE2,0x1D,0xE2,0x2D,0xE2,0x3D,0xE2,0x4E,0xE2,0x5F,0xE2
        .byte   0x70,0xE2,0x81,0xE2,0x92,0xE2,0xA4,0xE2,0xB6,0xE2,0xC8,0xE2,0xDA,0xE2,0xED,0xE2
        .byte   0x00,0xE3,0x13,0xE3,0x26,0xE3,0x39,0xE3,0x4D,0xE3,0x61,0xE3,0x75,0xE3,0x89,0xE3
        .byte   0x9E,0xE3,0xB2,0xE3,0xC7,0xE3,0xDC,0xE3,0xF2,0xE3,0x07,0xE4,0x1D,0xE4,0x33,0xE4
        .byte   0x4A,0xE4,0x60,0xE4,0x77,0xE4,0x8D,0xE4,0xA5,0xE4,0xBC,0xE4,0xD3,0xE4,0xEB,0xE4
        .byte   0x03,0xE5,0x1B,0xE5,0x33,0xE5,0x4C,0xE5,0x65,0xE5,0x7E,0xE5,0x97,0xE5,0xB0,0xE5
        .byte   0xCA,0xE5,0xE3,0xE5,0xFD,0xE5,0x17,0xE6,0x32,0xE6,0x4C,0xE6,0x67,0xE6,0x82,0xE6
        .byte   0x9D,0xE6,0xB8,0xE6,0xD4,0xE6,0xEF,0xE6,0x0B,0xE7,0x27,0xE7,0x43,0xE7,0x60,0xE7
        .byte   0x7D,0xE7,0x99,0xE7,0xB6,0xE7,0xD4,0xE7,0xF1,0xE7,0x0E,0xE8,0x2C,0xE8,0x4A,0xE8
        .byte   0x68,0xE8,0x86,0xE8,0xA5,0xE8,0xC4,0xE8,0xE2,0xE8,0x01,0xE9,0x21,0xE9,0x40,0xE9
        .byte   0x5F,0xE9,0x7F,0xE9,0x9F,0xE9,0xBF,0xE9,0xDF,0xE9,0xFF,0xE9,0x20,0xEA,0x41,0xEA
        .byte   0x62,0xEA,0x83,0xEA,0xA4,0xEA,0xC5,0xEA,0xE7,0xEA,0x08,0xEB,0x2A,0xEB,0x4C,0xEB
        .byte   0x6E,0xEB,0x91,0xEB,0xB3,0xEB,0xD6,0xEB,0xF8,0xEB,0x1B,0xEC,0x3E,0xEC,0x62,0xEC
        .byte   0x85,0xEC,0xA9,0xEC,0xCC,0xEC,0xF0,0xEC,0x14,0xED,0x38,0xED,0x5C,0xED,0x81,0xED
        .byte   0xA5,0xED,0xCA,0xED,0xEF,0xED,0x14,0xEE,0x39,0xEE,0x5E,0xEE,0x83,0xEE,0xA9,0xEE
        .byte   0xCE,0xEE,0xF4,0xEE,0x1A,0xEF,0x40,0xEF,0x66,0xEF,0x8C,0xEF,0xB3,0xEF,0xD9,0xEF
        .byte   0x00,0xF0,0x27,0xF0,0x4E,0xF0,0x75,0xF0,0x9C,0xF0,0xC3,0xF0,0xEA,0xF0,0x12,0xF1
        .byte   0x39,0xF1,0x61,0xF1,0x89,0xF1,0xB1,0xF1,0xD9,0xF1,0x01,0xF2,0x29,0xF2,0x51,0xF2
        .byte   0x7A,0xF2,0xA2,0xF2,0xCB,0xF2,0xF4,0xF2,0x1D,0xF3,0x46,0xF3,0x6F,0xF3,0x98,0xF3
        .byte   0xC1,0xF3,0xEA,0xF3,0x14,0xF4,0x3D,0xF4,0x67,0xF4,0x91,0xF4,0xBA,0xF4,0xE4,0xF4
        .byte   0x0E,0xF5,0x38,0xF5,0x62,0xF5,0x8C,0xF5,0xB7,0xF5,0xE1,0xF5,0x0C,0xF6,0x36,0xF6
        .byte   0x61,0xF6,0x8B,0xF6,0xB6,0xF6,0xE1,0xF6,0x0C,0xF7,0x37,0xF7,0x62,0xF7,0x8D,0xF7
        .byte   0xB8,0xF7,0xE3,0xF7,0x0E,0xF8,0x3A,0xF8,0x65,0xF8,0x90,0xF8,0xBC,0xF8,0xE7,0xF8
        .byte   0x13,0xF9,0x3F,0xF9,0x6A,0xF9,0x96,0xF9,0xC2,0xF9,0xEE,0xF9,0x1A,0xFA,0x45,0xFA
        .byte   0x71,0xFA,0x9D,0xFA,0xCA,0xFA,0xF6,0xFA,0x22,0xFB,0x4E,0xFB,0x7A,0xFB,0xA6,0xFB
        .byte   0xD3,0xFB,0xFF,0xFB,0x2B,0xFC,0x58,0xFC,0x84,0xFC,0xB1,0xFC,0xDD,0xFC,0x0A,0xFD
        .byte   0x36,0xFD,0x63,0xFD,0x8F,0xFD,0xBC,0xFD,0xE8,0xFD,0x15,0xFE,0x41,0xFE,0x6E,0xFE
        .byte   0x9B,0xFE,0xC7,0xFE,0xF4,0xFE,0x21,0xFF,0x4D,0xFF,0x7A,0xFF,0xA7,0xFF,0xD3,0xFF
        .byte   0x00,0x00,0x2D,0x00,0x59,0x00,0x86,0x00,0xB3,0x00,0xDF,0x00,0x0C,0x01,0x39,0x01
        .byte   0x65,0x01,0x92,0x01,0xBF,0x01,0xEB,0x01,0x18,0x02,0x44,0x02,0x71,0x02,0x9D,0x02
        .byte   0xCA,0x02,0xF6,0x02,0x23,0x03,0x4F,0x03,0x7C,0x03,0xA8,0x03,0xD5,0x03,0x01,0x04
        .byte   0x2D,0x04,0x5A,0x04,0x86,0x04,0xB2,0x04,0xDE,0x04,0x0A,0x05,0x36,0x05,0x63,0x05
        .byte   0x8F,0x05,0xBB,0x05,0xE6,0x05,0x12,0x06,0x3E,0x06,0x6A,0x06,0x96,0x06,0xC1,0x06
        .byte   0xED,0x06,0x19,0x07,0x44,0x07,0x70,0x07,0x9B,0x07,0xC6,0x07,0xF2,0x07,0x1D,0x08
        .byte   0x48,0x08,0x73,0x08,0x9E,0x08,0xC9,0x08,0xF4,0x08,0x1F,0x09,0x4A,0x09,0x75,0x09
        .byte   0x9F,0x09,0xCA,0x09,0xF4,0x09,0x1F,0x0A,0x49,0x0A,0x74,0x0A,0x9E,0x0A,0xC8,0x0A
        .byte   0xF2,0x0A,0x1C,0x0B,0x46,0x0B,0x6F,0x0B,0x99,0x0B,0xC3,0x0B,0xEC,0x0B,0x16,0x0C
        .byte   0x3F,0x0C,0x68,0x0C,0x91,0x0C,0xBA,0x0C,0xE3,0x0C,0x0C,0x0D,0x35,0x0D,0x5E,0x0D
        .byte   0x86,0x0D,0xAF,0x0D,0xD7,0x0D,0xFF,0x0D,0x27,0x0E,0x4F,0x0E,0x77,0x0E,0x9F,0x0E
        .byte   0xC7,0x0E,0xEE,0x0E,0x16,0x0F,0x3D,0x0F,0x64,0x0F,0x8B,0x0F,0xB2,0x0F,0xD9,0x0F
        .byte   0x00,0x10,0x27,0x10,0x4D,0x10,0x74,0x10,0x9A,0x10,0xC0,0x10,0xE6,0x10,0x0C,0x11
        .byte   0x32,0x11,0x57,0x11,0x7D,0x11,0xA2,0x11,0xC7,0x11,0xEC,0x11,0x11,0x12,0x36,0x12
        .byte   0x5B,0x12,0x7F,0x12,0xA4,0x12,0xC8,0x12,0xEC,0x12,0x10,0x13,0x34,0x13,0x57,0x13
        .byte   0x7B,0x13,0x9E,0x13,0xC2,0x13,0xE5,0x13,0x08,0x14,0x2A,0x14,0x4D,0x14,0x6F,0x14
        .byte   0x92,0x14,0xB4,0x14,0xD6,0x14,0xF8,0x14,0x19,0x15,0x3B,0x15,0x5C,0x15,0x7D,0x15
        .byte   0x9E,0x15,0xBF,0x15,0xE0,0x15,0x01,0x16,0x21,0x16,0x41,0x16,0x61,0x16,0x81,0x16
        .byte   0xA1,0x16,0xC0,0x16,0xDF,0x16,0xFF,0x16,0x1E,0x17,0x3C,0x17,0x5B,0x17,0x7A,0x17
        .byte   0x98,0x17,0xB6,0x17,0xD4,0x17,0xF2,0x17,0x0F,0x18,0x2C,0x18,0x4A,0x18,0x67,0x18
        .byte   0x83,0x18,0xA0,0x18,0xBD,0x18,0xD9,0x18,0xF5,0x18,0x11,0x19,0x2C,0x19,0x48,0x19
        .byte   0x63,0x19,0x7E,0x19,0x99,0x19,0xB4,0x19,0xCE,0x19,0xE9,0x19,0x03,0x1A,0x1D,0x1A
        .byte   0x36,0x1A,0x50,0x1A,0x69,0x1A,0x82,0x1A,0x9B,0x1A,0xB4,0x1A,0xCD,0x1A,0xE5,0x1A
        .byte   0xFD,0x1A,0x15,0x1B,0x2D,0x1B,0x44,0x1B,0x5B,0x1B,0x73,0x1B,0x89,0x1B,0xA0,0x1B
        .byte   0xB6,0x1B,0xCD,0x1B,0xE3,0x1B,0xF9,0x1B,0x0E,0x1C,0x24,0x1C,0x39,0x1C,0x4E,0x1C
        .byte   0x62,0x1C,0x77,0x1C,0x8B,0x1C,0x9F,0x1C,0xB3,0x1C,0xC7,0x1C,0xDA,0x1C,0xED,0x1C
        .byte   0x00,0x1D,0x13,0x1D,0x26,0x1D,0x38,0x1D,0x4A,0x1D,0x5C,0x1D,0x6E,0x1D,0x7F,0x1D
        .byte   0x90,0x1D,0xA1,0x1D,0xB2,0x1D,0xC3,0x1D,0xD3,0x1D,0xE3,0x1D,0xF3,0x1D,0x03,0x1E
        .byte   0x12,0x1E,0x21,0x1E,0x30,0x1E,0x3F,0x1E,0x4D,0x1E,0x5B,0x1E,0x6A,0x1E,0x77,0x1E
        .byte   0x85,0x1E,0x92,0x1E,0x9F,0x1E,0xAC,0x1E,0xB9,0x1E,0xC5,0x1E,0xD1,0x1E,0xDD,0x1E
        .byte   0xE9,0x1E,0xF4,0x1E,0x00,0x1F,0x0A,0x1F,0x15,0x1F,0x20,0x1F,0x2A,0x1F,0x34,0x1F
        .byte   0x3E,0x1F,0x47,0x1F,0x51,0x1F,0x5A,0x1F,0x63,0x1F,0x6B,0x1F,0x74,0x1F,0x7C,0x1F
        .byte   0x84,0x1F,0x8B,0x1F,0x93,0x1F,0x9A,0x1F,0xA1,0x1F,0xA7,0x1F,0xAE,0x1F,0xB4,0x1F
        .byte   0xBA,0x1F,0xC0,0x1F,0xC5,0x1F,0xCA,0x1F,0xCF,0x1F,0xD4,0x1F,0xD9,0x1F,0xDD,0x1F
        .byte   0xE1,0x1F,0xE5,0x1F,0xE8,0x1F,0xEB,0x1F,0xEE,0x1F,0xF1,0x1F,0xF4,0x1F,0xF6,0x1F
        .byte   0xF8,0x1F,0xFA,0x1F,0xFC,0x1F,0xFD,0x1F,0xFE,0x1F,0xFF,0x1F,0x00,0x20,0x00,0x20
LDGJ_phs_tbl_stg:
        .byte   0x00,0x40,0x00,0x00,0x00,0x00,0x00,0x40,0x21,0x3B,0x7E,0x18,0x82,0xE7,0x21,0x3B
        .byte   0x41,0x2D,0x41,0x2D,0xBF,0xD2,0x41,0x2D,0x7E,0x18,0x21,0x3B,0xDF,0xC4,0x7E,0x18
        .byte   0x00,0x00,0x00,0x40,0x00,0xC0,0x00,0x00,0x82,0xE7,0x21,0x3B,0xDF,0xC4,0x82,0xE7
        .byte   0xBF,0xD2,0x41,0x2D,0xBF,0xD2,0xBF,0xD2,0xDF,0xC4,0x7E,0x18,0x82,0xE7,0xDF,0xC4
        .byte   0x00,0x40,0x00,0x00,0x00,0x00,0x00,0x40,0xC5,0x3E,0x7C,0x0C,0x84,0xF3,0xC5,0x3E
        .byte   0x21,0x3B,0x7E,0x18,0x82,0xE7,0x21,0x3B,0x37,0x35,0x8E,0x23,0x72,0xDC,0x37,0x35
        .byte   0x41,0x2D,0x41,0x2D,0xBF,0xD2,0x41,0x2D,0x8E,0x23,0x37,0x35,0xC9,0xCA,0x8E,0x23
        .byte   0x7E,0x18,0x21,0x3B,0xDF,0xC4,0x7E,0x18,0x7C,0x0C,0xC5,0x3E,0x3B,0xC1,0x7C,0x0C
        .byte   0x00,0x00,0x00,0x40,0x00,0xC0,0x00,0x00,0x84,0xF3,0xC5,0x3E,0x3B,0xC1,0x84,0xF3
        .byte   0x82,0xE7,0x21,0x3B,0xDF,0xC4,0x82,0xE7,0x72,0xDC,0x37,0x35,0xC9,0xCA,0x72,0xDC
        .byte   0xBF,0xD2,0x41,0x2D,0xBF,0xD2,0xBF,0xD2,0xC9,0xCA,0x8E,0x23,0x72,0xDC,0xC9,0xCA
        .byte   0xDF,0xC4,0x7E,0x18,0x82,0xE7,0xDF,0xC4,0x3B,0xC1,0x7C,0x0C,0x84,0xF3,0x3B,0xC1
        .byte   0x00,0x40,0x00,0x00,0x00,0x00,0x00,0x40,0xB1,0x3F,0x46,0x06,0xBA,0xF9,0xB1,0x3F
        .byte   0xC5,0x3E,0x7C,0x0C,0x84,0xF3,0xC5,0x3E,0x3F,0x3D,0x94,0x12,0x6C,0xED,0x3F,0x3D
        .byte   0x21,0x3B,0x7E,0x18,0x82,0xE7,0x21,0x3B,0x71,0x38,0x2B,0x1E,0xD5,0xE1,0x71,0x38
        .byte   0x37,0x35,0x8E,0x23,0x72,0xDC,0x37,0x35,0x79,0x31,0x9A,0x28,0x66,0xD7,0x79,0x31
        .byte   0x41,0x2D,0x41,0x2D,0xBF,0xD2,0x41,0x2D,0x9A,0x28,0x79,0x31,0x87,0xCE,0x9A,0x28
        .byte   0x8E,0x23,0x37,0x35,0xC9,0xCA,0x8E,0x23,0x2B,0x1E,0x71,0x38,0x8F,0xC7,0x2B,0x1E
        .byte   0x7E,0x18,0x21,0x3B,0xDF,0xC4,0x7E,0x18,0x94,0x12,0x3F,0x3D,0xC1,0xC2,0x94,0x12
        .byte   0x7C,0x0C,0xC5,0x3E,0x3B,0xC1,0x7C,0x0C,0x46,0x06,0xB1,0x3F,0x4F,0xC0,0x46,0x06
        .byte   0x00,0x00,0x00,0x40,0x00,0xC0,0x00,0x00,0xBA,0xF9,0xB1,0x3F,0x4F,0xC0,0xBA,0xF9
        .byte   0x84,0xF3,0xC5,0x3E,0x3B,0xC1,0x84,0xF3,0x6C,0xED,0x3F,0x3D,0xC1,0xC2,0x6C,0xED
        .byte   0x82,0xE7,0x21,0x3B,0xDF,0xC4,0x82,0xE7,0xD5,0xE1,0x71,0x38,0x8F,0xC7,0xD5,0xE1
        .byte   0x72,0xDC,0x37,0x35,0xC9,0xCA,0x72,0xDC,0x66,0xD7,0x79,0x31,0x87,0xCE,0x66,0xD7
        .byte   0xBF,0xD2,0x41,0x2D,0xBF,0xD2,0xBF,0xD2,0x87,0xCE,0x9A,0x28,0x66,0xD7,0x87,0xCE
        .byte   0xC9,0xCA,0x8E,0x23,0x72,0xDC,0xC9,0xCA,0x8F,0xC7,0x2B,0x1E,0xD5,0xE1,0x8F,0xC7
        .byte   0xDF,0xC4,0x7E,0x18,0x82,0xE7,0xDF,0xC4,0xC1,0xC2,0x94,0x12,0x6C,0xED,0xC1,0xC2
        .byte   0x3B,0xC1,0x7C,0x0C,0x84,0xF3,0x3B,0xC1,0x4F,0xC0,0x46,0x06,0xBA,0xF9,0x4F,0xC0
        .byte   0x00,0x40,0x00,0x00,0x00,0x00,0x00,0x40,0xEC,0x3F,0x24,0x03,0xDC,0xFC,0xEC,0x3F
        .byte   0xB1,0x3F,0x46,0x06,0xBA,0xF9,0xB1,0x3F,0x4F,0x3F,0x64,0x09,0x9C,0xF6,0x4F,0x3F
        .byte   0xC5,0x3E,0x7C,0x0C,0x84,0xF3,0xC5,0x3E,0x15,0x3E,0x8D,0x0F,0x73,0xF0,0x15,0x3E
        .byte   0x3F,0x3D,0x94,0x12,0x6C,0xED,0x3F,0x3D,0x42,0x3C,0x90,0x15,0x70,0xEA,0x42,0x3C
        .byte   0x21,0x3B,0x7E,0x18,0x82,0xE7,0x21,0x3B,0xDB,0x39,0x5D,0x1B,0xA3,0xE4,0xDB,0x39
        .byte   0x71,0x38,0x2B,0x1E,0xD5,0xE1,0x71,0x38,0xE5,0x36,0xE7,0x20,0x19,0xDF,0xE5,0x36
        .byte   0x37,0x35,0x8E,0x23,0x72,0xDC,0x37,0x35,0x68,0x33,0x20,0x26,0xE0,0xD9,0x68,0x33
        .byte   0x79,0x31,0x9A,0x28,0x66,0xD7,0x79,0x31,0x6C,0x2F,0xFB,0x2A,0x05,0xD5,0x6C,0x2F
        .byte   0x41,0x2D,0x41,0x2D,0xBF,0xD2,0x41,0x2D,0xFB,0x2A,0x6C,0x2F,0x94,0xD0,0xFB,0x2A
        .byte   0x9A,0x28,0x79,0x31,0x87,0xCE,0x9A,0x28,0x20,0x26,0x68,0x33,0x98,0xCC,0x20,0x26
        .byte   0x8E,0x23,0x37,0x35,0xC9,0xCA,0x8E,0x23,0xE7,0x20,0xE5,0x36,0x1B,0xC9,0xE7,0x20
        .byte   0x2B,0x1E,0x71,0x38,0x8F,0xC7,0x2B,0x1E,0x5D,0x1B,0xDB,0x39,0x25,0xC6,0x5D,0x1B
        .byte   0x7E,0x18,0x21,0x3B,0xDF,0xC4,0x7E,0x18,0x90,0x15,0x42,0x3C,0xBE,0xC3,0x90,0x15
        .byte   0x94,0x12,0x3F,0x3D,0xC1,0xC2,0x94,0x12,0x8D,0x0F,0x15,0x3E,0xEB,0xC1,0x8D,0x0F
        .byte   0x7C,0x0C,0xC5,0x3E,0x3B,0xC1,0x7C,0x0C,0x64,0x09,0x4F,0x3F,0xB1,0xC0,0x64,0x09
        .byte   0x46,0x06,0xB1,0x3F,0x4F,0xC0,0x46,0x06,0x24,0x03,0xEC,0x3F,0x14,0xC0,0x24,0x03
        .byte   0x00,0x00,0x00,0x40,0x00,0xC0,0x00,0x00,0xDC,0xFC,0xEC,0x3F,0x14,0xC0,0xDC,0xFC
        .byte   0xBA,0xF9,0xB1,0x3F,0x4F,0xC0,0xBA,0xF9,0x9C,0xF6,0x4F,0x3F,0xB1,0xC0,0x9C,0xF6
        .byte   0x84,0xF3,0xC5,0x3E,0x3B,0xC1,0x84,0xF3,0x73,0xF0,0x15,0x3E,0xEB,0xC1,0x73,0xF0
        .byte   0x6C,0xED,0x3F,0x3D,0xC1,0xC2,0x6C,0xED,0x70,0xEA,0x42,0x3C,0xBE,0xC3,0x70,0xEA
        .byte   0x82,0xE7,0x21,0x3B,0xDF,0xC4,0x82,0xE7,0xA3,0xE4,0xDB,0x39,0x25,0xC6,0xA3,0xE4
        .byte   0xD5,0xE1,0x71,0x38,0x8F,0xC7,0xD5,0xE1,0x19,0xDF,0xE5,0x36,0x1B,0xC9,0x19,0xDF
        .byte   0x72,0xDC,0x37,0x35,0xC9,0xCA,0x72,0xDC,0xE0,0xD9,0x68,0x33,0x98,0xCC,0xE0,0xD9
        .byte   0x66,0xD7,0x79,0x31,0x87,0xCE,0x66,0xD7,0x05,0xD5,0x6C,0x2F,0x94,0xD0,0x05,0xD5
        .byte   0xBF,0xD2,0x41,0x2D,0xBF,0xD2,0xBF,0xD2,0x94,0xD0,0xFB,0x2A,0x05,0xD5,0x94,0xD0
        .byte   0x87,0xCE,0x9A,0x28,0x66,0xD7,0x87,0xCE,0x98,0xCC,0x20,0x26,0xE0,0xD9,0x98,0xCC
        .byte   0xC9,0xCA,0x8E,0x23,0x72,0xDC,0xC9,0xCA,0x1B,0xC9,0xE7,0x20,0x19,0xDF,0x1B,0xC9
        .byte   0x8F,0xC7,0x2B,0x1E,0xD5,0xE1,0x8F,0xC7,0x25,0xC6,0x5D,0x1B,0xA3,0xE4,0x25,0xC6
        .byte   0xDF,0xC4,0x7E,0x18,0x82,0xE7,0xDF,0xC4,0xBE,0xC3,0x90,0x15,0x70,0xEA,0xBE,0xC3
        .byte   0xC1,0xC2,0x94,0x12,0x6C,0xED,0xC1,0xC2,0xEB,0xC1,0x8D,0x0F,0x73,0xF0,0xEB,0xC1
        .byte   0x3B,0xC1,0x7C,0x0C,0x84,0xF3,0x3B,0xC1,0xB1,0xC0,0x64,0x09,0x9C,0xF6,0xB1,0xC0
        .byte   0x4F,0xC0,0x46,0x06,0xBA,0xF9,0x4F,0xC0,0x14,0xC0,0x24,0x03,0xDC,0xFC,0x14,0xC0


