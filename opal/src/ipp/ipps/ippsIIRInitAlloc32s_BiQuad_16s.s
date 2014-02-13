        .text
        .align  4
        .globl  _ippsIIRInitAlloc32s_BiQuad_16s


_ippsIIRInitAlloc32s_BiQuad_16s:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r0, #0
        beq     LBOG1
        cmp     r1, #0
        beq     LBOG1
        cmp     r2, #1
        bge     LBOG0
        mvn     r0, #0x18
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBOG0:
        str     r12, [sp]
        bl      LBOG_ownsIIRInitAlloc32s_BiQuad_16s
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBOG1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
LBOG_ownsIIRInitAlloc32s_BiQuad_16s:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0xC
        ldr     r8, [sp, #0x28]
        add     r9, sp, #8
        mov     r4, r2
        mov     r7, r0
        mov     r6, r1
        mov     r1, r9
        mov     r0, r4
        mov     r5, r3
        bl      _ippsIIRGetStateSize32f_BiQuad_16s
        cmp     r0, #0
        addne   sp, sp, #0xC
        ldmneia sp!, {r4 - r9, pc}
        ldr     r0, [sp, #8]
        bl      _ippsMalloc_8u
        mov     r9, r0
        cmp     r9, #0
        bne     LBOG2
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r9, pc}
LBOG2:
        str     r8, [sp]
        str     r9, [sp, #4]
        mov     r2, r4
        mov     r3, r5
        mov     r1, r6
        mov     r0, r7
        bl      LBOG_ownsIIRInit32s_BiQuad_16s
        mov     r4, r0
        cmp     r4, #0
        beq     LBOG3
        mov     r0, r9
        bl      _ippsFree
        mov     r0, r4
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r9, pc}
LBOG3:
        ldr     r7, [r7]
        mov     r1, #1
        mov     r0, #0
        str     r1, [r7, #0x2C]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r9, pc}
LBOG_ownsIIRInit32s_BiQuad_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r12, [sp, #0x50]
        ldr     r5, [pc, #0x6EC]
        ldr     r7, [sp, #0x4C]
        add     r12, r12, #7
        mov     r6, r0
        bic     r12, r12, #7
        str     r12, [r6]
        str     r5, [r12]
        ldr     lr, [r6]
        str     r3, [sp, #8]
        add     r3, r12, #0x40
        str     r3, [lr, #4]
        ldr     r3, [r6]
        mov     r4, r1
        rsb     r8, r2, r2, lsl #2
        mov     r8, r8, lsl #3
        add     r8, r8, #7
        bic     r8, r8, #7
        add     r8, r12, r8
        add     lr, r8, #0x40
        str     lr, [r3, #8]
        ldr     r9, [r6]
        sub     r3, r5, #0xF7
        add     r5, r2, r2, lsl #3
        mov     r12, r2, lsl #3
        add     r5, r2, r5
        add     r12, r12, #7
        add     r5, r5, #7
        bic     r12, r12, #7
        bic     r11, r5, #7
        add     lr, r12, #0x40
        add     r5, r8, lr
        str     r5, [r9, #0xC]
        ldr     r9, [r6]
        add     r5, r8, r12
        add     r10, r11, #0x40
        add     r10, r5, r10
        str     r10, [r9, #0x10]
        ldr     r0, [r6]
        mov     r9, r2, lsl #4
        add     r9, r9, #7
        bic     r9, r9, #7
        add     r10, r12, r11
        add     r10, r8, r10
        add     r8, r11, r9
        add     r11, r9, #0x40
        add     r11, r10, r11
        str     r11, [r0, #0x14]
        ldr     r11, [r6]
        add     r1, lr, r8
        mov     r0, r2, lsl #2
        add     r1, r5, r1
        str     r1, [r11, #0x18]
        add     r0, r0, #7
        bic     r11, r0, #7
        ldr     r0, [r6]
        add     r1, r11, #0x40
        add     r9, r9, r12
        add     r11, r12, r11
        add     r1, r9, r1
        add     r11, r8, r11
        add     r1, r10, r1
        str     r1, [r0, #0x1C]
        add     r8, r5, r11
        ldr     r5, [r6]
        add     lr, lr, r8
        add     r12, r12, #0x81, 26
        str     lr, [r5, #0x20]
        ldr     lr, [r6]
        mov     r5, #0
        add     r8, r8, r12
        str     r5, [lr, #0x24]
        ldr     lr, [r6]
        str     r2, [lr, #0x28]
        ldr     r2, [r6]
        str     r5, [r2, #0x2C]
        ldr     r2, [r6]
        str     r5, [r2, #0x30]
        ldr     r2, [r6]
        str     r5, [r2, #0x34]
        ldr     r2, [r6]
        str     r5, [r2, #0x38]
        ldr     r2, [r6]
        str     r8, [r2, #0x3C]
        ldr     r10, [r6]
        ldr     r2, [r10]
        ldr     r8, [r10, #4]
        ldr     r9, [r10, #0x28]
        cmp     r3, r2
        bne     LBOG8
        add     r2, r4, #4
        ldr     r2, [r2, +r9, lsl #2]
        cmp     r2, #0
        mvneq   r0, #9
        beq     LBOG12
        mov     r0, r4
        mov     r2, r9, lsl #1
        add     r3, r2, #2
        add     r5, r2, #1
        mov     r2, r3, lsl #1
        ldr     r3, [sp, #8]
        mov     r1, r8
        bl      _ippsConvert_32s32f_Sfs
        ldr     r3, [pc, #0x558]
        add     r12, r8, #4
        str     r12, [sp, #0xC]
        ldr     r1, [r12, +r9, lsl #2]
        ldr     r0, [r3]
        add     r11, r9, #1
        bl      __divsf3
        ldr     r1, [r8]
        mov     r4, r0
        bl      __mulsf3
        cmp     r11, #1
        str     r0, [r8]
        ble     LBOG7
        sub     r3, r9, #1
        add     r3, r3, #1
        cmp     r3, #5
        mov     r0, #1
        addlt   r11, r8, r9, lsl #2
        blt     LBOG5
        add     r11, r8, r9, lsl #2
        sub     r12, r9, #4
        add     r3, r9, #1
        str     r9, [sp, #4]
        ldr     r9, [sp, #0xC]
        add     r2, r8, #8
        add     r1, r11, #8
        str     r5, [sp]
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x14]
        str     r6, [sp, #0x18]
        str     r11, [sp, #8]
        str     r12, [sp, #0x20]
        str     r10, [sp, #0x10]
        mov     r5, r0
        mov     r6, r1
        mov     r7, r2
        mov     r8, r3
LBOG4:
        ldr     r0, [r7, #-4]
        mov     r1, r4
        mov     r11, r8, lsl #2
        bl      __mulsf3
        str     r0, [r7, #-4]
        ldr     r0, [r9, +r8, lsl #2]
        mov     r1, r4
        add     r12, r11, #4
        str     r12, [sp, #0x24]
        bl      __mulsf3
        str     r0, [r6, #-4]
        ldr     r0, [r7]
        mov     r1, r4
        add     r10, r11, #8
        bl      __mulsf3
        str     r0, [r7]
        ldr     r12, [sp, #0x24]
        mov     r1, r4
        add     r11, r11, #0xC
        ldr     r0, [r9, +r12]
        add     r8, r8, #4
        add     r5, r5, #4
        bl      __mulsf3
        str     r0, [r6]
        ldr     r0, [r7, #4]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7, #4]
        ldr     r0, [r9, +r10]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r6, #4]
        ldr     r0, [r7, #8]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r7, #8]
        ldr     r0, [r9, +r11]
        mov     r1, r4
        add     r7, r7, #0x10
        bl      __mulsf3
        ldr     r12, [sp, #0x20]
        str     r0, [r6, #8]
        cmp     r5, r12
        add     r6, r6, #0x10
        ble     LBOG4
        mov     r0, r5
        ldr     r11, [sp, #8]
        ldr     r5, [sp]
        ldr     r9, [sp, #4]
        ldr     r8, [sp, #0x1C]
        ldr     r10, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r6, [sp, #0x18]
LBOG5:
        add     r1, r9, #1
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        add     r9, r0, r9
        add     r2, r8, r0, lsl #2
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x14]
        str     r6, [sp, #0x18]
        mov     r8, r9
        mov     r6, r0
        mov     r7, r1
        mov     r9, r2
LBOG6:
        ldr     r0, [r9]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r9], #4
        ldr     r0, [r10, +r8, lsl #2]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r11, +r6, lsl #2]
        add     r6, r6, #1
        cmp     r6, r7
        add     r8, r8, #1
        blt     LBOG6
        ldr     r8, [sp, #0x1C]
        ldr     r10, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r6, [sp, #0x18]
LBOG7:
        ldr     r1, [r10, #0xC]
        mov     r0, r8
        mov     r2, r5
        bl      ownsConvert32fTo16s
        b       LBOG11
LBOG8:
        ldr     r3, [sp, #8]
        add     r11, r9, r9, lsl #2
        add     r2, r9, r11
        mov     r1, r8
        mov     r0, r4
        bl      _ippsConvert_32s32f_Sfs
        cmp     r9, #0
        ble     LBOG10
        ldr     r3, [pc, #0x34C]
        mov     r1, r8
        str     r7, [sp, #0x14]
        mov     r2, r5
        add     r0, r4, #0xC
        mov     r12, r1
        str     r11, [sp, #0xC]
        str     r6, [sp, #0x18]
        mov     r7, r5
        str     r4, [sp]
        str     r12, [sp, #8]
        str     r9, [sp, #4]
        str     r10, [sp, #0x10]
        mov     r11, r0
        mov     r5, r1
        mov     r6, r2
LBOG9:
        ldr     r3, [r11], #0x18
        cmp     r3, #0
        beq     LBOG23
        ldr     r12, [sp]
        ldr     r3, [r12], #0x18
        str     r12, [sp]
        cmp     r3, #0
        beq     LBOG22
        ldr     r3, [pc, #0x2EC]
        add     r10, r8, #4
        add     r9, r8, #8
        ldr     r0, [r3]
        add     r3, r8, #0xC
        str     r3, [sp, #0x24]
        ldr     r1, [r3, +r6]
        bl      __divsf3
        ldr     r1, [r5], #0x18
        mov     r4, r0
        bl      __mulsf3
        ldr     r3, [sp, #8]
        mov     r1, r4
        str     r0, [r3], #0x14
        ldr     r0, [r10, +r6]
        str     r3, [sp, #8]
        bl      __mulsf3
        str     r0, [r10, +r7]
        ldr     r0, [r9, +r6]
        mov     r1, r4
        add     r10, r8, #0x10
        bl      __mulsf3
        str     r0, [r9, +r7]
        ldr     r0, [r10, +r6]
        mov     r1, r4
        add     r9, r8, #0x14
        bl      __mulsf3
        ldr     r3, [sp, #0x24]
        mov     r1, r4
        str     r0, [r3, +r7]
        ldr     r0, [r9, +r6]
        add     r6, r6, #0x18
        bl      __mulsf3
        str     r0, [r10, +r7]
        ldr     r3, [sp, #4]
        add     r7, r7, #0x14
        subs    r3, r3, #1
        str     r3, [sp, #4]
        bne     LBOG9
        ldr     r11, [sp, #0xC]
        ldr     r10, [sp, #0x10]
        ldr     r7, [sp, #0x14]
        ldr     r6, [sp, #0x18]
LBOG10:
        ldr     r1, [r10, #0xC]
        mov     r0, r8
        mov     r2, r11
        bl      ownsConvert32fTo16s
LBOG11:
        add     r0, r0, #0xE
        str     r0, [r10, #0x30]
        mov     r0, #0
LBOG12:
        cmp     r0, #0
        addne   sp, sp, #0x28
        ldmneia sp!, {r4 - r11, pc}
        ldr     r6, [r6]
        ldr     r0, [pc, #0x210]
        mov     r8, #0
        ldr     r2, [r6]
        sub     r1, r0, #0xF7
        cmp     r1, r2
        ldreq   r10, [r6, #0x28]
        movne   r10, r8
        cmp     r0, r2
        ldreq   r0, [r6, #0x28]
        moveq   r10, r0, lsl #1
        cmp     r7, #0
        beq     LBOG21
        cmp     r10, #0
        ble     LBOG16
        cmp     r10, #6
        movlt   r5, r8
        blt     LBOG14
        mov     r5, r8
        sub     r4, r10, #6
        mov     lr, #4
        add     r12, r7, #4
        mov     r3, #8
        mov     r2, #0xC
        mov     r0, #0x10
LBOG13:
        ldr     r11, [r12, #-4]
        ldr     r9, [r6, #8]
        str     r11, [r9, +r5, lsl #2]
        ldr     r11, [r12]
        ldr     r9, [r6, #8]
        add     r5, r5, #5
        cmp     r5, r4
        str     r11, [lr, +r9]
        ldr     r11, [r12, #4]
        ldr     r9, [r6, #8]
        add     lr, lr, #0x14
        str     r11, [r3, +r9]
        ldr     r11, [r12, #8]
        ldr     r9, [r6, #8]
        add     r3, r3, #0x14
        str     r11, [r2, +r9]
        ldr     r11, [r12, #0xC]
        ldr     r9, [r6, #8]
        add     r12, r12, #0x14
        add     r2, r2, #0x14
        str     r11, [r0, +r9]
        add     r0, r0, #0x14
        ble     LBOG13
LBOG14:
        add     r0, r7, r5, lsl #2
LBOG15:
        ldr     r2, [r0], #4
        ldr     r3, [r6, #8]
        str     r2, [r3, +r5, lsl #2]
        add     r5, r5, #1
        cmp     r5, r10
        blt     LBOG15
LBOG16:
        cmp     r10, #0
        ble     LBOG20
        cmp     r10, #6
        movlt   r9, r8
        blt     LBOG18
        mov     r9, r8
        sub     r5, r10, #6
        mov     r4, r7
        str     r10, [sp, #0x1C]
LBOG17:
        ldr     r0, [r4], #0x14
        add     r10, r9, #1
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        str     r0, [r2, +r9, lsl #3]
        add     r2, r2, r8
        str     r1, [r2, #4]
        ldr     r0, [r7, +r10, lsl #2]
        add     r8, r8, #0x28
        add     r11, r9, #2
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r2, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r0, [r7, +r11, lsl #2]
        add     r10, r9, #3
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        str     r0, [r2, +r11, lsl #3]
        add     r11, r2, r11, lsl #3
        str     r1, [r11, #4]
        ldr     r0, [r7, +r10, lsl #2]
        add     r11, r9, #4
        add     r9, r9, #5
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        str     r0, [r2, +r10, lsl #3]
        add     r10, r2, r10, lsl #3
        str     r1, [r10, #4]
        ldr     r0, [r7, +r11, lsl #2]
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        cmp     r9, r5
        str     r0, [r2, +r11, lsl #3]
        add     r11, r2, r11, lsl #3
        str     r1, [r11, #4]
        ble     LBOG17
        ldr     r10, [sp, #0x1C]
LBOG18:
        add     r7, r7, r9, lsl #2
        mov     r4, r9, lsl #3
LBOG19:
        ldr     r0, [r7], #4
        bl      __fixsfdi
        ldr     r2, [r6, #0x10]
        str     r0, [r2, +r9, lsl #3]
        add     r9, r9, #1
        add     r2, r2, r4
        cmp     r9, r10
        str     r1, [r2, #4]
        add     r4, r4, #8
        blt     LBOG19
LBOG20:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBOG21:
        ldr     r0, [r6, #8]
        mov     r1, r10
        bl      _ippsZero_32f
        ldr     r0, [r6, #0x10]
        mov     r1, r10
        bl      _ippsZero_64s
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBOG22:
        ldr     r7, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        mvn     r0, #9
        b       LBOG12
LBOG23:
        ldr     r7, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        mvn     r0, #9
        b       LBOG12
        .long   0x49493130
        .long   LBOG__2il0floatpacket.1


        .data
        .align  4


LBOG__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


