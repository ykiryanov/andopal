        .text
        .align  4
        .globl  _ippsToeplizMatrix_G729E_32f


_ippsToeplizMatrix_G729E_32f:
        stmdb   sp!, {r4 - r10, lr}
        ldr     lr, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r4, [sp, #0x28]
        mov     r8, r0
        mov     r0, r3
        add     r12, r8, #4
        mov     r6, r1
        mov     r5, r2
        add     lr, lr, #4
        mov     r9, #0
        add     r8, r0, #4
LDHB0:
        ldr     r10, [r12, #-4]
        add     r9, r9, #2
        cmp     r9, #0x28
        str     r10, [r8, #-4]
        eor     r10, r10, #2, 2
        str     r10, [lr, #-4]
        ldr     r10, [r12], #8
        str     r10, [r8], #8
        eor     r10, r10, #2, 2
        str     r10, [lr], #8
        blt     LDHB0
        mov     r1, r7
        mov     r2, r4
        bl      ownToeplizMatrix_G729E_32f
        mov     r2, r5
        mov     r1, r6
        mov     r0, r4
        ldmia   sp!, {r4 - r10, lr}
        b       ownTakeSign_G729E_32f


