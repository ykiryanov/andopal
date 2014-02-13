        .text
        .align  4
        .globl  _ippsIIRInitAlloc32s_16s32f


_ippsIIRInitAlloc32s_16s32f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r1
        cmp     r6, #0
        mov     r7, r0
        mov     r5, r2
        mov     r4, r3
        beq     LBOH0
        cmp     r7, #0
        beq     LBOH0
        cmp     r5, #1
        mvnlt   r0, #0x18
        ldmltia sp!, {r4 - r7, pc}
        ldr     r12, [pc, #0x50]
        add     lr, r6, #4
        ldr     r0, [lr, +r5, lsl #2]
        ldr     r1, [r12]
        bl      __eqsf2
        cmp     r0, #0
        mvneq   r0, #9
        ldmeqia sp!, {r4 - r7, pc}
        mov     r3, r4
        mov     r2, r5
        mov     r1, r6
        mov     r0, r7
        bl      _ippsIIRInitAlloc32f_16s
        cmp     r0, #0
        ldmneia sp!, {r4 - r7, pc}
        ldr     r7, [r7]
        ldr     r1, [pc, #0x14]
        mov     r0, #0
        str     r1, [r7]
        ldmia   sp!, {r4 - r7, pc}
LBOH0:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}
        .long   LBOH__2il0floatpacket.1
        .long   0x49493039


        .data
        .align  4


LBOH__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


