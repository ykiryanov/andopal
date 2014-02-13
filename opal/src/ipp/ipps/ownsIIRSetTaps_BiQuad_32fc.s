        .text
        .align  4
        .globl  ownsIIRSetTaps_BiQuad_32fc


ownsIIRSetTaps_BiQuad_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r5, r1
        ldr     r2, [r5, #0x18]
        mov     r6, r0
        cmp     r2, #0
        ble     LBPK3
        ldr     r12, [pc, #0x43C]
        mov     r3, #0
        mov     r9, r3
        ldr     r12, [r12]
        mov     r10, #8
        mov     r4, #0x10
        mov     lr, #0x18
        mov     r11, #0x20
        sub     r8, r6, #0x14
        add     r7, r6, #4
        str     r11, [sp, #0x1C]
        str     lr, [sp, #0x14]
        str     r4, [sp, #0xC]
        str     r10, [sp, #0x18]
        str     r3, [sp, #0x10]
        str     r12, [sp, #0x24]
        str     r2, [sp, #0x20]
LBPK0:
        ldr     r1, [r8, #0x2C]
        ldr     r0, [sp, #0x24]
        str     r1, [sp]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBPK5
LBPK1:
        ldr     r1, [r7, #-4]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #4]
        bl      __eqsf2
        cmp     r0, #0
        ldrne   r2, [r7]
        strne   r2, [sp, #8]
        beq     LBPK4
LBPK2:
        ldr     r0, [sp]
        bl      __extendsfdf2
        ldr     r10, [r8, #0x30]!
        str     r0, [sp, #0x28]
        mov     r0, r10
        mov     r11, r1
        bl      __extendsfdf2
        ldr     r2, [sp, #0x28]
        str     r0, [sp, #0x2C]
        mov     r0, r2
        mov     r4, r1
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        str     r0, [sp, #0x28]
        mov     r11, r1
        mov     r0, r2
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        mov     r3, r11
        bl      __adddf3
        bl      __truncdfsf2
        mov     r11, r0
        eor     r0, r10, #2, 2
        mov     r1, r11
        bl      __divsf3
        mov     r4, r0
        ldr     r0, [sp]
        mov     r1, r11
        bl      __divsf3
        ldr     r1, [sp, #4]
        mov     r11, r0
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #8]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [r5, #4]
        add     r3, r6, #8
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x10]
        mov     r1, r11
        str     r0, [r2, +r3]
        ldr     r0, [r7]
        ldr     r2, [sp, #0x2C]
        add     r2, r9, r2
        str     r2, [sp, #0x28]
        add     r2, r6, #0x10
        str     r2, [sp, #8]
        bl      __mulsf3
        ldr     r3, [sp, #8]
        ldr     r2, [r7, #-4]
        mov     r10, r0
        mov     r1, r4
        add     r3, r9, r3
        str     r3, [sp, #4]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r5, #4]
        add     r3, r6, #0x20
        str     r3, [sp]
        ldr     r3, [sp, #0x10]
        mov     r1, r11
        add     r3, r2, r3
        str     r0, [r3, #4]
        ldr     r2, [sp, #0x2C]
        add     r10, r6, #0x28
        add     r7, r7, #0x30
        ldr     r0, [r2, +r9]
        ldr     r2, [sp]
        add     r2, r9, r2
        str     r2, [sp, #0x30]
        bl      __mulsf3
        ldr     r2, [sp, #0x28]
        mov     r1, r4
        ldr     r2, [r2, #4]
        str     r0, [sp, #0x34]
        add     r3, r9, r10
        str     r3, [sp, #0x38]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x34]
        bl      __subsf3
        ldr     r2, [r5, #4]
        ldr     r3, [sp, #0x18]
        mov     r1, r11
        str     r0, [r2, +r3]
        ldr     r2, [sp, #0x28]
        ldr     r0, [r2, #4]
        ldr     r2, [sp, #0x10]
        add     r2, r2, #0x28
        str     r2, [sp, #0x10]
        bl      __mulsf3
        ldr     r2, [sp, #0x2C]
        mov     r1, r4
        ldr     r2, [r2, +r9]
        str     r0, [sp, #0x34]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r2, [r5, #4]
        ldr     r3, [sp, #0x18]
        mov     r1, r11
        add     r3, r2, r3
        str     r0, [r3, #4]
        ldr     r2, [sp, #8]
        ldr     r0, [r2, +r9]
        ldr     r2, [sp, #0x18]
        add     r2, r2, #0x28
        str     r2, [sp, #0x18]
        bl      __mulsf3
        ldr     r2, [sp, #4]
        mov     r1, r4
        ldr     r2, [r2, #4]
        str     r0, [sp, #0x34]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x34]
        bl      __subsf3
        ldr     r2, [r5, #4]
        ldr     r3, [sp, #0xC]
        mov     r1, r11
        str     r0, [r2, +r3]
        ldr     r2, [sp, #4]
        ldr     r0, [r2, #4]
        bl      __mulsf3
        ldr     r2, [sp, #8]
        mov     r1, r4
        ldr     r2, [r2, +r9]
        str     r0, [sp, #0x34]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r2, [r5, #4]
        ldr     r3, [sp, #0xC]
        mov     r1, r11
        add     r3, r2, r3
        str     r0, [r3, #4]
        ldr     r2, [sp]
        ldr     r0, [r2, +r9]
        ldr     r2, [sp, #0xC]
        add     r2, r2, #0x28
        str     r2, [sp, #0xC]
        bl      __mulsf3
        ldr     r2, [sp, #0x30]
        mov     r1, r4
        ldr     r2, [r2, #4]
        str     r0, [sp, #0x34]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x34]
        bl      __subsf3
        ldr     r2, [r5, #4]
        ldr     r3, [sp, #0x14]
        mov     r1, r11
        str     r0, [r2, +r3]
        ldr     r2, [sp, #0x30]
        ldr     r0, [r2, #4]
        bl      __mulsf3
        ldr     r2, [sp]
        mov     r1, r4
        ldr     r2, [r2, +r9]
        str     r0, [sp, #0x34]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r2, [r5, #4]
        ldr     r3, [sp, #0x14]
        mov     r1, r11
        add     r3, r2, r3
        str     r0, [r3, #4]
        ldr     r0, [r10, +r9]
        ldr     r2, [sp, #0x14]
        add     r2, r2, #0x28
        str     r2, [sp, #0x14]
        bl      __mulsf3
        ldr     r2, [sp, #0x38]
        str     r0, [sp, #0x34]
        ldr     r0, [r2, #4]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x34]
        bl      __subsf3
        ldr     r2, [r5, #4]
        mov     r1, r11
        ldr     r11, [sp, #0x1C]
        str     r0, [r2, +r11]
        ldr     r2, [sp, #0x38]
        ldr     r0, [r2, #4]
        bl      __mulsf3
        ldr     r2, [r10, +r9]
        mov     r10, r0
        mov     r1, r4
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r3, [r5, #4]
        ldr     r2, [sp, #0x20]
        add     r9, r9, #0x30
        add     r3, r3, r11
        subs    r2, r2, #1
        str     r2, [sp, #0x20]
        str     r0, [r3, #4]
        add     r11, r11, #0x28
        str     r11, [sp, #0x1C]
        bne     LBPK0
LBPK3:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBPK4:
        ldr     r1, [r7]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #8]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBPK2
        mvn     r0, #9
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LBPK5:
        ldr     r0, [sp, #0x24]
        ldr     r1, [r8, #0x30]
        bl      __eqsf2
        cmp     r0, #0
        bne     LBPK1
        mvn     r0, #9
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   LBPK__2il0floatpacket.1


        .data
        .align  4


LBPK__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


