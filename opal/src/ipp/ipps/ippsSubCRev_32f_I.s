        .text
        .align  4
        .globl  _ippsSubCRev_32f_I


_ippsSubCRev_32f_I:
        stmdb   sp!, {r4 - r9, lr}
        mov     r5, r1
        cmp     r5, #0
        mov     r4, r0
        mov     r6, r2
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r6, #6
        mov     r9, #0
        blt     LAUW1
        sub     r8, r6, #6
        add     r7, r5, #4
LAUW0:
        ldr     r1, [r7, #-4]
        mov     r0, r4
        add     r9, r9, #5
        bl      __subsf3
        ldr     r1, [r7]
        str     r0, [r7, #-4]
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [r7, #4]
        str     r0, [r7]
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [r7, #8]
        str     r0, [r7, #4]
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [r7, #0xC]
        str     r0, [r7, #8]
        mov     r0, r4
        bl      __subsf3
        str     r0, [r7, #0xC]
        cmp     r9, r8
        add     r7, r7, #0x14
        ble     LAUW0
LAUW1:
        add     r5, r5, r9, lsl #2
LAUW2:
        ldr     r1, [r5]
        mov     r0, r4
        add     r9, r9, #1
        bl      __subsf3
        str     r0, [r5], #4
        cmp     r9, r6
        blt     LAUW2
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}


