        .text
        .align  4
        .globl  _ippsVLCDecodeInit_32s


LGAO_ownippGetVLCInternalTableSize:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4D, 30
        sub     sp, sp, #1, 20
        add     r8, sp, #1, 20
        ldr     r8, [r8, #0x158]
        add     r7, sp, #1, 20
        ldr     r7, [r7, #0x15C]
        mov     r4, r1
        mov     r6, r0
        cmp     r4, #1, 22
        mov     r5, r2
        mov     r11, #0
        mov     r0, #1
        bge     LGAO8
        cmp     r4, #0
        ble     LGAO3
        cmp     r4, #5
        movlt   r9, r11
        blt     LGAO1
        mov     r9, r11
        sub     r10, r4, #5
        sub     lr, r6, #4
        str     r5, [sp, #0x1C]
        str     r10, [sp, #0x10]
        str     r7, [sp]
        str     r3, [sp, #0x14]
        str     r4, [sp, #8]
        str     r6, [sp, #0x18]
LGAO0:
        ldr     r5, [lr, #0xC]
        ldr     r0, [lr, #8]
        ldr     r2, [lr, #0x18]
        ldr     r4, [lr, #0x24]
        ldr     r3, [lr, #0x30]
        mov     r1, #1
        mov     r6, r1, lsl r5
        ldr     r7, [lr, #0x20]
        ldr     r1, [lr, #0x14]
        sub     r6, r6, #1
        and     r6, r0, r6
        str     r7, [sp, #0x30]
        ldr     r7, [lr, #0x2C]
        sub     r5, r8, r5
        add     r10, sp, #0x34
        mov     r0, #1
        mov     r5, r6, lsl r5
        add     r10, r10, r11
        str     r7, [sp, #0x2C]
        mov     r6, r0, lsl r2
        str     r10, [sp, #0x28]
        mov     r7, r0, lsl r4
        add     r10, sp, #0x34
        str     r5, [r10, +r9, lsl #2]
        mov     r0, r0, lsl r3
        sub     r6, r6, #1
        and     r1, r1, r6
        ldr     r6, [sp, #0x30]
        sub     r5, r7, #1
        sub     r0, r0, #1
        and     r5, r6, r5
        ldr     r6, [sp, #0x2C]
        sub     r3, r8, r3
        sub     r2, r8, r2
        sub     r4, r8, r4
        and     r0, r6, r0
        mov     r3, r0, lsl r3
        ldr     r0, [sp, #0x10]
        add     r9, r9, #4
        mov     r2, r1, lsl r2
        mov     r4, r5, lsl r4
        cmp     r9, r0
        ldr     r0, [sp, #0x28]
        add     lr, lr, #0x30
        add     r11, r11, #0x10
        str     r2, [r0, #4]
        str     r4, [r0, #8]
        str     r3, [r0, #0xC]
        ble     LGAO0
        ldr     r5, [sp, #0x1C]
        ldr     r7, [sp]
        ldr     r3, [sp, #0x14]
        ldr     r4, [sp, #8]
        ldr     r6, [sp, #0x18]
LGAO1:
        rsb     lr, r9, r9, lsl #2
        mov     r0, #1
        mov     lr, lr, lsl #2
        sub     lr, lr, #4
        add     lr, lr, r6
LGAO2:
        ldr     r11, [lr, #0xC]
        ldr     r10, [lr, #8]
        add     lr, lr, #0xC
        mov     r1, r0, lsl r11
        sub     r1, r1, #1
        and     r1, r10, r1
        sub     r11, r8, r11
        add     r10, sp, #0x34
        mov     r11, r1, lsl r11
        str     r11, [r10, +r9, lsl #2]
        add     r9, r9, #1
        cmp     r9, r4
        blt     LGAO2
LGAO3:
        add     r0, sp, #0x34
        mov     r1, r4
        sub     r9, r3, #1
        bl      _ippsSortAscend_32s_I
        ldr     r3, [r5]
        mov     r2, #1
        cmp     r9, #0
        mov     r3, r2, lsl r3
        add     lr, r3, #1
        ble     LGAO7
        add     r3, sp, #0x34
        ldr     r11, [r6, #8]
        ldr     r3, [r3]
        mov     r1, #0
        mov     r0, r1
        add     r10, r5, #4
        str     r7, [sp]
        str     r6, [sp, #0x18]
LGAO4:
        ldr     r6, [r5], #4
        add     r0, r0, r6
        sub     r6, r8, r0
        str     r6, [sp, #0x24]
        mov     r6, r3, lsr r6
        cmp     r11, r0
        str     r6, [sp, #0x28]
        movle   r6, #0
        movgt   r6, #1
        cmp     r4, #1
        ble     LGAO6
        mov     r7, #1
        str     r7, [sp, #0x30]
        ldr     r7, [sp, #0x18]
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x24]
        add     r7, r7, #0xC
        str     r7, [sp, #0x2C]
        str     r9, [sp, #0x14]
        str     r8, [sp, #0x20]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
        ldr     r9, [sp, #0x28]
        str     r1, [sp, #0x10]
LGAO5:
        add     r2, sp, #0x34
        ldr     r1, [r7, #8]
        ldr     r2, [r2, +r8, lsl #2]
        cmp     r1, r0
        mov     r2, r2, lsr r11
        addgt   r6, r6, #1
        cmp     r2, r9
        movne   r9, r2
        subeq   r6, r6, #1
        add     r8, r8, #1
        cmp     r8, r4
        add     r7, r7, #0xC
        blt     LGAO5
        ldr     r11, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        ldr     r8, [sp, #0x20]
LGAO6:
        ldr     r7, [r10], #4
        mov     r2, #1
        mov     r7, r2, lsl r7
        add     r7, r7, #1
        mla     lr, r7, r6, lr
        add     r1, r1, #1
        cmp     r1, r9
        blt     LGAO4
        ldr     r7, [sp]
LGAO7:
        add     sp, sp, #0x4D, 30
        str     lr, [r7]
        add     sp, sp, #1, 20
        ldmia   sp!, {r4 - r11, pc}
LGAO8:
        ldr     lr, [r5]
        sub     r3, r3, #1
        cmp     r3, #0
        mov     lr, r0, lsl lr
        add     lr, lr, #1
        ble     LGAO7
        ldr     r9, [r6, #8]
        mov     r10, r11
        add     r8, r5, #4
        str     r7, [sp]
LGAO9:
        ldr     r7, [r5], #4
        add     r10, r10, r7
        cmp     r9, r10
        movle   r1, #0
        movgt   r1, #1
        cmp     r4, #0
        ble     LGAO18
        ldr     r0, [r6, #8]
        cmp     r0, r10
        bgt     LGAO10
        str     lr, [sp, #4]
        mov     r2, #0
        str     r4, [sp, #8]
        str     r11, [sp, #0xC]
        mov     lr, #1
        b       LGAO14
LGAO10:
        mov     r7, #0
        str     lr, [sp, #4]
        mov     r2, r7
        str     r4, [sp, #8]
        str     r11, [sp, #0xC]
        mov     lr, #1
LGAO11:
        add     r7, r6, r7
        ldr     r4, [r7, #4]
        mov     r7, lr, lsl r0
        sub     r7, r7, #1
        cmp     r2, #0
        add     r1, r1, #1
        and     r4, r4, r7
        sub     r0, r0, r10
        ble     LGAO14
        mov     r7, r6
        mov     r11, #0
        str     r9, [sp, #0x10]
        str     r3, [sp, #0x14]
        str     r6, [sp, #0x18]
LGAO12:
        ldr     r6, [r7, #8]
        cmp     r6, r10
        ble     LGAO13
        ldr     r3, [r7, #4]
        mov     r9, lr, lsl r6
        sub     r9, r9, #1
        sub     r6, r6, r10
        and     r9, r3, r9
        mov     r6, r9, asr r6
        cmp     r6, r4, asr r0
        beq     LGAO16
LGAO13:
        add     r11, r11, #1
        cmp     r11, r2
        add     r7, r7, #0xC
        blt     LGAO12
        ldr     r9, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        ldr     r6, [sp, #0x18]
LGAO14:
        ldr     r4, [sp, #8]
LGAO15:
        add     r2, r2, #1
        cmp     r2, r4
        bge     LGAO17
        rsb     r7, r2, r2, lsl #2
        mov     r7, r7, lsl #2
        add     r11, r6, r7
        ldr     r0, [r11, #8]
        cmp     r0, r10
        ble     LGAO15
        str     r4, [sp, #8]
        b       LGAO11
LGAO16:
        ldr     r9, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        sub     r1, r1, #1
        b       LGAO14
LGAO17:
        ldr     lr, [sp, #4]
        ldr     r11, [sp, #0xC]
LGAO18:
        ldr     r7, [r8], #4
        mov     r0, #1
        mov     r7, r0, lsl r7
        add     r7, r7, #1
        mla     lr, r7, r1, lr
        add     r11, r11, #1
        cmp     r11, r3
        blt     LGAO9
        ldr     r7, [sp]
        b       LGAO7
_ippsVLCDecodeInit_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB4
        ldr     r8, [sp, #0xD8]
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r4, r3
        beq     LGAO36
        cmp     r2, #0
        beq     LGAO36
        cmp     r8, #0
        beq     LGAO36
        cmp     r6, #0
        mov     r10, #0
        movle   r9, r10
        movle   lr, r9
        ble     LGAO20
        mov     r9, r10
        mov     lr, r9
        add     r7, r5, #8
        mov     r12, r6
LGAO19:
        ldr     r0, [r7]
        ldr     r11, [r7, #-8]
        add     r7, r7, #0xC
        cmp     r0, r9
        movgt   r9, r0
        eor     r0, r11, r11, asr #31
        sub     r0, r0, r11, asr #31
        cmp     r0, lr
        movgt   lr, r0
        subs    r12, r12, #1
        bne     LGAO19
LGAO20:
        cmp     lr, #1
        mov     r12, #1
        movle   r7, r10
        ble     LGAO22
        mov     r7, r10
LGAO21:
        add     r7, r7, #1
        cmp     lr, r12, lsl r7
        bgt     LGAO21
LGAO22:
        cmp     r9, #0x20
        add     r7, r7, #1
        bgt     LGAO27
        cmp     r9, #1
        blt     LGAO27
        cmp     r4, #0
        ble     LGAO33
        mov     r0, r10
        mov     r1, r0
LGAO23:
        ldr     r3, [r2], #4
        mov     r11, r10, lsl #2
        cmp     r3, #1
        blt     LGAO24
        add     r1, r1, r3
        cmp     r1, r9
        add     lr, sp, #0x10
        bge     LGAO32
        cmp     r0, r3
        str     r3, [lr, +r10, lsl #2]
        movlt   r0, r3
        add     r10, r10, #1
        cmp     r10, r4
        blt     LGAO23
        mov     r12, #0
LGAO24:
        cmp     r0, #0
        movle   r10, #0
        ble     LGAO26
        mov     r10, #0
        mov     r2, #1
LGAO25:
        add     r10, r10, #1
        mov     lr, r2, lsl r10
        sub     lr, lr, #1
        cmp     r0, lr
        bgt     LGAO25
LGAO26:
        cmp     r12, #1
        mvn     r0, #0x80
        beq     LGAO28
        cmp     r1, r9
        movge   r0, #0
        b       LGAO28
LGAO27:
        mvn     r0, #0x80
        mov     r9, r10
LGAO28:
        cmp     r0, #0
        addne   sp, sp, #0xB4
        ldmneia sp!, {r4 - r11, pc}
        add     r12, sp, #0xB0
        add     r2, sp, #0x10
        str     r12, [sp, #4]
        str     r9, [sp]
        mov     r3, r4
        mov     r1, r6
        mov     r0, r5
        bl      LGAO_ownippGetVLCInternalTableSize
        ldr     r12, [sp, #0xB0]
        mov     r2, #0
        add     r11, r12, #1
        cmp     r11, #0
        movle   lr, #0
        ble     LGAO30
        mov     lr, #0
        mov     r0, #1
LGAO29:
        add     lr, lr, #1
        mov     r1, r0, lsl lr
        sub     r1, r1, #1
        cmp     r1, r11
        blt     LGAO29
LGAO30:
        add     r7, r7, r10
        add     r7, r7, #1
        add     lr, lr, #1
        cmp     lr, r7
        movgt   r7, lr
        cmp     r7, #0x10
        movgt   r11, #0x20
        bgt     LGAO31
        cmp     r7, #8
        movle   r11, #8
        movgt   r11, #0x10
LGAO31:
        and     lr, r8, #0x1F
        rsb     lr, lr, #0
        and     lr, lr, #0x1F
        add     r7, r8, lr
        str     r2, [r7, #4]
        add     r2, r7, #0x18
        str     r9, [r7, #8]
        and     r9, r2, #0x1F
        rsb     r9, r9, #0
        and     r9, r9, #0x1F
        add     r9, r2, r9
        ldr     r2, [pc, #0x9F8]
        cmp     r11, #0x10
        str     r9, [r7, #0xC]
        str     r2, [lr, +r8]
        str     r11, [r7, #0x10]
        str     r10, [r7, #0x14]
        beq     LGAO35
        cmp     r11, #0x20
        add     r2, sp, #0x10
        str     r12, [sp, #4]
        str     r9, [sp]
        beq     LGAO34
        str     r10, [sp, #8]
        mov     r0, r5
        mov     r3, r4
        mov     r1, r6
        bl      LGAO_ownippVLCInternalTableInit8
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}
LGAO32:
        add     r3, r3, r9
        sub     r2, r3, r1
        cmp     r0, r2
        str     r2, [lr, +r11]
        add     r4, r10, #1
        mov     r12, #0
        movlt   r0, r2
        b       LGAO24
LGAO33:
        mov     r0, r10
        mov     r12, r0
        mov     r1, r12
        b       LGAO24
LGAO34:
        str     r10, [sp, #8]
        mov     r0, r5
        mov     r3, r4
        mov     r1, r6
        bl      LGAO_ownippVLCInternalTableInit32
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}
LGAO35:
        add     r2, sp, #0x10
        str     r12, [sp, #4]
        str     r10, [sp, #8]
        str     r9, [sp]
        mov     r0, r5
        mov     r3, r4
        mov     r1, r6
        bl      LGAO_ownippVLCInternalTableInit16
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}
LGAO36:
        mvn     r0, #7
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}
LGAO_ownippVLCInternalTableInit32:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r4, [sp, #0x54]
        ldr     r12, [sp, #0x50]
        ldr     lr, [sp, #0x58]
        cmp     r4, #0
        ble     LGAO40
        cmp     r4, #6
        mvn     r6, #1
        mov     r5, #0
        blt     LGAO38
        sub     r8, r4, #6
        add     r7, r12, #4
LGAO37:
        add     r5, r5, #5
        str     r6, [r7, #-4]
        str     r6, [r7]
        str     r6, [r7, #4]
        str     r6, [r7, #8]
        str     r6, [r7, #0xC]
        cmp     r5, r8
        add     r7, r7, #0x14
        ble     LGAO37
LGAO38:
        add     r7, r12, r5, lsl #2
LGAO39:
        add     r5, r5, #1
        str     r6, [r7], #4
        cmp     r5, r4
        blt     LGAO39
LGAO40:
        ldr     r5, [r2]
        mov     r6, #1
        cmp     r1, #0
        mov     r7, r6, lsl r5
        str     r5, [r12]
        add     r7, r7, #1
        ble     LGAO46
        mov     r8, #0
        add     r5, r2, #4
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x18]
        str     lr, [sp, #0x14]
        str     r4, [sp, #0x10]
        str     r3, [sp, #8]
        str     r1, [sp, #4]
LGAO41:
        ldr     r1, [sp, #8]
        mov     r3, r12
        cmp     r1, #0
        ldr     r1, [sp, #0x1C]
        rsb     lr, r1, r1, lsl #2
        add     r1, r0, lr, lsl #2
        ldr     r4, [r1, #8]
        ble     LGAO54
        mov     r10, r2
        mov     r9, r5
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x18]
        mov     r11, #0
        mov     r7, r11
        str     r5, [sp, #0x20]
LGAO42:
        ldr     r5, [r10], #4
        add     r1, r0, lr, lsl #2
        ldr     r1, [r1, #4]
        add     r7, r7, r5
        mov     r6, r11, lsl #2
        subs    r8, r4, r7
        str     r6, [sp, #0x28]
        ble     LGAO49
        mov     r6, #1
        mov     r5, r6, lsl r5
        sub     r5, r5, #1
        and     r8, r5, r1, asr r8
        add     r3, r3, #4
        ldr     r1, [r3, +r8, lsl #2]
        cmn     r1, #2
        beq     LGAO43
        tst     r1, #1
        bne     LGAO47
        ldr     r3, [sp, #0x10]
        mov     r1, r1, lsr #1
        cmp     r1, r3
        movcc   r1, r1, lsl #2
        bcs     LGAO48
        b       LGAO44
LGAO43:
        mov     r1, r2, lsl #1
        str     r1, [r3, +r8, lsl #2]
        ldr     r3, [r9]
        mov     r1, r2, lsl #2
        mov     r5, #1
        str     r3, [r12, +r2, lsl #2]
        ldr     r3, [sp, #0x20]
        ldr     r3, [r3, +r11, lsl #2]
        add     r3, r2, r5, lsl r3
        add     r2, r3, #1
LGAO44:
        ldr     r3, [sp, #8]
        add     r11, r11, #1
        add     r9, r9, #4
        cmp     r11, r3
        add     r3, r12, r1
        blt     LGAO42
        str     r2, [sp, #0x18]
        ldr     r5, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        mov     r6, #1
LGAO45:
        ldr     r1, [sp, #0x1C]
        ldr     r3, [sp, #4]
        add     r1, r1, #1
        str     r1, [sp, #0x1C]
        cmp     r1, r3
        blt     LGAO41
LGAO46:
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LGAO47:
        mvn     r0, #0x80
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LGAO48:
        mvn     r0, #0x80
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LGAO49:
        str     r2, [sp, #0x18]
        ldr     r10, [r0, +lr, lsl #2]
        mov     r9, r5
        ldr     r5, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        add     lr, r9, r8
        mov     r6, #1
        mov     r9, r6, lsl lr
        sub     r4, r7, r4
        sub     r9, r9, #1
        mov     r7, r6, lsl r4
        and     r9, r1, r9
        cmp     r7, #0
        mov     r1, r9, lsl r4
        ble     LGAO45
        ldr     r4, [sp, #0x14]
        cmp     r7, #5
        add     r11, r4, #1
        blt     LGAO53
        str     r0, [sp]
        ldr     r0, [sp, #0x28]
        mov     r11, r10, lsl r11
        mov     r9, #0
        add     r3, r3, #4
        sub     r4, r7, #5
        mov     r10, r1
        str     r5, [sp, #0x20]
        str     r12, [sp, #0xC]
LGAO50:
        add     lr, r11, lr, lsl #1
        add     lr, lr, #1
        str     lr, [r3, +r10, lsl #2]
        ldr     r12, [r2, +r0]
        mov     r6, r10, lsl #2
        add     lr, r6, #4
        add     r12, r8, r12
        add     r5, r6, #8
        add     r6, r6, #0xC
        add     r12, r11, r12, lsl #1
        add     r12, r12, #1
        str     r12, [r3, +lr]
        ldr     r12, [r2, +r0]
        add     r10, r10, #4
        add     r9, r9, #4
        add     r12, r8, r12
        cmp     r9, r4
        add     r12, r11, r12, lsl #1
        add     r12, r12, #1
        str     r12, [r3, +r5]
        ldr     r12, [r2, +r0]
        add     r12, r8, r12
        add     r12, r11, r12, lsl #1
        add     r12, r12, #1
        str     r12, [r3, +r6]
        ldr     lr, [r2, +r0]
        addle   lr, lr, r8
        ble     LGAO50
        ldr     r5, [sp, #0x20]
        ldr     r12, [sp, #0xC]
        ldr     r0, [sp]
        mov     r6, #1
        add     lr, lr, r8
LGAO51:
        ldr     r4, [sp, #0x28]
        add     r1, r9, r1
LGAO52:
        add     lr, r11, lr, lsl #1
        add     lr, lr, #1
        add     r9, r9, #1
        str     lr, [r3, +r1, lsl #2]
        cmp     r9, r7
        add     r1, r1, #1
        ldrlt   lr, [r2, +r4]
        addlt   lr, lr, r8
        blt     LGAO52
        b       LGAO45
LGAO53:
        mov     r9, #0
        add     r3, r3, #4
        mov     r11, r10, lsl r11
        b       LGAO51
LGAO54:
        ldr     r1, [sp, #0x1C]
        ldr     r3, [sp, #4]
        add     r1, r1, #1
        str     r1, [sp, #0x1C]
        cmp     r1, r3
        blt     LGAO41
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LGAO_ownippVLCInternalTableInit16:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        ldr     r5, [sp, #0x58]
        ldr     r12, [sp, #0x54]
        ldr     r4, [sp, #0x5C]
        mov     lr, #0xFE
        cmp     r5, #0
        orr     lr, lr, #0xFF, 24
        ble     LGAO58
        cmp     r5, #6
        mov     r6, #0
        blt     LGAO56
        sub     r8, r5, #6
        mov     r7, r12
LGAO55:
        add     r6, r6, #5
        strh    lr, [r7]
        strh    lr, [r7, #2]
        strh    lr, [r7, #4]
        strh    lr, [r7, #6]
        strh    lr, [r7, #8]
        cmp     r6, r8
        add     r7, r7, #0xA
        ble     LGAO55
LGAO56:
        add     r7, r12, r6, lsl #1
LGAO57:
        add     r6, r6, #1
        strh    lr, [r7], #2
        cmp     r6, r5
        blt     LGAO57
LGAO58:
        ldr     r6, [r2]
        mov     r8, #1
        cmp     r1, #0
        mov     r7, r8, lsl r6
        strh    r6, [r12]
        add     r6, r7, #1
        ble     LGAO63
        mov     r9, #0
        add     r7, r2, #4
        str     r9, [sp, #0x20]
        str     r6, [sp, #0x1C]
        str     r4, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r3, [sp, #0xC]
        str     r1, [sp, #8]
        str     lr, [sp]
LGAO59:
        ldr     r1, [sp, #0xC]
        mov     r4, r12
        cmp     r1, #0
        ldr     r1, [sp, #0x20]
        rsb     r1, r1, r1, lsl #2
        add     r3, r0, r1, lsl #2
        ldr     lr, [r3, #8]
        ble     LGAO72
        mov     r5, r2
        mov     r9, r7
        str     r2, [sp, #0x28]
        ldr     r2, [sp]
        mov     r11, #0
        mov     r6, r11
        str     r7, [sp, #0x24]
LGAO60:
        ldr     r7, [r5], #4
        add     r3, r0, r1, lsl #2
        ldr     r3, [r3, #4]
        add     r6, r6, r7
        mov     r8, r11, lsl #2
        subs    r10, lr, r6
        str     r8, [sp, #0x2C]
        ble     LGAO67
        mov     r8, #1
        mov     r7, r8, lsl r7
        sub     r7, r7, #1
        and     r10, r7, r3, asr r10
        add     r7, r4, r10, lsl #1
        ldrh    r3, [r7, #2]
        cmp     r2, r3
        beq     LGAO66
        tst     r3, #1
        bne     LGAO65
        ldr     r4, [sp, #0x14]
        cmp     r4, r3, asr #1
        bicgt   r3, r3, #1
        ble     LGAO64
LGAO61:
        ldr     r4, [sp, #0xC]
        add     r11, r11, #1
        add     r9, r9, #4
        cmp     r11, r4
        add     r4, r12, r3
        blt     LGAO60
        str     r2, [sp]
        ldr     r7, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        mov     r8, #1
LGAO62:
        ldr     r1, [sp, #0x20]
        ldr     r3, [sp, #8]
        add     r1, r1, #1
        str     r1, [sp, #0x20]
        cmp     r1, r3
        blt     LGAO59
LGAO63:
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGAO64:
        mvn     r0, #0x80
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGAO65:
        mvn     r0, #0x80
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGAO66:
        ldr     r4, [sp, #0x1C]
        mov     r8, #1
        mov     r3, r4, lsl #1
        strh    r3, [r7, #2]
        ldr     r7, [r9]
        strh    r7, [r12, +r3]
        ldr     r7, [sp, #0x24]
        ldr     r7, [r7, +r11, lsl #2]
        add     r7, r4, r8, lsl r7
        add     r4, r7, #1
        str     r4, [sp, #0x1C]
        b       LGAO61
LGAO67:
        mov     r5, r7
        ldr     r7, [sp, #0x24]
        mov     r8, #1
        add     r5, r5, r10
        str     r2, [sp]
        ldr     r2, [sp, #0x28]
        ldr     r1, [r0, +r1, lsl #2]
        sub     r6, r6, lr
        mov     r9, r8, lsl r5
        sub     lr, r9, #1
        mov     r9, r8, lsl r6
        and     lr, r3, lr
        cmp     r9, #0
        mov     lr, lr, lsl r6
        ble     LGAO62
        ldr     r3, [sp, #0x18]
        cmp     r9, #5
        add     r3, r3, #1
        blt     LGAO71
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x2C]
        mov     r3, r1, lsl r3
        mov     r11, #0
        add     r4, r4, #2
        sub     r6, r9, #5
        mov     r1, lr
        str     r7, [sp, #0x24]
        str     r12, [sp, #0x10]
LGAO68:
        add     r5, r3, r5, lsl #1
        mov     r8, r1, lsl #1
        add     r5, r5, #1
        strh    r5, [r4, +r8]
        ldr     r12, [r2, +r0]
        add     r5, r8, #2
        add     r7, r8, #4
        add     r12, r10, r12
        add     r8, r8, #6
        add     r1, r1, #4
        add     r12, r3, r12, lsl #1
        add     r12, r12, #1
        strh    r12, [r4, +r5]
        ldr     r12, [r2, +r0]
        add     r11, r11, #4
        cmp     r11, r6
        add     r12, r10, r12
        add     r12, r3, r12, lsl #1
        add     r12, r12, #1
        strh    r12, [r4, +r7]
        ldr     r12, [r2, +r0]
        add     r12, r10, r12
        add     r12, r3, r12, lsl #1
        add     r12, r12, #1
        strh    r12, [r4, +r8]
        ldr     r5, [r2, +r0]
        addle   r5, r5, r10
        ble     LGAO68
        ldr     r7, [sp, #0x24]
        ldr     r12, [sp, #0x10]
        ldr     r0, [sp, #4]
        mov     r8, #1
        add     r5, r5, r10
LGAO69:
        ldr     r1, [sp, #0x2C]
        add     lr, r11, lr
LGAO70:
        add     r6, r3, r5, lsl #1
        add     r11, r11, #1
        mov     r5, lr, lsl #1
        add     r6, r6, #1
        cmp     r11, r9
        strh    r6, [r4, +r5]
        add     lr, lr, #1
        ldrlt   r5, [r2, +r1]
        addlt   r5, r5, r10
        blt     LGAO70
        b       LGAO62
LGAO71:
        mov     r11, #0
        add     r4, r4, #2
        mov     r3, r1, lsl r3
        b       LGAO69
LGAO72:
        ldr     r1, [sp, #0x20]
        ldr     r3, [sp, #8]
        add     r1, r1, #1
        str     r1, [sp, #0x20]
        cmp     r1, r3
        blt     LGAO59
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGAO_ownippVLCInternalTableInit8:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r4, [sp, #0x48]
        ldr     r12, [sp, #0x44]
        ldr     lr, [sp, #0x4C]
        cmp     r4, #0
        mov     r5, #0
        ble     LGAO76
        cmp     r4, #6
        movlt   r6, r5
        blt     LGAO74
        mov     r6, r5
        sub     r9, r4, #6
        mov     r8, #0xFE
        sub     r7, r12, #1
LGAO73:
        add     r6, r6, #5
        strb    r8, [r7, #1]
        strb    r8, [r7, #2]
        strb    r8, [r7, #3]
        strb    r8, [r7, #4]
        strb    r8, [r7, #5]!
        cmp     r6, r9
        ble     LGAO73
LGAO74:
        mov     r8, #0xFE
        add     r7, r6, r12
LGAO75:
        add     r6, r6, #1
        strb    r8, [r7], #1
        cmp     r6, r4
        blt     LGAO75
LGAO76:
        ldr     r6, [r2]
        mov     r7, #1
        cmp     r1, #0
        mov     r8, r7, lsl r6
        strb    r6, [r12]
        add     r8, r8, #1
        ble     LGAO81
        add     r6, r2, #4
        str     r8, [sp, #0xC]
        str     lr, [sp, #4]
        str     r4, [sp, #0x10]
        str     r1, [sp, #8]
        str     r5, [sp]
LGAO77:
        ldr     r1, [sp]
        cmp     r3, #0
        mov     lr, r12
        rsb     r1, r1, r1, lsl #2
        add     r4, r0, r1, lsl #2
        ldr     r7, [r4, #8]
        ble     LGAO90
        mov     r4, r2
        mov     r10, r6
        mov     r11, #0
        mov     r9, r11
        str     r6, [sp, #0x18]
        str     r2, [sp, #0x14]
LGAO78:
        ldr     r2, [r4], #4
        add     r5, r0, r1, lsl #2
        ldr     r8, [r5, #4]
        add     r9, r9, r2
        mov     r6, r11, lsl #2
        subs    r5, r7, r9
        str     r6, [sp, #0x1C]
        ble     LGAO85
        mov     r6, #1
        mov     r2, r6, lsl r2
        sub     r2, r2, #1
        and     r5, r2, r8, asr r5
        add     lr, lr, r5
        ldrb    r2, [lr, #1]
        cmp     r2, #0xFE
        beq     LGAO84
        tst     r2, #1
        bne     LGAO83
        ldr     lr, [sp, #0x10]
        cmp     lr, r2, asr #1
        addgt   lr, r12, r2, asr #1
        ble     LGAO82
LGAO79:
        add     r11, r11, #1
        cmp     r11, r3
        add     r10, r10, #4
        blt     LGAO78
        ldr     r6, [sp, #0x18]
        ldr     r2, [sp, #0x14]
LGAO80:
        ldr     r1, [sp]
        ldr     lr, [sp, #8]
        add     r1, r1, #1
        str     r1, [sp]
        cmp     r1, lr
        blt     LGAO77
LGAO81:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LGAO82:
        mvn     r0, #0x80
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LGAO83:
        mvn     r0, #0x80
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LGAO84:
        ldr     r2, [sp, #0xC]
        mov     r6, #1
        mov     r5, r2, lsl #1
        strb    r5, [lr, #1]
        ldr     r5, [r10]
        add     lr, r12, r2
        strb    r5, [r2, +r12]
        ldr     r5, [sp, #0x18]
        ldr     r5, [r5, +r11, lsl #2]
        add     r5, r2, r6, lsl r5
        add     r2, r5, #1
        str     r2, [sp, #0xC]
        b       LGAO79
LGAO85:
        mov     r4, r2
        ldr     r6, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     r1, [r0, +r1, lsl #2]
        sub     r10, r9, r7
        mov     r7, #1
        add     r4, r4, r5
        mov     r9, r7, lsl r4
        mov     r7, r7, lsl r10
        sub     r9, r9, #1
        cmp     r7, #0
        and     r11, r8, r9
        ble     LGAO80
        ldr     r8, [sp, #4]
        cmp     r7, #5
        add     r8, r8, #1
        blt     LGAO89
        add     r10, lr, r11, lsl r10
        ldr     r11, [sp, #0x1C]
        mov     r8, r1, lsl r8
        mov     r9, #0
        sub     lr, r7, #5
        mov     r1, r10
LGAO86:
        add     r4, r8, r4, lsl #1
        add     r4, r4, #1
        strb    r4, [r1, #1]
        ldr     r4, [r2, +r11]
        add     r9, r9, #4
        cmp     r9, lr
        add     r4, r5, r4
        add     r4, r8, r4, lsl #1
        add     r4, r4, #1
        strb    r4, [r1, #2]
        ldr     r4, [r2, +r11]
        add     r4, r5, r4
        add     r4, r8, r4, lsl #1
        add     r4, r4, #1
        strb    r4, [r1, #3]
        ldr     r4, [r2, +r11]
        add     r4, r5, r4
        add     r4, r8, r4, lsl #1
        add     r4, r4, #1
        strb    r4, [r1, #4]!
        ldr     r4, [r2, +r11]
        addle   r4, r4, r5
        ble     LGAO86
        add     r4, r4, r5
LGAO87:
        ldr     r1, [sp, #0x1C]
        add     r10, r9, r10
LGAO88:
        add     r4, r8, r4, lsl #1
        add     lr, r4, #1
        add     r9, r9, #1
        strb    lr, [r10, #1]!
        cmp     r9, r7
        ldrlt   lr, [r2, +r1]
        addlt   r4, lr, r5
        blt     LGAO88
        b       LGAO80
LGAO89:
        mov     r9, #0
        add     r10, lr, r11, lsl r10
        mov     r8, r1, lsl r8
        b       LGAO87
LGAO90:
        ldr     r1, [sp]
        ldr     lr, [sp, #8]
        add     r1, r1, #1
        str     r1, [sp]
        cmp     r1, lr
        blt     LGAO77
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d4160


