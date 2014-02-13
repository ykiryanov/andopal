        .text
        .align  4
        .globl  _ippsAdaptiveCodebookDecode_GSMAMR_16s


_ippsAdaptiveCodebookDecode_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     lr, [sp, #0x58]
        ldr     r10, [sp, #0x44]
        ldr     r5, [sp, #0x48]
        ldr     r12, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r8, [sp, #0x54]
        ldr     r11, [sp, #0x5C]
        mov     r6, r1
        cmp     r6, #0
        str     lr, [sp, #0x18]
        mov     r7, r2
        beq     LDVV21
        cmp     r7, #0
        beq     LDVV21
        cmp     r3, #0
        beq     LDVV21
        cmp     r10, #0
        beq     LDVV21
        cmp     r5, #0
        beq     LDVV21
        cmp     r12, #0
        blt     LDVV13
        cmp     r12, #3
        bgt     LDVV13
        cmp     r11, #0
        beq     LDVV1
        cmp     r11, #1
        beq     LDVV1
        cmp     r11, #3
        beq     LDVV1
        cmp     r11, #6
        beq     LDVV1
        cmp     r11, #7
        beq     LDVV1
        cmp     r11, #8
        beq     LDVV1
        cmp     r11, #0xB
        beq     LDVV1
        cmp     r11, #0xC
        beq     LDVV1
        cmp     r11, #0x19
        beq     LDVV1
LDVV0:
        mvn     r0, #6
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDVV1:
        cmp     r12, #2
        add     r4, r3, #0x4D, 30
        add     r12, r12, r12, lsl #2
        mov     r3, r12, lsl #3
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        beq     LDVV20
LDVV2:
        cmp     r11, #0xC
        beq     LDVV14
LDVV3:
        cmp     r0, #0
        blt     LDVV0
        mov     r12, #0x13
        add     r12, r12, #0x7B, 30
        cmp     r12, r0
        blt     LDVV0
        cmp     r11, #0
        bne     LDVV5
LDVV4:
        mov     lr, #1
        b       LDVV6
LDVV5:
        cmp     r11, #1
        beq     LDVV4
        cmp     r11, #3
        beq     LDVV4
        cmp     r11, #6
        movne   lr, #0
        beq     LDVV4
LDVV6:
        cmp     r11, #8
        moveq   r2, #0xA
        moveq   r12, #0x13
        movne   r2, #5
        movne   r12, #9
        ldrsh   r1, [r6]
        str     r1, [sp, #0x10]
        sub     r1, r1, r2
        mov     r2, #0x14
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, #0x14
        movlt   r1, r2
        str     r1, [sp, #0x14]
        add     r1, r12, r1
        mov     r1, r1, lsl #16
        mov     r2, r1, asr #16
        cmp     r2, #0x8F
        ble     LDVV7
        rsb     r12, r12, #0x8F
        mov     r2, #0x8F
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        str     r12, [sp, #0x14]
LDVV7:
        add     r12, sp, #0x1C
        str     r12, [sp, #8]
        str     lr, [sp, #0xC]
        str     r10, [sp, #4]
        ldr     r12, [sp, #0x10]
        str     r12, [sp]
        ldr     r1, [sp, #0x14]
        bl      LDVV_ownDecLag3
        ldrsh   r3, [r10]
        cmp     r9, #0
        strh    r3, [r7]
        ldreqsh r1, [r10]
        ldreqsh r2, [sp, #0x1C]
        beq     LDVV11
        ldrsh   r1, [r6]
        cmp     r1, #0x8F
        bge     LDVV8
        add     r1, r1, #1
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r6]
LDVV8:
        mov     r2, #0
        cmp     r8, #0
        strh    r2, [sp, #0x1C]
        strh    r1, [r10]
        beq     LDVV11
        ldr     r3, [sp, #0x18]
        cmp     r3, #4
        ble     LDVV11
        cmp     r11, #0
        bne     LDVV10
LDVV9:
        ldrsh   r1, [r7]
        strh    r1, [r10]
        b       LDVV11
LDVV10:
        cmp     r11, #1
        beq     LDVV9
        cmp     r11, #3
        beq     LDVV9
LDVV11:
        mov     r3, #1
        str     r3, [sp]
        mov     r3, #0x28
        mov     r0, r4
        bl      ownPredLT3or6
LDVV12:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0x28
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDVV13:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDVV14:
        mov     lr, #0x56
        mov     r12, #0xAE
        orr     r8, lr, #0x15, 24
        cmp     r3, #0
        orr     lr, r12, #0x6A, 24
        bne     LDVV16
        mov     r12, #0x13
        add     r12, r12, #0x6F, 30
        cmp     r12, r0
        ble     LDVV15
        mul     r8, r0, r8
        add     lr, r8, lr
        mov     r12, lr, asr #15
        add     r12, r12, #0x11
        mov     r12, r12, lsl #16
        mov     r1, r12, asr #16
        strh    r1, [r10]
        mov     r12, r1, lsl #3
        rsb     r12, r12, r1, lsl #1
        add     r12, r0, r12
        add     r12, r12, #0x69
        mov     r12, r12, lsl #16
        mov     r2, r12, asr #16
        b       LDVV17
LDVV15:
        sub     r12, r0, #0x17, 28
        mov     r2, #0
        mov     r12, r12, lsl #16
        mov     r1, r12, asr #16
        strh    r1, [r10]
        b       LDVV17
LDVV16:
        ldrsh   r12, [r10]
        mov     r11, #0x12
        sub     r12, r12, #5
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0x12
        movlt   r12, r11
        add     r11, r12, #9
        mov     r11, r11, lsl #16
        cmp     r11, #0x8F, 16
        movgt   r12, #0x86
        mul     r8, r0, r8
        add     lr, r8, lr
        mov     lr, lr, asr #15
        sub     lr, lr, #1
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        add     r12, r12, lr
        mov     r8, lr, lsl #3
        rsb     lr, r8, lr, lsl #1
        add     lr, r0, lr
        sub     lr, lr, #3
        mov     r12, r12, lsl #16
        mov     lr, lr, lsl #16
        mov     r1, r12, asr #16
        strh    r1, [r10]
        mov     r2, lr, asr #16
LDVV17:
        cmp     r9, #0
        bne     LDVV18
        cmp     r3, #0
        streqh  r2, [sp, #0x1C]
        beq     LDVV19
LDVV18:
        cmp     r0, #0x3D
        strlth  r2, [sp, #0x1C]
        blt     LDVV19
        strh    r1, [r7]
        ldrsh   r1, [r6]
        mov     r2, #0
        strh    r2, [sp, #0x1C]
        strh    r1, [r10]
LDVV19:
        mov     r3, #0
        str     r3, [sp]
        mov     r3, #0x28
        mov     r0, r4
        bl      ownPredLT3or6
        b       LDVV12
LDVV20:
        cmp     r11, #0
        beq     LDVV3
        cmp     r11, #1
        movne   r3, #0
        bne     LDVV2
        b       LDVV3
LDVV21:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDVV_ownDecLag3:
        stmdb   sp!, {r4 - r6, lr}
        ldr     r12, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        cmp     r3, #0
        mov     r3, #0xAB
        orr     r3, r3, #0x2A, 24
        mov     r6, #0
        bne     LDVV23
        cmp     r0, #0xC5
        bge     LDVV22
        mul     r1, r0, r3
        add     r3, r1, r3, lsl #1
        mov     r1, r3, asr #15
        add     r1, r1, #0x13
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r4]
        sub     r1, r1, r1, lsl #2
        add     r1, r0, r1
        add     r0, r1, #0x3A
        strh    r0, [r5]
        ldmia   sp!, {r4 - r6, pc}
LDVV22:
        sub     r0, r0, #0x70
        strh    r0, [r4]
        strh    r6, [r5]
        ldmia   sp!, {r4 - r6, pc}
LDVV23:
        cmp     lr, #0
        bne     LDVV24
        mul     r2, r0, r3
        add     r3, r2, r3, lsl #1
        mov     r2, r3, asr #15
        sub     r2, r2, #1
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        add     r1, r1, r2
        sub     r2, r2, r2, lsl #2
        add     r2, r0, r2
        strh    r1, [r4]
        sub     r0, r2, #2
        strh    r0, [r5]
        ldmia   sp!, {r4 - r6, pc}
LDVV24:
        sub     lr, r12, r1
        cmp     lr, #5
        ble     LDVV25
        add     r1, r1, #5
        mov     r1, r1, lsl #16
        mov     r12, r1, asr #16
LDVV25:
        sub     r1, r2, r12
        cmp     r1, #4
        ble     LDVV26
        sub     r2, r2, #4
        mov     r2, r2, lsl #16
        mov     r12, r2, asr #16
LDVV26:
        cmp     r0, #4
        bge     LDVV27
        add     r12, r0, r12
        sub     r0, r12, #5
        strh    r0, [r4]
        strh    r6, [r5]
        ldmia   sp!, {r4 - r6, pc}
LDVV27:
        cmp     r0, #0xC
        bge     LDVV28
        mul     r3, r0, r3
        mov     r1, #0x57
        orr     r1, r1, #0xD5, 24
        sub     r3, r3, r1
        mov     r1, r3, asr #15
        sub     r1, r1, #1
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        add     r12, r12, r1
        sub     r1, r1, r1, lsl #2
        add     r1, r0, r1
        strh    r12, [r4]
        sub     r0, r1, #9
        strh    r0, [r5]
        ldmia   sp!, {r4 - r6, pc}
LDVV28:
        add     r12, r0, r12
        sub     r0, r12, #0xB
        strh    r0, [r4]
        strh    r6, [r5]
        ldmia   sp!, {r4 - r6, pc}


