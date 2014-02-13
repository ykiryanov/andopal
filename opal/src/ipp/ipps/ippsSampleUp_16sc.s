        .text
        .align  4
        .globl  _ippsSampleUp_16sc


_ippsSampleUp_16sc:
        stmdb   sp!, {r4 - r6, lr}
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0x14]
        mov     r4, r1
        cmp     r0, #0
        mov     r1, r2
        beq     LAYS8
        cmp     r1, #0
        beq     LAYS8
        cmp     lr, #0
        beq     LAYS8
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r3, #0
        beq     LAYS8
        cmp     r12, #0
        mvnle   r0, #0x1E
        ldmleia sp!, {r4 - r6, pc}
        ldr     r5, [lr]
        cmp     r5, #0
        blt     LAYS6
        cmp     r5, r12
        bge     LAYS6
        mul     r5, r4, r12
        cmp     r12, #1
        str     r5, [r3]
        beq     LAYS7
        ldr     r5, [lr]
        cmp     r4, #0
        sub     r4, r4, #1
        mov     r3, #0
        mov     r6, r5
        beq     LAYS3
        sub     r12, r12, #1
LAYS0:
        cmp     r6, #0
        sub     r6, r6, #1
        beq     LAYS2
LAYS1:
        sub     r6, r6, #1
        strh    r3, [r1]
        strh    r3, [r1, #2]
        cmn     r6, #1
        add     r1, r1, #4
        bne     LAYS1
LAYS2:
        ldrsh   r5, [r0]
        sub     r4, r4, #1
        cmn     r4, #1
        strh    r5, [r1]
        ldrsh   r5, [r0, #2]
        mov     r6, r12
        add     r0, r0, #4
        strh    r5, [r1, #2]
        add     r1, r1, #4
        bne     LAYS0
        ldr     r5, [lr]
LAYS3:
        subs    r6, r6, r5
        sub     r0, r6, #1
        beq     LAYS5
LAYS4:
        sub     r0, r0, #1
        strh    r3, [r1]
        strh    r3, [r1, #2]
        cmn     r0, #1
        add     r1, r1, #4
        bne     LAYS4
LAYS5:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LAYS6:
        mvn     r0, #0x1D
        ldmia   sp!, {r4 - r6, pc}
LAYS7:
        mov     r2, r4
        ldmia   sp!, {r4 - r6, lr}
        b       _ippsCopy_16sc
LAYS8:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


