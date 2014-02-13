        .text
        .align  4
        .globl  _ippsInterpolateC_NR_16s


_ippsInterpolateC_NR_16s:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r4, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     lr, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        cmp     r0, #0
        beq     LDHN9
        cmp     r3, #0
        beq     LDHN9
        cmp     lr, #0
        beq     LDHN9
        cmp     r12, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r2, #0
        blt     LDHN8
        cmp     r5, #0
        blt     LDHN8
        mvn     r6, #0xFF
        cmp     r2, r5
        bic     r6, r6, #0x7F, 24
        mov     r7, #0
        mov     r9, #1
        ble     LDHN3
        rsbs    r8, r5, #0x10
        subne   r7, r8, #1
        movne   r7, r9, lsl r7
        cmp     r12, #0
        ble     LDHN7
        sub     r2, r2, r5
        mvn     r6, r6
        mov     r5, #0
LDHN0:
        ldrsh   r9, [r0], #2
        mul     r10, r1, r9
        ldrsh   r9, [r3], #2
        mov     r10, r10, lsl r2
        mla     r10, r4, r9, r10
        add     r9, r7, r10
        mov     r9, r9, asr r8
        cmp     r6, r9
        blt     LDHN1
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        movlt   r9, #0
        sublt   r9, r9, #2, 18
        b       LDHN2
LDHN1:
        mvn     r9, #0xFF
        bic     r9, r9, #0x7F, 24
        mvn     r9, r9
LDHN2:
        add     r5, r5, #1
        strh    r9, [lr], #2
        cmp     r5, r12
        blt     LDHN0
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDHN3:
        rsbs    r8, r2, #0x10
        subne   r7, r8, #1
        movne   r7, r9, lsl r7
        cmp     r12, #0
        ble     LDHN7
        sub     r5, r5, r2
        mvn     r6, r6
        mov     r2, #0
LDHN4:
        ldrsh   r9, [r3], #2
        mul     r10, r4, r9
        ldrsh   r9, [r0], #2
        mov     r10, r10, lsl r5
        mla     r10, r1, r9, r10
        add     r9, r7, r10
        mov     r9, r9, asr r8
        cmp     r6, r9
        blt     LDHN5
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        mvnlt   r9, #0xFF
        biclt   r9, r9, #0x7F, 24
        b       LDHN6
LDHN5:
        mov     r9, #0
        sub     r9, r9, #2, 18
        mvn     r9, r9
LDHN6:
        add     r2, r2, #1
        strh    r9, [lr], #2
        cmp     r2, r12
        blt     LDHN4
LDHN7:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDHN8:
        mvn     r0, #0xC
        ldmia   sp!, {r4 - r10, pc}
LDHN9:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


