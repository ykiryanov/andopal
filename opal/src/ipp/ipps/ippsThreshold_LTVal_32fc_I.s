        .text
        .align  4
        .globl  _ippsThreshold_LTVal_32fc_I


_ippsThreshold_LTVal_32fc_I:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #4
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r4, r2
        beq     LAPC5
        cmp     r7, #0
        ble     LAPC4
        ldr     r3, [pc, #0xE4]
        mov     r0, r4
        ldr     r1, [r3]
        bl      __ltsf2
        cmp     r0, #0
        blt     LAPC3
        mov     r0, r4
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        cmp     r7, #0
        mov     r6, r1
        ble     LAPC2
        str     r0, [r11, #-0x2C]
LAPC0:
        ldr     r0, [r8]
        bl      __extendsfdf2
        ldr     r2, [r8, #4]
        mov     r9, r0
        mov     r10, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r5, r0
        mov     r4, r1
        mov     r0, r9
        mov     r1, r10
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r5
        mov     r1, r4
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r11, #-0x2C]
        mov     r3, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LAPC1
        ldr     r2, [r11]
        ldr     r12, [r11, #4]
        str     r2, [r8]
        str     r12, [r8, #4]
LAPC1:
        subs    r7, r7, #1
        add     r8, r8, #8
        bne     LAPC0
LAPC2:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LAPC3:
        mvn     r0, #0x12
        ldmdb   r11, {r4 - r11, sp, pc}
LAPC4:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
LAPC5:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}
        .long   LAPC__2il0floatpacket.1


        .data
        .align  4


LAPC__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


