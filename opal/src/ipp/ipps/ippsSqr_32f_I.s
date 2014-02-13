        .text
        .align  4
        .globl  _ippsSqr_32f_I


_ippsSqr_32f_I:
        stmdb   sp!, {r4 - r10, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r4, #4
        mov     r6, #0
        blt     LAWP1
        mov     r10, #4
        add     r9, r5, #4
        add     r8, r5, #8
        add     r7, r5, #0xC
LAWP0:
        ldr     r1, [r5, +r6, lsl #2]
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r5, +r6, lsl #2]
        ldr     r1, [r9, +r6, lsl #2]
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r9, +r6, lsl #2]
        ldr     r1, [r8, +r6, lsl #2]
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r8, +r6, lsl #2]
        ldr     r1, [r7, +r6, lsl #2]
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r7, +r6, lsl #2]
        mov     r6, r10
        add     r10, r10, #4
        cmp     r4, r10
        bge     LAWP0
LAWP1:
        cmp     r6, r4
        bge     LAWP5
        sub     r2, r4, r6
        cmp     r2, #6
        blt     LAWP3
        mov     r2, r6, lsl #2
        add     r2, r2, #4
        add     r7, r2, r5
        sub     r8, r4, #6
LAWP2:
        ldr     r0, [r7, #-4]
        add     r6, r6, #5
        mov     r1, r0
        bl      __mulsf3
        ldr     r1, [r7]
        str     r0, [r7, #-4]
        mov     r0, r1
        bl      __mulsf3
        ldr     r1, [r7, #4]
        str     r0, [r7]
        mov     r0, r1
        bl      __mulsf3
        ldr     r1, [r7, #8]
        str     r0, [r7, #4]
        mov     r0, r1
        bl      __mulsf3
        ldr     r1, [r7, #0xC]
        str     r0, [r7, #8]
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r7, #0xC]
        cmp     r6, r8
        add     r7, r7, #0x14
        ble     LAWP2
LAWP3:
        add     r5, r5, r6, lsl #2
LAWP4:
        ldr     r1, [r5]
        add     r6, r6, #1
        mov     r0, r1
        bl      __mulsf3
        str     r0, [r5], #4
        cmp     r6, r4
        blt     LAWP4
LAWP5:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}


