        .text
        .align  4
        .globl  _ippsAutoScale_16s


_ippsAutoScale_16s:
        stmdb   sp!, {r4 - r10, lr}
        mov     r5, r0
        mov     r0, r1
        cmp     r5, #0
        mov     r1, r2
        mov     r4, r3
        beq     LDRW11
        cmp     r0, #0
        beq     LDRW11
        cmp     r4, #0
        beq     LDRW11
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        ldr     r8, [r4]
        cmp     r8, #0
        mvnlt   r0, #0xC
        ldmltia sp!, {r4 - r10, pc}
        cmp     r1, #0
        mov     r9, #0
        movle   r12, r9
        ble     LDRW2
        mov     r12, #0xFF
        orr     lr, r12, #0x7F, 24
        mov     r12, r9
        mov     r7, r5
        mov     r6, r1
LDRW0:
        ldrsh   r10, [r7], #2
        cmn     r10, #2, 18
        moveq   r10, lr
        beq     LDRW1
        cmp     r10, #0
        bge     LDRW1
        cmn     r10, #2, 18
        moveq   r10, lr
        beq     LDRW1
        rsb     r10, r10, #0
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
LDRW1:
        cmp     r10, r12
        movgt   r12, r10
        subs    r6, r6, #1
        bne     LDRW0
LDRW2:
        cmp     r12, #0
        beq     LDRW6
        cmp     r12, #1, 18
        movge   r7, r9
        bge     LDRW4
        mov     r7, r9
LDRW3:
        mov     r12, r12, lsl #1
        add     r7, r7, #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #1, 18
        blt     LDRW3
LDRW4:
        cmp     r1, #0
        ble     LDRW7
        cmp     r1, #5
        blt     LDRW9
        sub     r6, r1, #5
        mov     lr, r5
        mov     r12, r0
LDRW5:
        ldrsh   r10, [lr]
        add     r9, r9, #4
        cmp     r9, r6
        mov     r10, r10, lsl r7
        mov     r8, r10, asr r8
        strh    r8, [r12]
        ldrsh   r10, [lr, #2]
        ldr     r8, [r4]
        mov     r10, r10, lsl r7
        mov     r8, r10, asr r8
        strh    r8, [r12, #2]
        ldrsh   r10, [lr, #4]
        ldr     r8, [r4]
        mov     r10, r10, lsl r7
        mov     r8, r10, asr r8
        strh    r8, [r12, #4]
        ldrsh   r10, [lr, #6]
        ldr     r8, [r4]
        add     lr, lr, #8
        mov     r10, r10, lsl r7
        mov     r8, r10, asr r8
        strh    r8, [r12, #6]
        add     r12, r12, #8
        ldrle   r8, [r4]
        ble     LDRW5
        b       LDRW8
LDRW6:
        bl      _ippsZero_16s
        ldr     r8, [r4]
        mov     r7, #0x10
LDRW7:
        sub     r7, r7, r8
        mov     r0, #0
        str     r7, [r4]
        ldmia   sp!, {r4 - r10, pc}
LDRW8:
        ldr     r8, [r4]
LDRW9:
        add     r5, r5, r9, lsl #1
        add     r0, r0, r9, lsl #1
LDRW10:
        ldrsh   r12, [r5], #2
        add     r9, r9, #1
        mov     r12, r12, lsl r7
        mov     r8, r12, asr r8
        strh    r8, [r0], #2
        cmp     r9, r1
        ldrlt   r8, [r4]
        blt     LDRW10
        ldr     r8, [r4]
        b       LDRW7
LDRW11:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


