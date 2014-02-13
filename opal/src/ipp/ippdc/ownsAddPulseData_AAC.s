        .text
        .align  4
        .globl  ownsAddPulseData_AAC


ownsAddPulseData_AAC:
        stmdb   sp!, {r4, r5, lr}
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #0xC]
        mov     r2, r2, lsl #1
        ldrsh   r2, [lr, +r2]
        ldr     lr, [sp, #0x14]
        cmp     r1, #0
        ble     LGHS1
LGHS0:
        ldr     r4, [r3], #4
        add     r2, r2, r4
        cmp     r2, lr
        bge     LGHS2
        ldr     r4, [r0, +r2, lsl #2]
        cmp     r4, #0
        ldrle   r5, [r12]
        suble   r5, r4, r5
        ldrgt   r5, [r12]
        addgt   r5, r4, r5
        subs    r1, r1, #1
        str     r5, [r0, +r2, lsl #2]
        add     r12, r12, #4
        bne     LGHS0
LGHS1:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LGHS2:
        mvn     r0, #0x9F
        ldmia   sp!, {r4, r5, pc}


