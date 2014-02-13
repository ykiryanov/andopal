        .text
        .align  4
        .globl  _ippsThreshold_LTValGTVal_16s


_ippsThreshold_LTValGTVal_16s:
        stmdb   sp!, {r4, r5, lr}
        ldr     r4, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        beq     LAPR4
        cmp     r1, #0
        beq     LAPR4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     lr, r3
        mvnlt   r0, #0x11
        ldmltia sp!, {r4, r5, pc}
        cmp     r2, #0
        ble     LAPR3
LAPR0:
        ldrsh   r5, [r0], #2
        cmp     r5, r3
        blt     LAPR1
        cmp     r5, lr
        strleh  r5, [r1]
        ble     LAPR2
LAPR1:
        cmp     r5, r3
        movge   r5, r12
        movlt   r5, r4
        strh    r5, [r1]
LAPR2:
        subs    r2, r2, #1
        add     r1, r1, #2
        bne     LAPR0
LAPR3:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LAPR4:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


