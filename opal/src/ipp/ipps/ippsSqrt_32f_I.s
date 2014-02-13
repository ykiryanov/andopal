        .text
        .align  4
        .globl  _ippsSqrt_32f_I


_ippsSqrt_32f_I:
        stmdb   sp!, {r4 - r9, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r6, #0
        mov     r7, #0
        movle   r0, r7
        ldmleia sp!, {r4 - r9, pc}
        ldr     r2, [pc, #0x60]
        ldr     r8, [pc, #0x60]
        ldr     r4, [r2]
LAVX0:
        ldr     r9, [r5]
        mov     r1, r4
        mov     r0, r9
        bl      __gtsf2
        cmp     r0, #0
        ble     LAVX1
        mov     r0, r9
        bl      sqrtf
        str     r0, [r5]
        b       LAVX2
LAVX1:
        mov     r0, r9
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LAVX2
        ldr     r2, [r8]
        mov     r7, #3
        str     r2, [r5]
LAVX2:
        subs    r6, r6, #1
        add     r5, r5, #4
        bne     LAVX0
        mov     r0, r7
        ldmia   sp!, {r4 - r9, pc}
        .long   LAVX__2il0floatpacket.1
        .long   ippConstantOfNAN_32f


        .data
        .align  4


LAVX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


