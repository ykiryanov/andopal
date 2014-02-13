        .text
        .align  4
        .globl  _ippsControllerGetSizeAEC_32s


LAAK_$M676:
_ippsControllerGetSizeAEC_32s:
        mov     r3, #0xA8
        str     r3, [r0]
        mov     r0, #0
        mov     pc, lr
LAAK_$M677:


        .text
        .align  4
        .globl  _ippsControllerInitAEC_32s


_ippsControllerInitAEC_32s:
        stmdb   sp!, {r4 - r11, lr}
LAAK_$M687:
        mov     r4, r1
        mov     r3, #2, 20
        str     r3, [r4, #0x2C]
        mov     r3, #0x80
        mov     r5, #0
        str     r3, [r4, #0x40]
        mov     r7, r0
        str     r5, [r4]
        mov     r0, #2, 4
        str     r5, [r4, #4]
        mov     r3, #2, 24
        str     r0, [r4, #0x50]
        str     r3, [r4, #0x44]
        mov     r1, #2, 12
        str     r0, [r4, #0x54]
        str     r0, [r4, #0x58]
        str     r0, [r4, #0x5C]
        str     r5, [r4, #8]
        str     r5, [r4, #0x7C]
        str     r5, [r4, #0xC]
        str     r5, [r4, #0x10]
        str     r5, [r4, #0x14]
        str     r5, [r4, #0x18]
        str     r5, [r4, #0x80]
        str     r5, [r4, #0x1C]
        str     r5, [r4, #0x20]
        str     r5, [r4, #0x24]
        str     r5, [r4, #0x28]
        str     r5, [r4, #0x84]
        str     r5, [r4, #0x30]
        str     r5, [r4, #0x34]
        str     r5, [r4, #0x38]
        str     r5, [r4, #0x3C]
        str     r5, [r4, #0x74]
        str     r5, [r4, #0x60]
        str     r5, [r4, #0x64]
        ldr     r3, [r7, #0x14]
        str     r5, [r4, #0x9C]
        str     r3, [r4, #0x6C]
        mov     r3, #1
        str     r3, [r4, #0xA4]
        str     r5, [r4, #0x94]
        str     r5, [r4, #0xA0]
        ldr     r3, [r7, #0x28]
        cmp     r3, #0
        addmi   r3, r3, #1
        mov     r0, r3, asr #1
        ldr     r3, [pc, #0x278]
        ldr     r3, [r3]
        mov     lr, pc
        mov     pc, r3
        ldr     r3, [r7, #0x2C]
        mov     r6, r0
        mov     r11, r6, asr #31
        mov     r1, r3, lsl #15
        ldr     r3, [pc, #0x258]
        mov     r0, #0x7D, 26
        ldr     r3, [r3]
        mov     lr, pc
        mov     pc, r3
        mov     r3, r0, asr #31
        mov     r2, r6
        mul     r3, r2, r3
        mul     r2, r11, r0
        add     r3, r3, r2
        umull   r1, r2, r6, r0
        mul     r1, r6, r0
        add     r0, r3, r2
        mov     r3, r0, lsl #17
        orr     r0, r3, r1, lsr #15
        mov     r6, r0, asr #31
        mov     r8, r0
        mov     r2, #6
        mov     r3, r6
        mov     r1, r8
        mul     lr, r3, r2
        umull   r11, r3, r1, r2
        mul     r2, r1, r2
        add     r1, lr, r3
        mov     r3, r1, lsl #17
        orr     r3, r3, r2, lsr #15
        str     r3, [r4, #0x98]
        mov     r1, #0x51, 12
        ldr     r3, [pc, #0x1E8]
        orr     r1, r1, #0x3A, 18
        ldr     r3, [r3]
        mov     lr, pc
        mov     pc, r3
        str     r0, [r4, #0x68]
        mov     r1, #0x7D
        mov     r3, r6
        mul     r2, r3, r1
        mov     r0, r8
        umull   lr, r3, r0, r1
        mul     r1, r0, r1
        add     r0, r2, r3
        mov     r3, r0, lsl #17
        orr     r0, r3, r1, lsr #15
        mov     r1, r8
        str     r0, [r4, #0x70]
        mvn     r3, #0
        str     r0, [r4, #0x78]
        mov     r0, r1
        mul     lr, r0, r3
        ldr     r0, [pc, #0x190]
        mov     r2, r6
        mul     r11, r2, r0
        add     r2, lr, r11
        umull   r11, lr, r1, r0
        mul     r11, r1, r0
        add     r0, r2, lr
        mov     r2, r0, lsl #1
        orr     r0, r2, r11, lsr #31
        mov     r2, r0, asr #31
        mov     r11, r2
        mov     r10, r0
        mul     r9, r10, r2
        mov     r1, r0
        mul     r10, r11, r1
        add     lr, r0, #2, 18
        add     r11, r9, r10
        umull   r9, r10, r0, r1
        mul     r9, r0, r1
        add     r0, r11, r10
        mov     r0, r0, lsl #17
        orr     r0, r0, r9, lsr #15
        mov     r0, r0, asr #1
        mov     r10, r0
        mul     r2, r10, r2
        mov     r11, r0, asr #31
        mul     r10, r11, r1
        add     lr, r0, lr
        add     r2, r2, r10
        umull   r10, r11, r0, r1
        mul     r1, r0, r1
        add     r0, r2, r11
        mov     r2, r0, lsl #17
        orr     r1, r2, r1, lsr #15
        mov     r2, r1, asr #31
        ldr     r0, [pc, #0x100]
        mul     r11, r2, r0
        umull   r10, r2, r1, r0
        mul     r10, r1, r0
        add     r1, r11, r2
        mov     r2, r1, lsl #1
        orr     r2, r2, r10, lsr #31
        add     r2, r2, lr
        mov     r2, r2, lsl #16
        ldr     r1, [pc, #0xD8]
        str     r2, [r4, #0x48]
        mov     r2, r8
        mul     r3, r2, r3
        mul     r2, r6, r1
        add     r3, r3, r2
        umull   lr, r2, r8, r1
        mul     lr, r8, r1
        add     r1, r3, r2
        mov     r3, r1, lsl #1
        orr     r1, r3, lr, lsr #31
        add     lr, r1, #2, 18
        mov     r2, r1
        mov     r3, r1, asr #31
        mov     r11, r3
        mov     r10, r1
        mul     r9, r10, r3
        mul     r10, r11, r2
        add     r11, r9, r10
        umull   r9, r10, r1, r2
        mul     r9, r1, r2
        add     r1, r11, r10
        mov     r1, r1, lsl #17
        orr     r1, r1, r9, lsr #15
        mov     r1, r1, asr #1
        mov     r10, r1
        mul     r3, r10, r3
        mov     r11, r1, asr #31
        mul     r10, r11, r2
        add     lr, r1, lr
        add     r3, r3, r10
        umull   r10, r11, r1, r2
        mul     r2, r1, r2
        add     r1, r3, r11
        mov     r3, r1, lsl #17
        orr     r1, r3, r2, lsr #15
        mov     r3, r1, asr #31
        mul     r2, r3, r0
        umull   r11, r3, r1, r0
        mul     r11, r1, r0
        add     r0, r2, r3
        mov     r3, r0, lsl #1
        orr     r3, r3, r11, lsr #31
        ldr     r2, [pc, #0x28]
        rsb     r3, r3, r2
        sub     r3, r3, lr
        mov     r3, r3, lsl #16
        str     r3, [r4, #0x4C]
        ldr     r3, [r7, #0x28]
        str     r5, [r4, #0x88]
        cmp     r3, #0
        addmi   r3, r3, #1
        mov     r3, r3, asr #1
        mov     r0, r3, asr #1
        b       LAAK1
        .long   0xffff8000
        .long   0xff5bbfc0
        .long   0x2aaaaaab
        .long   0xf96f38a9
        .long   __imp___rt_sdiv
LAAK0:
        ldr     r3, [r4, #0x88]
        mov     r0, r0, asr #1
        add     r3, r3, #1
        str     r3, [r4, #0x88]
LAAK1:
        cmp     r0, #0
        bgt     LAAK0
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAAK_$M688:


        .text
        .align  4
        .globl  _ippsControllerUpdateAEC_32s


_ippsControllerUpdateAEC_32s:
        mov     r12, sp
        stmdb   sp!, {r2, r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     sp, sp, #0x1C
LAAK_$M750:
        str     r3, [sp, #0x48]
        mov     r11, #0
        ldr     r3, [r0, #0x28]
        mov     r4, r1
        mov     r7, r11
        str     r2, [sp, #0x44]
        cmp     r3, #0
        str     r7, [sp, #0xC]
        addmi   r3, r3, #1
        str     r11, [sp, #0x18]
        mov     r10, r11
        str     r11, [sp, #8]
        mov     r1, r3, asr #1
        str     r10, [sp, #0x10]
        mov     r9, r11
        str     r11, [sp, #4]
        mov     r6, r11
        str     r11, [sp]
        mov     r8, r11
        cmp     r1, #0
        ble     LAAK3
        ldr     lr, [r0, #4]
        ldr     r5, [r0, #8]
        ldr     r0, [r0]
        add     r3, lr, r1, lsl #1
        ldr     r2, [r4, #0x88]
        sub     r7, r0, lr
LAAK2:
        ldrsh   r0, [r5]
        sub     r1, r1, #1
        add     r5, r5, #2
        mov     lr, r0
        cmp     r0, #0
        mul     r0, lr, r0
        add     r9, r9, r0, asr r2
        ldrsh   r0, [r7, +r3]
        mov     lr, r0
        mul     r11, lr, r0
        ldrsh   lr, [r3]
        add     r3, r3, #2
        add     r6, r6, r11, asr r2
        mov     r11, lr
        mul     r10, r11, lr
        ldreq   r11, [sp, #8]
        addeq   r11, r11, #1
        streq   r11, [sp, #8]
        cmp     r0, #0
        ldreq   r0, [sp, #4]
        add     r8, r8, r10, asr r2
        addeq   r0, r0, #1
        streq   r0, [sp, #4]
        cmp     lr, #0
        ldreq   r0, [sp]
        addeq   r0, r0, #1
        streq   r0, [sp]
        cmp     r1, #0
        bhi     LAAK2
        ldr     r7, [sp, #0xC]
        mov     r11, #0
        ldr     r10, [sp, #0x10]
LAAK3:
        ldr     r3, [r4, #0xA4]
        cmp     r3, #0
        beq     LAAK4
        str     r9, [r4]
        str     r9, [r4, #4]
        str     r9, [r4, #8]
        str     r6, [r4, #0xC]
        str     r6, [r4, #0x10]
        str     r6, [r4, #0x14]
        str     r6, [r4, #0x18]
        str     r8, [r4, #0x1C]
        str     r8, [r4, #0x20]
        str     r8, [r4, #0x24]
        str     r8, [r4, #0x28]
        str     r11, [r4, #0xA4]
        b       LAAK5
LAAK4:
        ldr     r3, [r4]
        ldr     r1, [r4, #0x48]
        sub     r0, r9, r3
        mov     r11, r0
        mov     lr, r0, asr #31
        mov     r2, r1, asr #31
        mul     r10, r11, r2
        mul     r11, lr, r1
        add     lr, r10, r11
        umull   r10, r11, r0, r1
        mul     r10, r0, r1
        add     r0, lr, r11
        mov     r0, r0, lsl #1
        orr     r0, r0, r10, lsr #31
        add     r3, r0, r3
        str     r3, [r4]
        ldr     r3, [r4, #0xC]
        sub     r0, r6, r3
        mov     r11, r0
        mov     lr, r0, asr #31
        mul     r10, r11, r2
        mul     r11, lr, r1
        add     lr, r10, r11
        umull   r10, r11, r0, r1
        mul     r10, r0, r1
        add     r0, lr, r11
        mov     r0, r0, lsl #1
        ldr     lr, [r4, #0x10]
        orr     r0, r0, r10, lsr #31
        add     r3, r0, r3
        ldr     r0, [r4, #0x4C]
        str     r3, [r4, #0xC]
        mov     r3, r0
        mov     r5, r0, asr #31
        sub     r0, r6, lr
        mov     r10, r0
        mov     r11, r0, asr #31
        mul     r7, r10, r5
        mul     r10, r11, r3
        add     r11, r7, r10
        umull   r7, r10, r0, r3
        mul     r7, r0, r3
        add     r0, r11, r10
        mov     r0, r0, lsl #1
        orr     r0, r0, r7, lsr #31
        add     r0, r0, lr
        ldr     r7, [sp, #0xC]
        ldr     lr, [r4, #0x1C]
        str     r0, [r4, #0x10]
        sub     r0, r8, lr
        mov     r10, r0
        mov     r11, r0, asr #31
        mul     r2, r10, r2
        mul     r10, r11, r1
        add     r2, r2, r10
        umull   r10, r11, r0, r1
        ldr     r10, [sp, #0x10]
        mul     r1, r0, r1
        add     r0, r2, r11
        mov     r2, r0, lsl #1
        orr     r2, r2, r1, lsr #31
        add     r2, r2, lr
        mov     r1, r3
        str     r2, [r4, #0x1C]
        ldr     r2, [r4, #0x20]
        sub     r0, r8, r2
        mov     r3, r0
        mov     lr, r0, asr #31
        mul     r11, r3, r5
        mul     r3, lr, r1
        add     r3, r11, r3
        umull   r11, lr, r0, r1
        mul     r1, r0, r1
        add     r0, r3, lr
        mov     r3, r0, lsl #1
        orr     r3, r3, r1, lsr #31
        add     r3, r3, r2
        mov     r11, #0
        str     r3, [r4, #0x20]
LAAK5:
        mov     r3, r6, asr #31
        ldr     lr, [pc, #0x94]
        mov     r3, r3, lsl #6
        add     r2, r9, #1
        ldr     r5, [lr]
        orr     r1, r3, r6, lsr #26
        mov     r0, r6, lsl #6
        mov     r3, r2, asr #31
        mov     lr, pc
        mov     pc, r5
        mvn     r5, #2, 2
        cmp     r1, #0
        bmi     LAAK7
        bgt     LAAK6
        cmp     r0, r5
        bls     LAAK7
LAAK6:
        mov     r0, r5
        str     r11, [sp, #0x14]
LAAK7:
        str     r0, [r4, #0x34]
        ldr     r0, [r4, #0xC]
        ldr     r2, [r4]
        mov     r3, r0, asr #31
        ldr     lr, [pc, #0x40]
        mov     r3, r3, lsl #6
        add     r2, r2, #1
        ldr     r11, [lr]
        orr     r1, r3, r0, lsr #26
        mov     r0, r0, lsl #6
        mov     r3, r2, asr #31
        mov     lr, pc
        mov     pc, r11
        cmp     r1, #0
        bmi     LAAK9
        bgt     LAAK8
        cmp     r0, r5
        bls     LAAK9
LAAK8:
        mov     r11, #0
        mov     r0, r5
        str     r11, [sp, #0x14]
        b       LAAK10
        .long   __imp___rt_sdiv64by64
LAAK9:
        mov     r11, #0
LAAK10:
        ldr     r2, [sp]
        mov     r3, r0
        str     r3, [sp, #0x10]
        str     r3, [r4, #0x30]
        cmp     r2, #0
        bne     LAAK12
        ldr     r1, [r4, #0x84]
        ldr     r2, [r4, #0x78]
        cmp     r1, r2
        bge     LAAK11
        ldr     r0, [r4, #0x24]
        add     r2, r1, #1
        str     r2, [r4, #0x84]
        cmp     r8, r0
        movle   r0, r8
        str     r0, [r4, #0x24]
        ldr     r0, [r4, #0x28]
        cmp     r8, r0
        movle   r0, r8
        str     r0, [r4, #0x28]
        b       LAAK12
LAAK11:
        ldr     r0, [r4, #0x28]
        str     r8, [r4, #0x28]
        cmp     r8, r0
        str     r11, [r4, #0x84]
        movle   r0, r8
        str     r0, [r4, #0x24]
LAAK12:
        ldr     r2, [sp, #4]
        cmp     r2, #0
        bne     LAAK14
        ldr     r1, [r4, #0x80]
        ldr     r2, [r4, #0x78]
        cmp     r1, r2
        bge     LAAK13
        ldr     r0, [r4, #0x14]
        add     r2, r1, #1
        str     r2, [r4, #0x80]
        cmp     r6, r0
        movle   r0, r6
        str     r0, [r4, #0x14]
        ldr     r0, [r4, #0x18]
        cmp     r6, r0
        movle   r0, r6
        str     r0, [r4, #0x18]
        b       LAAK14
LAAK13:
        ldr     r0, [r4, #0x18]
        str     r6, [r4, #0x18]
        cmp     r6, r0
        str     r11, [r4, #0x80]
        movle   r0, r6
        str     r0, [r4, #0x14]
LAAK14:
        ldr     r2, [sp, #8]
        cmp     r2, #0
        bne     LAAK16
        ldr     r1, [r4, #0x7C]
        ldr     r2, [r4, #0x78]
        cmp     r1, r2
        bge     LAAK15
        ldr     r0, [r4, #4]
        add     r2, r1, #1
        str     r2, [r4, #0x7C]
        cmp     r9, r0
        movle   r0, r9
        str     r0, [r4, #4]
        ldr     r0, [r4, #8]
        cmp     r9, r0
        movle   r0, r9
        str     r0, [r4, #8]
        b       LAAK16
LAAK15:
        ldr     r0, [r4, #8]
        str     r9, [r4, #8]
        cmp     r9, r0
        str     r11, [r4, #0x7C]
        movle   r0, r9
        str     r0, [r4, #4]
LAAK16:
        ldr     r1, [r4, #0x14]
        mov     r0, #3, 16
        mov     r2, r1, asr #31
        mul     lr, r2, r0
        umull   r9, r2, r1, r0
        mul     r9, r1, r0
        add     r1, lr, r2
        mov     r2, r1, lsl #17
        ldr     r1, [r4, #0x24]
        orr     r2, r2, r9, lsr #15
        mov     lr, r1, asr #31
        mul     r9, lr, r0
        umull   r5, lr, r1, r0
        mul     r5, r1, r0
        add     r0, r9, lr
        mov     r1, r0, lsl #17
        cmp     r2, #0x80
        orr     r0, r1, r5, lsr #15
        movle   r2, #0x80
        cmp     r0, #0x80
        ldr     r1, [r4, #0x40]
        movle   r0, #0x80
        cmp     r3, r1
        mov     r3, #1
        movle   r3, r11
        cmp     r8, r0
        mov     lr, r8, asr #31
        ldr     r0, [r4, #0x2C]
        mov     r9, r0
        mov     r1, r0, asr #31
        mul     lr, r9, lr
        mul     r9, r1, r8
        mov     r5, #1
        add     r1, lr, r9
        umull   r9, lr, r0, r8
        mul     r9, r0, r8
        add     r0, r1, lr
        movle   r5, r11
        mov     r1, r0, lsl #17
        ldr     r8, [sp, #0x10]
        cmp     r6, r2
        orr     r1, r1, r9, lsr #15
        mov     r2, #1
        ldr     r0, [r4, #0x44]
        movle   r2, r11
        cmp     r1, r6
        mov     r1, #1
        movle   r1, r11
        cmp     r8, r0
        mov     lr, #1
        movge   lr, r11
        cmp     r3, #0
        mov     r0, r11
        movne   r0, #1
        cmp     r5, #0
        addne   r0, r0, #2
        cmp     r2, #0
        addne   r0, r0, #4
        cmp     r1, #0
        addne   r0, r0, #8
        ldr     r1, [pc, #0x8C]
        ldr     r0, [r1, +r0, lsl #2]
        ldr     r1, [r4, #0x9C]
        str     r0, [r4, #0xA0]
        cmp     r1, #0
        beq     LAAK22
        cmp     r1, #1
        beq     LAAK20
        cmp     r1, #2
        beq     LAAK17
        cmp     r1, #3
        bne     LAAK25
        ldr     r3, [r4, #0x8C]
        ldr     r1, [r4, #0xA0]
        add     r3, r3, #1
        ldr     r2, [pc, #0x4C]
        str     r3, [r4, #0x8C]
        mov     r3, r0
        ldr     r0, [pc, #0x3C]
        cmp     r1, #3
        ldr     r3, [r0, +r3, lsl #2]
        mov     r0, r1, lsl #2
        str     r3, [r4, #0x9C]
        ldr     r7, [r0, +r2]
        ldr     r2, [pc, #0x20]
        ldr     r6, [r0, +r2]
        ldr     r2, [pc, #0x14]
        ldr     r10, [r0, +r2]
        bne     LAAK19
        cmp     lr, #0
        beq     LAAK19
        mov     r3, #1
        b       LAAK18
        .long   LAAK_nextMuAdjustDOUBLE
        .long   LAAK_nextSpkGainTargetDOUBLE
        .long   LAAK_nextStateDOUBLE
        .long   LAAK_nextOutGainTargetDOUBLE
        .long   LAAK_eventTable
LAAK17:
        ldr     r1, [pc, #0x6C]
        ldr     r2, [pc, #0x64]
        ldr     r3, [r1, +r0, lsl #2]
        ldr     r1, [r4, #0xA0]
        str     r3, [r4, #0x9C]
        mov     r0, r1, lsl #2
        ldr     r7, [r0, +r2]
        cmp     r1, #3
        ldr     r2, [pc, #0x44]
        ldr     r6, [r0, +r2]
        ldr     r2, [pc, #0x38]
        ldr     r10, [r0, +r2]
        bne     LAAK19
        cmp     lr, #0
        beq     LAAK19
        mov     r3, #3
LAAK18:
        mov     r0, #1, 2
        str     r3, [r4, #0x9C]
        mov     r7, r0
        mov     r6, r0
        mov     r10, r11
LAAK19:
        ldr     r3, [r4, #0x9C]
        cmp     r3, #1
        bne     LAAK26
        ldr     r3, [r4, #0x98]
        b       LAAK23
        .long   LAAK_nextMuAdjustIDLE
        .long   LAAK_nextSpkGainTargetIDLE
        .long   LAAK_nextOutGainTargetIDLE
        .long   LAAK_nextStateIDLE
LAAK20:
        ldr     r1, [pc, #0x6C]
        ldr     r2, [pc, #0x64]
        ldr     r3, [r1, +r0, lsl #2]
        ldr     r1, [r4, #0xA0]
        str     r3, [r4, #0x9C]
        mov     r0, r1, lsl #2
        ldr     r7, [r0, +r2]
        cmp     r1, #3
        ldr     r2, [pc, #0x44]
        ldr     r6, [r0, +r2]
        ldr     r2, [pc, #0x38]
        ldr     r10, [r0, +r2]
        bne     LAAK21
        cmp     lr, #0
        movne   r10, r11
LAAK21:
        ldr     r0, [r4, #0x94]
        cmp     r0, #0
        subgt   r3, r0, #1
        strgt   r3, [r4, #0x94]
        ldr     r3, [r4, #0x9C]
        cmp     r3, #1
        bne     LAAK26
        ldr     r3, [r4, #0x94]
        cmp     r3, #0
        ble     LAAK26
        b       LAAK24
        .long   LAAK_nextMuAdjustTRACK
        .long   LAAK_nextSpkGainTargetTRACK
        .long   LAAK_nextOutGainTargetTRACK
        .long   LAAK_nextStateTRACK
LAAK22:
        ldr     r1, [pc, #0x54]
        ldr     r3, [r4, #0xA0]
        ldr     r1, [r1, +r0, lsl #2]
        ldr     r2, [pc, #0x44]
        mov     r0, r3, lsl #2
        str     r1, [r4, #0x9C]
        cmp     r1, #1
        ldr     r7, [r0, +r2]
        ldr     r2, [pc, #0x2C]
        ldr     r6, [r0, +r2]
        ldr     r2, [pc, #0x20]
        ldr     r10, [r0, +r2]
        bne     LAAK26
        ldr     r3, [r4, #0x98]
        cmp     r3, #0
        addmi   r3, r3, #3
        mov     r3, r3, asr #2
LAAK23:
        str     r3, [r4, #0x94]
LAAK24:
        mov     r10, r11
        b       LAAK26
        .long   LAAK_nextMuAdjustSTARTUP
        .long   LAAK_nextSpkGainTargetSTARTUP
        .long   LAAK_nextOutGainTargetSTARTUP
        .long   LAAK_nextStateSTARTUP
LAAK25:
        ldr     r6, [sp, #0x18]
LAAK26:
        cmp     r5, #0
        beq     LAAK29
        ldr     r3, [r4, #0x9C]
        cmp     r3, #3
        beq     LAAK29
        ldr     r0, [r4, #0x38]
        ldr     r1, [r4, #0x74]
        ldr     r3, [r4, #0x70]
        mov     r2, r0
        cmp     r1, r3
        bge     LAAK27
        cmp     r8, r0
        movgt   r0, r8
        str     r0, [r4, #0x38]
        add     r3, r1, #1
        ldr     r0, [r4, #0x3C]
        str     r3, [r4, #0x74]
        cmp     r8, r0
        movgt   r0, r8
        str     r0, [r4, #0x3C]
        b       LAAK28
LAAK27:
        ldr     r0, [r4, #0x3C]
        str     r8, [r4, #0x3C]
        cmp     r8, r0
        str     r11, [r4, #0x74]
        movgt   r0, r8
        str     r0, [r4, #0x38]
LAAK28:
        ldr     r0, [r4, #0x38]
        cmp     r0, r2
        beq     LAAK29
        bl      _clz32s
        rsb     r1, r0, #0x20
        ldr     r0, [pc, #0x98]
        mov     r3, r1, asr #31
        mul     r2, r3, r0
        umull   lr, r3, r1, r0
        mul     lr, r1, r0
        add     r0, r2, r3
        mov     r3, r0, lsl #1
        ldr     r2, [r4, #0x38]
        orr     r3, r3, lr, lsr #31
        mov     r3, r2, asr r3
        str     r3, [r4, #0x44]
LAAK29:
        ldr     r3, [r4, #0x58]
        cmp     r7, r3
        beq     LAAK30
        ldr     r3, [r4, #0x50]
        ldr     r1, [r4, #0x68]
        sub     r0, r7, r3
        str     r7, [r4, #0x58]
        mov     r2, r1, asr #31
        mov     lr, r0
        mul     r2, lr, r2
        mov     r3, r0, asr #31
        mul     lr, r3, r1
        add     r3, r2, lr
        umull   lr, r2, r0, r1
        mul     r1, r0, r1
        add     r0, r3, r2
        mov     r3, r0, lsl #17
        orr     r3, r3, r1, lsr #15
        str     r3, [r4, #0x60]
LAAK30:
        ldr     r1, [r4, #0x50]
        ldr     r0, [r4, #0x58]
        cmp     r1, r0
        bge     LAAK31
        ldr     r3, [r4, #0x60]
        add     r1, r3, r1
        str     r1, [r4, #0x50]
        cmp     r1, r0
        ble     LAAK33
        b       LAAK32
        .long   0x33333333
LAAK31:
        ble     LAAK33
        ldr     r3, [r4, #0x60]
        add     r1, r3, r1
        str     r1, [r4, #0x50]
        cmp     r1, r0
        bge     LAAK33
LAAK32:
        str     r0, [r4, #0x50]
LAAK33:
        ldr     r3, [r4, #0x50]
        ldr     r2, [sp, #0x48]
        str     r3, [r2]
        ldr     r3, [r4, #0x5C]
        cmp     r6, r3
        beq     LAAK34
        ldr     r3, [r4, #0x54]
        ldr     r1, [r4, #0x68]
        sub     r0, r6, r3
        str     r6, [r4, #0x5C]
        mov     r2, r1, asr #31
        mov     lr, r0
        mul     r2, lr, r2
        mov     r3, r0, asr #31
        mul     lr, r3, r1
        add     r3, r2, lr
        umull   lr, r2, r0, r1
        mul     r1, r0, r1
        add     r0, r3, r2
        mov     r3, r0, lsl #17
        orr     r3, r3, r1, lsr #15
        str     r3, [r4, #0x64]
LAAK34:
        ldr     r1, [r4, #0x54]
        ldr     r0, [r4, #0x5C]
        cmp     r1, r0
        bge     LAAK35
        ldr     r3, [r4, #0x64]
        add     r1, r3, r1
        str     r1, [r4, #0x54]
        cmp     r1, r0
        ble     LAAK37
        b       LAAK36
LAAK35:
        ble     LAAK37
        ldr     r3, [r4, #0x64]
        add     r1, r3, r1
        str     r1, [r4, #0x54]
        cmp     r1, r0
        bge     LAAK37
LAAK36:
        str     r0, [r4, #0x54]
LAAK37:
        ldr     r3, [r4, #0x54]
        ldr     r2, [sp, #0x4C]
        str     r3, [r2]
        mov     r2, r10, asr #31
        ldr     r0, [r4, #0x6C]
        mov     r1, r0
        mov     r3, r0, asr #31
        mul     r2, r1, r2
        mul     r1, r3, r10
        add     r3, r2, r1
        umull   r1, r2, r0, r10
        mul     r1, r0, r10
        add     r0, r3, r2
        mov     r3, r0, lsl #2
        ldr     r2, [sp, #0x44]
        orr     r3, r3, r1, lsr #30
        mov     r0, #0
        str     r3, [r2]
        add     sp, sp, #0x1C
        ldmia   sp, {r4 - r11, sp, pc}
LAAK_$M751:


        .data
        .align  4


LAAK_eventTable:
        .byte   0x10,0x00,0x00,0x00,0x0F,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x0C,0x00,0x00,0x00,0x0B,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x03,0x00,0x00,0x00
        .byte   0x0E,0x00,0x00,0x00,0x0D,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x05,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x01,0x00,0x00,0x00
LAAK_nextStateSTARTUP:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LAAK_nextStateTRACK:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x03,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LAAK_nextStateIDLE:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x03,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LAAK_nextStateDOUBLE:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x03,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,0x00,0x00,0x00
        .byte   0x01,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LAAK_nextOutGainTargetSTARTUP:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00
LAAK_nextOutGainTargetTRACK:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00
LAAK_nextOutGainTargetIDLE:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00
LAAK_nextOutGainTargetDOUBLE:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00
LAAK_nextSpkGainTargetSTARTUP:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00
LAAK_nextSpkGainTargetTRACK:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00
LAAK_nextSpkGainTargetIDLE:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00
LAAK_nextSpkGainTargetDOUBLE:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00
LAAK_nextMuAdjustSTARTUP:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x10
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LAAK_nextMuAdjustTRACK:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x10
        .byte   0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LAAK_nextMuAdjustIDLE:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20
        .byte   0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LAAK_nextMuAdjustDOUBLE:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x10
        .byte   0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00


        .data
        .align  4


LAAK_$T678:
        .long   _ippsControllerGetSizeAEC_32s
        .byte   0x00,0x04,0x00,0x40


        .data
        .align  4


LAAK_$T689:
        .long   _ippsControllerInitAEC_32s
        .byte   0x01,0xD9,0x00,0x40


        .data
        .align  4


LAAK_$T752:
        .long   _ippsControllerUpdateAEC_32s
        .byte   0x04,0x55,0x02,0x40


