        .text
        .align  4
        .globl  _ippsAutoScale_16s_I


_ippsAutoScale_16s_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LDRV17
        cmp     r2, #0
        beq     LDRV17
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        ldr     r5, [r2]
        cmp     r5, #0
        mvnlt   r0, #0xC
        ldmltia sp!, {r4 - r8, pc}
        cmp     r1, #0
        ble     LDRV2
        mov     r3, #0xFF
        mov     r12, #0
        orr     r3, r3, #0x7F, 24
        mov     lr, r12
        mov     r6, r0
        mov     r4, r1
LDRV0:
        ldrsh   r7, [r6], #2
        cmp     r7, #0
        bge     LDRV1
        cmn     r7, #2, 18
        moveq   r7, r3
        beq     LDRV1
        rsb     r7, r7, #0
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
LDRV1:
        cmp     r7, lr
        movgt   lr, r7
        subs    r4, r4, #1
        bne     LDRV0
        cmp     lr, #0
        bne     LDRV3
LDRV2:
        mov     r3, #0x10
        b       LDRV8
LDRV3:
        cmp     lr, #1, 18
        movge   r3, r12
        bge     LDRV5
        mov     r3, r12
LDRV4:
        mov     lr, lr, lsl #1
        cmp     lr, #1, 18
        add     r3, r3, #1
        blt     LDRV4
LDRV5:
        cmp     r3, r5
        ble     LDRV7
        cmp     r1, #0
        ble     LDRV8
        cmp     r1, #6
        blt     LDRV12
        sub     r4, r1, #6
        mov     lr, r0
LDRV6:
        ldrsh   r6, [lr]
        sub     r5, r3, r5
        ldrsh   r7, [lr, #2]
        mov     r5, r6, lsl r5
        strh    r5, [lr]
        ldr     r8, [r2]
        ldrsh   r5, [lr, #4]
        ldrsh   r6, [lr, #6]
        sub     r8, r3, r8
        mov     r8, r7, lsl r8
        strh    r8, [lr, #2]
        ldr     r8, [r2]
        ldrsh   r7, [lr, #8]
        add     r12, r12, #5
        sub     r8, r3, r8
        mov     r8, r5, lsl r8
        strh    r8, [lr, #4]
        ldr     r5, [r2]
        cmp     r12, r4
        sub     r5, r3, r5
        mov     r5, r6, lsl r5
        strh    r5, [lr, #6]
        ldr     r5, [r2]
        sub     r5, r3, r5
        mov     r5, r7, lsl r5
        strh    r5, [lr, #8]
        add     lr, lr, #0xA
        ldrle   r5, [r2]
        ble     LDRV6
        b       LDRV11
LDRV7:
        cmp     r3, r5
        blt     LDRV9
LDRV8:
        sub     r3, r3, r5
        mov     r0, #0
        str     r3, [r2]
        ldmia   sp!, {r4 - r8, pc}
LDRV9:
        cmp     r1, #0
        ble     LDRV8
        cmp     r1, #6
        blt     LDRV15
        sub     r4, r1, #6
        mov     lr, r0
LDRV10:
        ldrsh   r6, [lr]
        sub     r5, r5, r3
        ldrsh   r7, [lr, #2]
        mov     r5, r6, asr r5
        strh    r5, [lr]
        ldr     r8, [r2]
        ldrsh   r5, [lr, #4]
        ldrsh   r6, [lr, #6]
        sub     r8, r8, r3
        mov     r8, r7, asr r8
        strh    r8, [lr, #2]
        ldr     r8, [r2]
        ldrsh   r7, [lr, #8]
        add     r12, r12, #5
        sub     r8, r8, r3
        mov     r8, r5, asr r8
        strh    r8, [lr, #4]
        ldr     r5, [r2]
        cmp     r12, r4
        sub     r5, r5, r3
        mov     r5, r6, asr r5
        strh    r5, [lr, #6]
        ldr     r5, [r2]
        sub     r5, r5, r3
        mov     r5, r7, asr r5
        strh    r5, [lr, #8]
        add     lr, lr, #0xA
        ldrle   r5, [r2]
        ble     LDRV10
        b       LDRV14
LDRV11:
        ldr     r5, [r2]
LDRV12:
        add     r0, r0, r12, lsl #1
LDRV13:
        ldrsh   lr, [r0]
        sub     r5, r3, r5
        add     r12, r12, #1
        mov     r5, lr, lsl r5
        strh    r5, [r0], #2
        cmp     r12, r1
        ldrlt   r5, [r2]
        blt     LDRV13
        ldr     r5, [r2]
        b       LDRV8
LDRV14:
        ldr     r5, [r2]
LDRV15:
        add     r0, r0, r12, lsl #1
LDRV16:
        ldrsh   lr, [r0]
        sub     r5, r5, r3
        add     r12, r12, #1
        mov     r5, lr, asr r5
        strh    r5, [r0], #2
        cmp     r12, r1
        ldrlt   r5, [r2]
        blt     LDRV16
        ldr     r5, [r2]
        b       LDRV8
LDRV17:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


