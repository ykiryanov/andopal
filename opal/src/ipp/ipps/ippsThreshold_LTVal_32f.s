        .text
        .align  4
        .globl  _ippsThreshold_LTVal_32f


_ippsThreshold_LTVal_32f:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r9, [sp, #0x1C]
        mov     r5, r0
        cmp     r5, #0
        mov     r7, r1
        mov     r6, r2
        mov     r4, r3
        beq     LAPF2
        cmp     r7, #0
        beq     LAPF2
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r6, #0
        ble     LAPF1
LAPF0:
        ldr     r8, [r5], #4
        mov     r1, r4
        mov     r0, r8
        bl      __gesf2
        cmp     r0, #0
        movlt   r8, r9
        str     r8, [r7], #4
        subs    r6, r6, #1
        bne     LAPF0
LAPF1:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LAPF2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


