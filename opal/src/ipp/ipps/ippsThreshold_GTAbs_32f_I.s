        .text
        .align  4
        .globl  _ippsThreshold_GTAbs_32f_I


_ippsThreshold_GTAbs_32f_I:
        stmdb   sp!, {r4 - r10, lr}
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r4, r2
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r9, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        ldr     r3, [pc, #0x84]
        mov     r0, r4
        ldr     r5, [r3]
        mov     r1, r5
        bl      __ltsf2
        cmp     r0, #0
        mvnlt   r0, #0x12
        ldmltia sp!, {r4 - r10, pc}
        cmp     r9, #0
        ble     LARE2
        mov     r0, r4
        bl      __extendsfdf2
        mov     r7, r0
        mov     r6, r1
LARE0:
        ldr     r8, [r10]
        mov     r0, r8
        bl      __extendsfdf2
        bic     r1, r1, #2, 2
        mov     r2, r7
        mov     r3, r6
        bl      __gtdf2
        cmp     r0, #0
        ble     LARE1
        mov     r0, r8
        mov     r1, r5
        bl      __gesf2
        cmp     r0, #0
        eorlt   r12, r4, #2, 2
        movge   r12, r4
        str     r12, [r10]
LARE1:
        subs    r9, r9, #1
        add     r10, r10, #4
        bne     LARE0
LARE2:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
        .long   LARE__2il0floatpacket.1


        .data
        .align  4


LARE__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


