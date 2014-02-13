        .text
        .align  4
        .globl  _ippsSqr_32fc


_ippsSqr_32fc:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r0, #0
        mov     r5, r2
        beq     LAWO2
        cmp     r1, #0
        beq     LAWO2
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r5, #0
        ble     LAWO1
        ldr     r3, [pc, #0x68]
        sub     r7, r0, #4
        sub     r6, r1, #4
        ldr     r4, [r3]
LAWO0:
        ldr     r10, [r7, #8]
        ldr     r9, [r7, #4]
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        mov     r1, r8
        bl      __mulsf3
        str     r0, [r6, #4]
        ldr     r0, [r7, #4]
        ldr     r1, [r7, #8]!
        bl      __mulsf3
        mov     r1, r4
        bl      __mulsf3
        str     r0, [r6, #8]!
        subs    r5, r5, #1
        bne     LAWO0
LAWO1:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAWO2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}
        .long   LAWO__2il0floatpacket.1


        .data
        .align  4


LAWO__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x40


