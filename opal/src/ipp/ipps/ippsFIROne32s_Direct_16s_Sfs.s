        .text
        .align  4
        .globl  _ippsFIROne32s_Direct_16s_Sfs


_ippsFIROne32s_Direct_16s_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r5, [sp, #0x20]
        ldr     r4, [sp, #0x24]
        ldr     lr, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        cmp     r1, #0
        beq     LCRA6
        cmp     r2, #0
        beq     LCRA6
        cmp     r3, #0
        mvnle   r0, #0x19
        ldmleia sp!, {r4 - r10, pc}
        cmp     r4, #0
        beq     LCRA6
        cmp     lr, #0
        beq     LCRA6
        ldr     r6, [lr]
        sub     r12, r5, r12
        add     r5, r4, r3, lsl #1
        mov     r6, r6, lsl #1
        strh    r0, [r5, +r6]
        ldr     r6, [lr]
        mov     r5, #0
        mov     r6, r6, lsl #1
        strh    r0, [r4, +r6]
        ldr     r0, [lr]
        add     r0, r0, #1
        cmp     r0, r3
        strlt   r0, [lr]
        movge   r0, #0
        strge   r0, [lr]
        cmp     r3, #6
        add     r0, r4, r0, lsl #1
        blt     LCRA5
        mov     r7, #0
        sub     r2, r2, #4
        mov     r6, r7
        sub     lr, r3, #6
        mov     r4, r0
LCRA0:
        sub     r8, r3, r6
        ldr     r10, [r2, +r8, lsl #2]
        ldrsh   r9, [r4]
        add     r6, r6, #5
        cmp     r6, lr
        mov     r8, r8, lsl #2
        mla     r7, r10, r9, r7
        ldrsh   r9, [r4, #2]
        sub     r10, r8, #4
        ldr     r10, [r2, +r10]
        mla     r7, r10, r9, r7
        ldrsh   r9, [r4, #4]
        sub     r10, r8, #8
        ldr     r10, [r2, +r10]
        mla     r9, r10, r9, r7
        ldrsh   r10, [r4, #6]
        sub     r7, r8, #0xC
        ldr     r7, [r2, +r7]
        sub     r8, r8, #0x10
        ldr     r8, [r2, +r8]
        mla     r9, r7, r10, r9
        ldrsh   r7, [r4, #8]
        add     r4, r4, #0xA
        mla     r7, r8, r7, r9
        ble     LCRA0
LCRA1:
        add     r0, r0, r6, lsl #1
LCRA2:
        ldrsh   lr, [r0], #2
        sub     r4, r3, r6
        ldr     r4, [r2, +r4, lsl #2]
        add     r6, r6, #1
        mla     r7, r4, lr, r7
        cmp     r6, r3
        blt     LCRA2
        cmp     r12, #0
        beq     LCRA3
        cmp     r12, #0x1F
        mov     r0, #0x1F
        movgt   r12, r0
        cmn     r12, #0x1F
        mvn     r0, #0x1E
        movlt   r12, r0
        cmp     r12, #0
        movgt   r7, r7, lsl r12
        bgt     LCRA3
        rsb     r12, r12, #0
        mov     r0, #1
        sub     r2, r12, #1
        add     r0, r7, r0, lsl r2
        mov     r7, r7, asr r12
        and     r7, r7, #1
        add     r7, r0, r7
        sub     r0, r7, #1
        mov     r7, r0, asr r12
LCRA3:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r2, r0
        cmp     r2, r7
        sublt   r5, r5, #2, 18
        mvnlt   r0, r5
        blt     LCRA4
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r0, r7, asr #16
LCRA4:
        strh    r0, [r1]
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCRA5:
        mov     r7, #0
        sub     r2, r2, #4
        mov     r6, r7
        b       LCRA1
LCRA6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


