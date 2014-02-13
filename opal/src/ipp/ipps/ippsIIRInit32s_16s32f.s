        .text
        .align  4
        .globl  _ippsIIRInit32s_16s32f


_ippsIIRInit32s_16s32f:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #8
        ldr     r8, [sp, #0x20]
        mov     r6, r1
        cmp     r6, #0
        mov     r7, r0
        mov     r5, r2
        mov     r4, r3
        beq     LBOP2
        cmp     r7, #0
        beq     LBOP2
        cmp     r8, #0
        beq     LBOP2
        cmp     r5, #1
        blt     LBOP1
        ldr     r12, [pc, #0x74]
        add     lr, r6, #4
        ldr     r0, [lr, +r5, lsl #2]
        ldr     r1, [r12]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBOP0
        mvn     r0, #9
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
LBOP0:
        str     r8, [sp]
        mov     r3, r4
        mov     r2, r5
        mov     r1, r6
        mov     r0, r7
        bl      _ippsIIRInit32f_16s
        cmp     r0, #0
        addne   sp, sp, #8
        ldmneia sp!, {r4 - r8, pc}
        ldr     r7, [r7]
        ldr     r1, [pc, #0x28]
        mov     r0, #0
        str     r1, [r7]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
LBOP1:
        mvn     r0, #0x18
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
LBOP2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r8, pc}
        .long   LBOP__2il0floatpacket.1
        .long   0x49493039


        .data
        .align  4


LBOP__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


