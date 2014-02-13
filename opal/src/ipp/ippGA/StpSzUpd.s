        .text
        .align  4
        .globl  _ippsStepSizeUpdateAECNLMS_32s


_ippsStepSizeUpdateAECNLMS_32s:
        mov     r12, sp
        stmdb   sp!, {r2, r3}
        stmdb   sp!, {r4 - r12, lr}
LAAH_$M480:
        mov     r11, r2
        str     r3, [sp, #0x2C]
        cmp     r1, #0
        bne     LAAH1
        ldr     r1, [sp, #0x38]
        cmp     r1, #0
        ble     LAAH9
        ldr     r0, [sp, #0x34]
        mov     r10, #0
LAAH0:
        sub     r1, r1, #1
        str     r10, [r0]
        str     r10, [r0, #4]
        cmp     r1, #0
        add     r0, r0, #8
        bhi     LAAH0
        b       LAAH9
LAAH1:
        mov     r10, #0
        mov     r9, r10
        mov     r6, r1
        ands    r3, r1, #1, 2
        bne     LAAH3
LAAH2:
        mov     r6, r6, lsl #1
        add     r9, r9, #1
        ands    r3, r6, #1, 2
        beq     LAAH2
LAAH3:
        ldr     r1, [sp, #0x38]
        cmp     r1, #0
        ble     LAAH9
        ldr     r4, [sp, #0x34]
        mov     r7, r0
        mov     r8, r1
LAAH4:
        ldr     r0, [r7]
        ldr     r3, [sp, #0x30]
        cmp     r0, r3
        ble     LAAH7
        mov     r2, r6
        mov     r5, r10
        b       LAAH6
LAAH5:
        add     r5, r5, #1
        mov     r0, r0, lsl #1
LAAH6:
        ands    r3, r0, #1, 2
        beq     LAAH5
        cmp     r6, r0
        movge   r3, #1, 2
        subge   r2, r6, r0
        strge   r3, [r4]
        mov     r1, r0, asr #1
        strlt   r10, [r4]
        mov     r0, r2, asr #1
        bl      _divide32
        ldr     r3, [r4]
        add     r3, r3, r0
        str     r3, [r4]
        sub     r3, r5, r9
        b       LAAH8
LAAH7:
        ldr     r3, [sp, #0x2C]
        str     r11, [r4]
LAAH8:
        ldr     r2, [sp, #0x3C]
        sub     r8, r8, #1
        str     r3, [r4, #4]
        add     r7, r7, #4
        sub     r3, r2, r3
        add     r3, r3, #0x3D
        str     r3, [r4, #4]
        cmp     r8, #0
        add     r4, r4, #8
        bhi     LAAH4
LAAH9:
        mov     r0, #0
        ldmia   sp, {r4 - r11, sp, pc}
LAAH_$M481:


        .data
        .align  4


LAAH_$T482:
        .long   _ippsStepSizeUpdateAECNLMS_32s
        .byte   0x03,0x48,0x00,0x40


