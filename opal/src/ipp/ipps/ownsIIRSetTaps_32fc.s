        .text
        .align  4
        .globl  ownsIIRSetTaps_32fc


ownsIIRSetTaps_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        str     r1, [sp]
        ldr     r8, [r1, #0xC]
        ldr     r3, [pc, #0x344]
        mov     r9, r0
        add     r2, r9, #8
        str     r2, [sp, #4]
        ldr     r4, [r2, +r8, lsl #3]
        ldr     r5, [r3]
        add     r6, r2, r8, lsl #3
        mov     r1, r4
        mov     r0, r5
        bl      __eqsf2
        cmp     r0, #0
        ldrne   r10, [r6, #4]
        beq     LBPM3
LBPM0:
        mov     r0, r10
        bl      __extendsfdf2
        mov     r6, r0
        mov     r7, r1
        mov     r0, r4
        bl      __extendsfdf2
        eor     r10, r10, #2, 2
        mov     r4, r0
        str     r10, [sp, #0x10]
        mov     r5, r1
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r3, r7
        mov     r1, r7
        mov     r2, r6
        mov     r0, r6
        bl      __muldf3
        mov     r3, r11
        mov     r2, r10
        bl      __adddf3
        mov     r11, r0
        ldr     r0, [sp, #0x10]
        mov     r10, r1
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r10
        bl      __divdf3
        mov     r7, r0
        mov     r6, r1
        mov     r0, r4
        mov     r3, r10
        mov     r1, r5
        mov     r2, r11
        bl      __divdf3
        ldr     r2, [r9]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [r9, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r11
        mov     r0, r10
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r11, [sp]
        ldr     r12, [r11, #4]
        str     r0, [r12]
        ldr     r0, [r9, #4]
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #0x10]
        ldr     r0, [r9]
        mov     r10, r1
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        mov     r3, r10
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r11, [r11, #4]
        cmp     r8, #1
        str     r0, [r11, #4]
        blt     LBPM2
        add     r10, r8, #1
        str     r8, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r11, [sp]
        mov     r12, #1
        mov     lr, #8
        add     r9, r9, #4
        str     lr, [sp, #0xC]
        str     r12, [sp, #0x10]
LBPM1:
        ldr     r0, [r9, #4]
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x18]
        ldr     r0, [r9, #8]
        add     r12, r8, r10, lsl #3
        str     r12, [sp, #0x1C]
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x18]
        mov     r2, r0
        ldr     r0, [sp, #0x14]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x10]
        ldr     r12, [r11, #4]
        str     r0, [r12, +lr, lsl #3]
        add     lr, lr, #1
        str     lr, [sp, #0x10]
        ldr     r0, [r9, #4]
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
        ldr     r0, [r9, #8]!
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [r11, #4]
        ldr     lr, [sp, #0xC]
        add     lr, r12, lr
        str     r0, [lr, #4]
        ldr     r0, [r8, +r10, lsl #3]
        ldr     r12, [sp, #0xC]
        add     r12, r12, #8
        str     r12, [sp, #0xC]
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [sp, #0x1C]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x18]
        mov     r3, r1
        ldr     r1, [sp, #0x14]
        bl      __subdf3
        bl      __truncdfsf2
        ldr     r12, [r11, #4]
        str     r0, [r12, +r10, lsl #3]
        ldr     r0, [r8, +r10, lsl #3]
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r12, [sp, #0x1C]
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [r11, #4]
        ldr     r1, [sp, #8]
        ldr     lr, [sp, #0x10]
        add     r12, r12, r10, lsl #3
        cmp     lr, r1
        str     r0, [r12, #4]
        add     r10, r10, #1
        ble     LBPM1
LBPM2:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBPM3:
        ldr     r10, [r6, #4]
        mov     r0, r5
        mov     r1, r10
        bl      __eqsf2
        cmp     r0, #0
        bne     LBPM0
        mvn     r0, #9
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   LBPM__2il0floatpacket.1


        .data
        .align  4


LBPM__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


