        .text
        .align  4
        .globl  _ippsMax_32s


_ippsMax_32s:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LBHA3
        cmp     r2, #0
        beq     LBHA3
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r1, #6
        mov     r12, #0
        mov     r3, #2, 2
        blt     LBHA1
        sub     r4, r1, #6
        add     lr, r0, #4
LBHA0:
        ldr     r7, [lr, #-4]
        ldr     r6, [lr]
        ldr     r5, [lr, #4]
        cmp     r7, r3
        movgt   r3, r7
        cmp     r6, r3
        movgt   r3, r6
        ldr     r6, [lr, #8]
        cmp     r5, r3
        movgt   r3, r5
        ldr     r5, [lr, #0xC]
        cmp     r6, r3
        movgt   r3, r6
        add     lr, lr, #0x14
        cmp     r5, r3
        movgt   r3, r5
        add     r12, r12, #5
        cmp     r12, r4
        ble     LBHA0
LBHA1:
        add     r0, r0, r12, lsl #2
LBHA2:
        ldr     lr, [r0], #4
        add     r12, r12, #1
        cmp     lr, r3
        movgt   r3, lr
        cmp     r12, r1
        blt     LBHA2
        mov     r0, #0
        str     r3, [r2]
        ldmia   sp!, {r4 - r7, pc}
LBHA3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


