        .text
        .align  4
        .globl  _ippsThreshold_LTValGTVal_32s


_ippsThreshold_LTValGTVal_32s:
        stmdb   sp!, {r4, r5, lr}
        ldr     r4, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        beq     LAPN4
        cmp     r1, #0
        beq     LAPN4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     lr, r3
        mvnlt   r0, #0x11
        ldmltia sp!, {r4, r5, pc}
        cmp     r2, #0
        ble     LAPN3
LAPN0:
        ldr     r5, [r0], #4
        cmp     r5, r3
        blt     LAPN1
        cmp     r5, lr
        strle   r5, [r1]
        ble     LAPN2
LAPN1:
        cmp     r5, r3
        movge   r5, r12
        movlt   r5, r4
        str     r5, [r1]
LAPN2:
        subs    r2, r2, #1
        add     r1, r1, #4
        bne     LAPN0
LAPN3:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LAPN4:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


