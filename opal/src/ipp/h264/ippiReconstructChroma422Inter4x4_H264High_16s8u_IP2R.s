        .text
        .align  4
        .globl  ippiReconstructChroma422Inter4x4_H264High_16s8u_IP2R


ippiReconstructChroma422Inter4x4_H264High_16s8u_IP2R:
        mov     r12, sp
        stmdb   sp!, {r4, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x78
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        ldr     r0, [r11, #-0x1C]
        cmp     r0, #0
        bne     LKXB0
        mvn     r0, #7
        ldmdb   r11, {r4, r11, sp, pc}
LKXB0:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0]
        ldr     r0, [r0]
        cmp     r0, #0
        beq     LKXB1
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0]
        ldr     r0, [r0, #4]
        cmp     r0, #0
        bne     LKXB2
LKXB1:
        mvn     r0, #7
        ldmdb   r11, {r4, r11, sp, pc}
LKXB2:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0]
        ldr     r0, [r0]
        ldr     r0, [r0]
        cmp     r0, #0
        beq     LKXB3
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0]
        ldr     r0, [r0, #0x14]
        cmp     r0, #0
        bne     LKXB4
LKXB3:
        mvn     r0, #7
        ldmdb   r11, {r4, r11, sp, pc}
LKXB4:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0, #4]
        ldr     r0, [r0]
        cmp     r0, #0
        beq     LKXB5
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #4]
        cmp     r0, #0
        bne     LKXB6
LKXB5:
        mvn     r0, #7
        ldmdb   r11, {r4, r11, sp, pc}
LKXB6:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0, #4]
        ldr     r0, [r0]
        ldr     r0, [r0]
        cmp     r0, #0
        beq     LKXB7
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #0x14]
        cmp     r0, #0
        bne     LKXB8
LKXB7:
        mvn     r0, #7
        ldmdb   r11, {r4, r11, sp, pc}
LKXB8:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0]
        ldr     r0, [r0, #8]
        cmp     r0, #0
        bgt     LKXB9
        mvn     r0, #0xD
        ldmdb   r11, {r4, r11, sp, pc}
LKXB9:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #8]
        cmp     r0, #0
        bgt     LKXB10
        mvn     r0, #0xD
        ldmdb   r11, {r4, r11, sp, pc}
LKXB10:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0]
        ldr     r0, [r0, #0x10]
        cmp     r0, #0
        blt     LKXB11
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0]
        ldr     r0, [r0, #0x10]
        cmp     r0, #0x27
        ble     LKXB12
LKXB11:
        mvn     r0, #0xA
        ldmdb   r11, {r4, r11, sp, pc}
LKXB12:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #0x10]
        cmp     r0, #0
        blt     LKXB13
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #0x10]
        cmp     r0, #0x27
        ble     LKXB14
LKXB13:
        mvn     r0, #0xA
        ldmdb   r11, {r4, r11, sp, pc}
LKXB14:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0]
        ldr     r0, [r0, #0xC]
        cmp     r0, #0
        bne     LKXB15
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #0xC]
        cmp     r0, #0
        beq     LKXB41
LKXB15:
        sub     r1, r11, #0x80
        ldr     r0, [pc, #0xA84]
        str     r0, [r1]
        sub     r1, r11, #0x80
        str     r0, [r1, #4]
        mov     r1, #2, 16
        mov     r0, #0
        str     r1, [r11, #-0x88]
        str     r0, [r11, #-0x84]
        str     r0, [r11, #-0x78]
        ldr     r0, [r11, #-0x78]
        cmp     r0, #2
        bcs     LKXB21
LKXB16:
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1, #0xC]
        tst     r0, #1
        beq     LKXB20
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1, #0x10]
        add     r0, r0, #3
        str     r0, [r11, #-0x74]
        ldr     r0, [r11, #-0x78]
        cmp     r0, #0
        ldrne   r0, [r11, #-0x14]
        strne   r0, [r11, #-0x70]
        ldreq   r0, [r11, #-0x18]
        streq   r0, [r11, #-0x70]
        ldr     r0, [r11, #-0x74]
        mov     r1, #6
        bl      __intel_idiv
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1]
        ldr     r0, [r0]
        ldr     r2, [r11, #-0x78]
        sub     r1, r11, #0x80
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1, #0x18]
        cmp     r0, #0
        beq     LKXB17
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1, #0x10]
        cmp     r0, #0
        ble     LKXB19
LKXB17:
        ldr     r1, [r11, #-0x78]
        sub     r0, r11, #0x80
        ldr     r0, [r0, +r1, lsl #2]
        sub     r1, r11, #0x68
        str     r0, [r1]
        ldr     r1, [r11, #-0x78]
        sub     r0, r11, #0x80
        ldr     r1, [r0, +r1, lsl #2]
        add     r0, r1, #4
        sub     r1, r11, #0x68
        str     r0, [r1, #4]
        ldr     r1, [r11, #-0x78]
        sub     r0, r11, #0x80
        ldr     r1, [r0, +r1, lsl #2]
        add     r0, r1, #8
        sub     r1, r11, #0x68
        str     r0, [r1, #8]
        ldr     r1, [r11, #-0x78]
        sub     r0, r11, #0x80
        ldr     r1, [r0, +r1, lsl #2]
        add     r0, r1, #0xC
        sub     r1, r11, #0x68
        str     r0, [r1, #0xC]
        sub     r0, r11, #0x68
        ldr     r0, [r0]
        ldrsh   r0, [r0]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        ldrsh   r1, [r1]
        add     r0, r0, r1
        sub     r1, r11, #0x68
        ldr     r1, [r1, #8]
        ldrsh   r1, [r1]
        add     r0, r0, r1
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        ldrsh   r1, [r1]
        add     r1, r0, r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x58
        strh    r0, [r1]
        sub     r0, r11, #0x68
        ldr     r0, [r0]
        ldrsh   r0, [r0]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        ldrsh   r1, [r1]
        add     r1, r0, r1
        sub     r0, r11, #0x68
        ldr     r0, [r0, #8]
        ldrsh   r2, [r0]
        mov     r0, #0
        sub     r2, r0, r2
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #0xC]
        ldrsh   r2, [r2]
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x58
        strh    r1, [r2, #4]
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        ldrsh   r1, [r1]
        sub     r2, r11, #0x68
        ldr     r2, [r2, #4]
        ldrsh   r2, [r2]
        sub     r2, r0, r2
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #8]
        ldrsh   r2, [r2]
        sub     r2, r0, r2
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #0xC]
        ldrsh   r2, [r2]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x58
        strh    r1, [r2, #8]
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        ldrsh   r1, [r1]
        sub     r2, r11, #0x68
        ldr     r2, [r2, #4]
        ldrsh   r2, [r2]
        sub     r2, r0, r2
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #8]
        ldrsh   r2, [r2]
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #0xC]
        ldrsh   r2, [r2]
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x58
        strh    r1, [r2, #0xC]
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        ldrsh   r1, [r1, #2]
        sub     r2, r11, #0x68
        ldr     r2, [r2, #4]
        ldrsh   r2, [r2, #2]
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #8]
        ldrsh   r2, [r2, #2]
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #0xC]
        ldrsh   r2, [r2, #2]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x58
        strh    r1, [r2, #2]
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        ldrsh   r1, [r1, #2]
        sub     r2, r11, #0x68
        ldr     r2, [r2, #4]
        ldrsh   r2, [r2, #2]
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #8]
        ldrsh   r2, [r2, #2]
        sub     r2, r0, r2
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #0xC]
        ldrsh   r2, [r2, #2]
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x58
        strh    r1, [r2, #6]
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        ldrsh   r1, [r1, #2]
        sub     r2, r11, #0x68
        ldr     r2, [r2, #4]
        ldrsh   r2, [r2, #2]
        sub     r2, r0, r2
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #8]
        ldrsh   r2, [r2, #2]
        sub     r2, r0, r2
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #0xC]
        ldrsh   r2, [r2, #2]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x58
        strh    r1, [r2, #0xA]
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        ldrsh   r1, [r1, #2]
        sub     r2, r11, #0x68
        ldr     r2, [r2, #4]
        ldrsh   r2, [r2, #2]
        sub     r2, r0, r2
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #8]
        ldrsh   r2, [r2, #2]
        add     r1, r1, r2
        sub     r2, r11, #0x68
        ldr     r2, [r2, #0xC]
        ldrsh   r2, [r2, #2]
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x58
        strh    r1, [r2, #0xE]
        sub     r1, r11, #0x58
        ldrsh   r1, [r1]
        sub     r2, r11, #0x58
        ldrsh   r2, [r2, #2]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x68
        ldr     r2, [r2]
        strh    r1, [r2]
        sub     r1, r11, #0x58
        ldrsh   r1, [r1, #4]
        sub     r2, r11, #0x58
        ldrsh   r2, [r2, #6]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x68
        ldr     r2, [r2, #4]
        strh    r1, [r2]
        sub     r1, r11, #0x58
        ldrsh   r1, [r1, #8]
        sub     r2, r11, #0x58
        ldrsh   r2, [r2, #0xA]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x68
        ldr     r2, [r2, #8]
        strh    r1, [r2]
        sub     r1, r11, #0x58
        ldrsh   r1, [r1, #0xC]
        sub     r2, r11, #0x58
        ldrsh   r2, [r2, #0xE]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x68
        ldr     r2, [r2, #0xC]
        strh    r1, [r2]
        sub     r1, r11, #0x58
        ldrsh   r1, [r1]
        sub     r2, r11, #0x58
        ldrsh   r2, [r2, #2]
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x68
        ldr     r2, [r2]
        strh    r1, [r2, #2]
        sub     r1, r11, #0x58
        ldrsh   r1, [r1, #4]
        sub     r2, r11, #0x58
        ldrsh   r2, [r2, #6]
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x68
        ldr     r2, [r2, #4]
        strh    r1, [r2, #2]
        sub     r1, r11, #0x58
        ldrsh   r1, [r1, #8]
        sub     r2, r11, #0x58
        ldrsh   r2, [r2, #0xA]
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x68
        ldr     r2, [r2, #8]
        strh    r1, [r2, #2]
        sub     r1, r11, #0x58
        ldrsh   r1, [r1, #0xC]
        sub     r2, r11, #0x58
        ldrsh   r2, [r2, #0xE]
        sub     r0, r0, r2
        add     r0, r1, r0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        strh    r0, [r1, #2]
        ldr     r0, [r11, #-0x74]
        cmp     r0, #0x24
        bge     LKXB18
        ldr     r1, [r11, #-0x6C]
        mov     r0, #0
        sub     r1, r0, r1
        add     r1, r1, #5
        mov     r2, #1
        mov     r1, r2, lsl r1
        str     r1, [r11, #-0x44]
        ldr     r1, [r11, #-0x6C]
        sub     r0, r0, r1
        add     r0, r0, #6
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        ldrsh   r1, [r1]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x44]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        strh    r0, [r1]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        ldrsh   r1, [r1]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x44]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        strh    r0, [r1]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #8]
        ldrsh   r1, [r1]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x44]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #8]
        strh    r0, [r1]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        ldrsh   r1, [r1]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x44]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        strh    r0, [r1]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        ldrsh   r1, [r1, #2]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x44]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        strh    r0, [r1, #2]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        ldrsh   r1, [r1, #2]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x44]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        strh    r0, [r1, #2]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #8]
        ldrsh   r1, [r1, #2]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x44]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #8]
        strh    r0, [r1, #2]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        ldrsh   r1, [r1, #2]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x44]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        strh    r0, [r1, #2]
        b       LKXB19
LKXB18:
        ldr     r0, [r11, #-0x6C]
        sub     r0, r0, #6
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        ldrsh   r1, [r1]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, lsl r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        strh    r0, [r1]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        ldrsh   r1, [r1]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, lsl r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        strh    r0, [r1]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #8]
        ldrsh   r1, [r1]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, lsl r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #8]
        strh    r0, [r1]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        ldrsh   r1, [r1]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, lsl r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        strh    r0, [r1]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        ldrsh   r1, [r1, #2]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, lsl r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1]
        strh    r0, [r1, #2]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        ldrsh   r1, [r1, #2]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, lsl r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        strh    r0, [r1, #2]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #8]
        ldrsh   r1, [r1, #2]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, lsl r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #8]
        strh    r0, [r1, #2]
        ldr     r0, [r11, #-0x70]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        ldrsh   r1, [r1, #2]
        mul     r0, r1, r0
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, lsl r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        strh    r0, [r1, #2]
LKXB19:
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1]
        ldr     r0, [r0]
        add     r0, r0, #0x10
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x78]
        ldr     r2, [r1, +r2, lsl #2]
        ldr     r1, [r2]
        str     r0, [r1]
LKXB20:
        ldr     r0, [r11, #-0x78]
        add     r0, r0, #1
        str     r0, [r11, #-0x78]
        ldr     r0, [r11, #-0x78]
        cmp     r0, #2
        bcc     LKXB16
LKXB21:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0]
        ldr     r0, [r0, #4]
        str     r0, [r11, #-0x40]
        mov     r0, #0
        str     r0, [r11, #-0x78]
        ldr     r0, [r11, #-0x78]
        cmp     r0, #2
        bcs     LKXB41
LKXB22:
        mov     r0, #2
        mov     r4, #0
        str     r0, [r11, #-0x88]
        str     r4, [r11, #-0x84]
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1, #0x10]
        str     r0, [r11, #-0x74]
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1, #0x14]
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x74]
        mov     r1, #6
        bl      __intel_idiv
        str     r0, [r11, #-0x6C]
        str     r4, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        cmp     r0, #8
        bcs     LKXB40
LKXB23:
        ldr     r0, [r11, #-0x40]
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1, #0xC]
        ldr     r1, [r11, #-0x88]
        and     r1, r0, r1
        orrs    r0, r1, #0
        beq     LKXB35
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1]
        ldr     r0, [r0]
        str     r0, [r11, #-0x28]
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1]
        ldr     r0, [r0]
        add     r0, r0, #0x20
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x78]
        ldr     r2, [r1, +r2, lsl #2]
        ldr     r1, [r2]
        str     r0, [r1]
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1, #0x18]
        cmp     r0, #0
        beq     LKXB24
        ldr     r0, [r11, #-0x74]
        cmp     r0, #0
        ble     LKXB28
LKXB24:
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x10
        bcs     LKXB28
LKXB25:
        ldr     r0, [r11, #-0x74]
        cmp     r0, #0x18
        bge     LKXB26
        ldr     r1, [r11, #-0x6C]
        mov     r0, #0
        sub     r1, r0, r1
        add     r1, r1, #3
        mov     r2, #1
        mov     r1, r2, lsl r1
        str     r1, [r11, #-0x44]
        ldr     r1, [r11, #-0x6C]
        sub     r0, r0, r1
        add     r0, r0, #4
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x3C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldr     r1, [r11, #-0x44]
        add     r0, r0, r1
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        b       LKXB27
        .long   zeroArray16
        .long   ClampTbl
LKXB26:
        ldr     r0, [r11, #-0x6C]
        sub     r0, r0, #4
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x3C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mul     r0, r2, r0
        ldr     r1, [r11, #-0x48]
        mov     r1, r0, lsl r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
LKXB27:
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x10
        bcc     LKXB25
LKXB28:
        ldr     r1, [r11, #-0x78]
        sub     r0, r11, #0x80
        ldr     r0, [r0, +r1, lsl #2]
        ldr     r1, [r11, #-0x38]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
        ldr     r0, [r11, #-0x28]
        strh    r1, [r0]
        ldr     r0, [r11, #-0x28]
        sub     r1, r11, #0x68
        str     r0, [r1]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #8
        sub     r1, r11, #0x68
        str     r0, [r1, #4]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #0x10
        sub     r1, r11, #0x68
        str     r0, [r1, #8]
        ldr     r0, [r11, #-0x28]
        add     r0, r0, #0x18
        sub     r1, r11, #0x68
        str     r0, [r1, #0xC]
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1, #0x18]
        cmp     r0, #0
        beq     LKXB29
        ldr     r0, [r11, #-0x74]
        cmp     r0, #0
        ble     LKXB33
LKXB29:
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #4
        bcs     LKXB31
LKXB30:
        ldr     r1, [r11, #-0x2C]
        sub     r0, r11, #0x68
        ldr     r1, [r0, +r1, lsl #2]
        ldrsh   r0, [r1]
        ldr     r2, [r11, #-0x2C]
        sub     r1, r11, #0x68
        ldr     r2, [r1, +r2, lsl #2]
        ldrsh   r1, [r2, #4]
        add     r1, r0, r1
        mov     r0, r1, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x24
        strh    r0, [r1]
        ldr     r1, [r11, #-0x2C]
        sub     r0, r11, #0x68
        ldr     r1, [r0, +r1, lsl #2]
        ldrsh   r1, [r1]
        ldr     r2, [r11, #-0x2C]
        sub     r0, r11, #0x68
        ldr     r2, [r0, +r2, lsl #2]
        ldrsh   r2, [r2, #4]
        mov     r0, #0
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x24
        strh    r1, [r2, #2]
        ldr     r2, [r11, #-0x2C]
        sub     r1, r11, #0x68
        ldr     r2, [r1, +r2, lsl #2]
        ldrsh   r1, [r2, #2]
        mov     r1, r1, asr #1
        ldr     r3, [r11, #-0x2C]
        sub     r2, r11, #0x68
        ldr     r3, [r2, +r3, lsl #2]
        ldrsh   r2, [r3, #6]
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x24
        strh    r1, [r2, #4]
        ldr     r2, [r11, #-0x2C]
        sub     r1, r11, #0x68
        ldr     r2, [r1, +r2, lsl #2]
        ldrsh   r1, [r2, #2]
        ldr     r3, [r11, #-0x2C]
        sub     r2, r11, #0x68
        ldr     r3, [r2, +r3, lsl #2]
        ldrsh   r2, [r3, #6]
        mov     r2, r2, asr #1
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x24
        strh    r1, [r2, #6]
        sub     r1, r11, #0x24
        ldrsh   r1, [r1]
        sub     r2, r11, #0x24
        ldrsh   r2, [r2, #6]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        ldr     r3, [r11, #-0x2C]
        sub     r2, r11, #0x68
        ldr     r3, [r2, +r3, lsl #2]
        strh    r1, [r3]
        sub     r1, r11, #0x24
        ldrsh   r1, [r1, #2]
        sub     r2, r11, #0x24
        ldrsh   r2, [r2, #4]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        ldr     r3, [r11, #-0x2C]
        sub     r2, r11, #0x68
        ldr     r3, [r2, +r3, lsl #2]
        strh    r1, [r3, #2]
        sub     r1, r11, #0x24
        ldrsh   r1, [r1, #2]
        sub     r2, r11, #0x24
        ldrsh   r2, [r2, #4]
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        ldr     r3, [r11, #-0x2C]
        sub     r2, r11, #0x68
        ldr     r3, [r2, +r3, lsl #2]
        strh    r1, [r3, #4]
        sub     r1, r11, #0x24
        ldrsh   r1, [r1]
        sub     r2, r11, #0x24
        ldrsh   r2, [r2, #6]
        sub     r0, r0, r2
        add     r0, r1, r0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldr     r2, [r11, #-0x2C]
        sub     r1, r11, #0x68
        ldr     r2, [r1, +r2, lsl #2]
        strh    r0, [r2, #6]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #4
        bcc     LKXB30
LKXB31:
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #4
        bcs     LKXB33
LKXB32:
        sub     r0, r11, #0x68
        ldr     r0, [r0]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #1
        ldrsh   r0, [r0, +r1]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #8]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        add     r2, r0, r2
        mov     r0, r2, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x24
        strh    r0, [r1]
        sub     r0, r11, #0x68
        ldr     r0, [r0]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
        sub     r0, r11, #0x68
        ldr     r0, [r0, #8]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r0, +r2]
        mov     r0, #0
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x24
        strh    r1, [r2, #2]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        mov     r1, r2, asr #1
        sub     r2, r11, #0x68
        ldr     r2, [r2, #0xC]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #1
        ldrsh   r3, [r2, +r3]
        sub     r2, r0, r3
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x24
        strh    r1, [r2, #4]
        sub     r1, r11, #0x68
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        ldrsh   r1, [r1, +r2]
        sub     r2, r11, #0x68
        ldr     r2, [r2, #0xC]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #1
        ldrsh   r3, [r2, +r3]
        mov     r2, r3, asr #1
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x24
        strh    r1, [r2, #6]
        sub     r1, r11, #0x24
        ldrsh   r1, [r1]
        sub     r2, r11, #0x24
        ldrsh   r2, [r2, #6]
        add     r2, r1, r2
        add     r1, r2, #0x20
        mov     r1, r1, asr #6
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x68
        ldr     r2, [r2]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #1
        strh    r1, [r2, +r3]
        sub     r1, r11, #0x24
        ldrsh   r1, [r1, #2]
        sub     r2, r11, #0x24
        ldrsh   r2, [r2, #4]
        add     r2, r1, r2
        add     r1, r2, #0x20
        mov     r1, r1, asr #6
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x68
        ldr     r2, [r2, #4]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #1
        strh    r1, [r2, +r3]
        sub     r1, r11, #0x24
        ldrsh   r1, [r1, #2]
        sub     r2, r11, #0x24
        ldrsh   r2, [r2, #4]
        sub     r2, r0, r2
        add     r2, r1, r2
        add     r1, r2, #0x20
        mov     r1, r1, asr #6
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        sub     r2, r11, #0x68
        ldr     r2, [r2, #8]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #1
        strh    r1, [r2, +r3]
        sub     r1, r11, #0x24
        ldrsh   r1, [r1]
        sub     r2, r11, #0x24
        ldrsh   r2, [r2, #6]
        sub     r0, r0, r2
        add     r0, r1, r0
        add     r0, r0, #0x20
        mov     r0, r0, asr #6
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        sub     r1, r11, #0x68
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x2C]
        mov     r2, r2, lsl #1
        strh    r0, [r1, +r2]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #4
        bcc     LKXB32
LKXB33:
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #4
        bcs     LKXB38
LKXB34:
        ldr     r1, [r11, #-0x2C]
        sub     r0, r11, #0x68
        ldr     r1, [r0, +r1, lsl #2]
        ldrsh   r2, [r1]
        mvn     r1, #0xFF
        cmp     r2, r1
        mov     r0, r1
        movgt   r0, r2
        mov     r2, #1, 24
        cmp     r0, #1, 24
        movgt   r0, r2
        ldr     r3, [r11, #-0x34]
        ldrb    r3, [r3]
        add     r0, r3, r0
        add     r3, r0, #1, 24
        ldr     r0, [pc, #-0x524]
        ldrb    r3, [r3, +r0]
        ldr     lr, [r11, #-0x34]
        strb    r3, [lr]
        ldr     lr, [r11, #-0x2C]
        sub     r3, r11, #0x68
        ldr     lr, [r3, +lr, lsl #2]
        ldrsh   lr, [lr, #2]
        cmp     lr, r1
        mov     r3, r1
        movgt   r3, lr
        cmp     r3, #1, 24
        movgt   r3, r2
        ldr     lr, [r11, #-0x34]
        ldrb    lr, [lr, #1]
        add     r3, lr, r3
        add     r3, r3, #1, 24
        ldrb    r3, [r3, +r0]
        ldr     lr, [r11, #-0x34]
        strb    r3, [lr, #1]
        ldr     lr, [r11, #-0x2C]
        sub     r3, r11, #0x68
        ldr     lr, [r3, +lr, lsl #2]
        ldrsh   lr, [lr, #4]
        cmp     lr, r1
        mov     r3, r1
        movgt   r3, lr
        cmp     r3, #1, 24
        movgt   r3, r2
        ldr     lr, [r11, #-0x34]
        ldrb    lr, [lr, #2]
        add     r3, lr, r3
        add     r3, r3, #1, 24
        ldrb    r3, [r3, +r0]
        ldr     lr, [r11, #-0x34]
        strb    r3, [lr, #2]
        ldr     lr, [r11, #-0x2C]
        sub     r3, r11, #0x68
        ldr     lr, [r3, +lr, lsl #2]
        ldrsh   r3, [lr, #6]
        cmp     r3, r1
        movgt   r1, r3
        cmp     r1, #1, 24
        movgt   r1, r2
        ldr     r2, [r11, #-0x34]
        ldrb    r2, [r2, #3]
        add     r1, r2, r1
        add     r1, r1, #1, 24
        ldrb    r0, [r1, +r0]
        ldr     r1, [r11, #-0x34]
        strb    r0, [r1, #3]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x78]
        ldr     r2, [r1, +r2, lsl #2]
        ldr     r1, [r2, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0x34]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #4
        bcc     LKXB34
        b       LKXB38
LKXB35:
        ldr     r1, [r11, #-0x78]
        sub     r0, r11, #0x80
        ldr     r0, [r0, +r1, lsl #2]
        ldr     r1, [r11, #-0x38]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
        cmp     r1, #0
        beq     LKXB38
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x78]
        ldr     r1, [r0, +r1, lsl #2]
        ldr     r0, [r1, #0x18]
        cmp     r0, #0
        beq     LKXB36
        ldr     r0, [r11, #-0x74]
        cmp     r0, #0
        bgt     LKXB36
        ldr     r1, [r11, #-0x78]
        sub     r0, r11, #0x80
        ldr     r0, [r0, +r1, lsl #2]
        ldr     r1, [r11, #-0x38]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
        mvn     r0, #0xFF
        cmp     r1, r0
        movgt   r0, r1
        mov     r1, #1, 24
        cmp     r0, #1, 24
        movgt   r0, r1
        ldr     r1, [r11, #-0x34]
        ldrb    r1, [r1]
        add     r0, r1, r0
        add     r0, r0, #1, 24
        ldr     r1, [pc, #-0x6AC]
        ldrb    r0, [r0, +r1]
        ldr     r1, [r11, #-0x34]
        strb    r0, [r1]
        b       LKXB38
LKXB36:
        ldr     r1, [r11, #-0x78]
        sub     r0, r11, #0x80
        ldr     r0, [r0, +r1, lsl #2]
        ldr     r1, [r11, #-0x38]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
        add     r0, r1, #0x20
        mov     r0, r0, asr #6
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        strh    r0, [r11, #-0x30]
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #4
        bcs     LKXB38
LKXB37:
        ldrsh   r2, [r11, #-0x30]
        mvn     r1, #0xFF
        cmp     r2, r1
        mov     r0, r1
        movgt   r0, r2
        mov     r2, #1, 24
        cmp     r0, #1, 24
        movgt   r0, r2
        ldr     r3, [r11, #-0x34]
        ldrb    r3, [r3]
        add     r0, r3, r0
        add     r3, r0, #1, 24
        ldr     r0, [pc, #-0x730]
        ldrb    r3, [r3, +r0]
        ldr     lr, [r11, #-0x34]
        strb    r3, [lr]
        ldrsh   lr, [r11, #-0x30]
        cmp     lr, r1
        mov     r3, r1
        movgt   r3, lr
        cmp     r3, #1, 24
        movgt   r3, r2
        ldr     lr, [r11, #-0x34]
        ldrb    lr, [lr, #1]
        add     r3, lr, r3
        add     r3, r3, #1, 24
        ldrb    r3, [r3, +r0]
        ldr     lr, [r11, #-0x34]
        strb    r3, [lr, #1]
        ldrsh   lr, [r11, #-0x30]
        cmp     lr, r1
        mov     r3, r1
        movgt   r3, lr
        cmp     r3, #1, 24
        movgt   r3, r2
        ldr     lr, [r11, #-0x34]
        ldrb    lr, [lr, #2]
        add     r3, lr, r3
        add     r3, r3, #1, 24
        ldrb    r3, [r3, +r0]
        ldr     lr, [r11, #-0x34]
        strb    r3, [lr, #2]
        ldrsh   r3, [r11, #-0x30]
        cmp     r3, r1
        movgt   r1, r3
        cmp     r1, #1, 24
        movgt   r1, r2
        ldr     r2, [r11, #-0x34]
        ldrb    r2, [r2, #3]
        add     r1, r2, r1
        add     r1, r1, #1, 24
        ldrb    r0, [r1, +r0]
        ldr     r1, [r11, #-0x34]
        strb    r0, [r1, #3]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x78]
        ldr     r2, [r1, +r2, lsl #2]
        ldr     r1, [r2, #8]
        add     r1, r0, r1
        str     r1, [r11, #-0x34]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #4
        bcc     LKXB37
LKXB38:
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #4
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x38]
        and     r0, r0, #1
        cmp     r0, #1
        bne     LKXB39
        ldr     r0, [r11, #-0x40]
        ldr     r1, [r11, #-0x1C]
        ldr     r2, [r11, #-0x78]
        ldr     r2, [r1, +r2, lsl #2]
        ldr     r1, [r2, #8]
        mov     r1, r1, lsl #2
        sub     r1, r1, #8
        add     r1, r0, r1
        str     r1, [r11, #-0x40]
LKXB39:
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x88]
        ldr     r1, [r11, #-0x84]
        mov     r1, r1, lsl #1
        mov     r2, r0, lsr #31
        mov     r0, r0, lsl #1
        orr     r1, r1, r2
        str     r0, [r11, #-0x88]
        str     r1, [r11, #-0x84]
        ldr     r0, [r11, #-0x38]
        cmp     r0, #8
        bcc     LKXB23
LKXB40:
        ldr     r0, [r11, #-0x1C]
        ldr     r0, [r0, #4]
        ldr     r0, [r0, #4]
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x78]
        add     r0, r0, #1
        str     r0, [r11, #-0x78]
        ldr     r0, [r11, #-0x78]
        cmp     r0, #2
        bcc     LKXB22
LKXB41:
        mov     r0, #0
        ldmdb   r11, {r4, r11, sp, pc}


