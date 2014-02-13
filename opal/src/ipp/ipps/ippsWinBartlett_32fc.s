        .text
        .align  4
        .globl  _ippsWinBartlett_32fc


_ippsWinBartlett_32fc:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r1
        mov     r7, r2
        beq     LAMY4
        cmp     r4, #0
        beq     LAMY4
        cmp     r7, #3
        blt     LAMY2
        sub     r5, r7, #1
        mov     r0, r5
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        ldr     r3, [pc, #0x1FC]
        mov     r6, r0
        ldr     r12, [r3]
        add     r3, r8, r7, lsl #3
        add     lr, r4, r7, lsl #3
        cmp     r7, #3
        sub     r10, r3, #0x10
        str     r12, [r4, #4]
        str     r12, [r4]
        add     r11, r8, #8
        sub     r0, lr, #8
        beq     LAMY5
        cmp     r5, #0
        str     r12, [lr, #-4]
        str     r12, [lr, #-8]
        mov     r5, #0
        mov     r12, r5
        mov     lr, #1
        movlt   r12, lr
        add     r12, r7, r12
        sub     r2, r12, #1
        add     r9, r4, #8
        mov     r2, r2, asr #1
        cmp     r2, #1
        sub     r8, r0, #8
        movle   r4, r5
        ble     LAMY1
        sub     r7, r2, #1
        mov     r4, r5
        str     r1, [sp]
LAMY0:
        mov     r2, r4
        mov     r3, r5
        mov     r0, r6
        ldr     r1, [sp]
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [r11]
        mov     r5, r1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9]
        ldr     r0, [r11, #4]
        add     r11, r11, #8
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #4]
        ldr     r0, [r10]
        add     r9, r9, #8
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
        ldr     r0, [r10, #4]
        sub     r10, r10, #8
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        subs    r7, r7, #1
        sub     r8, r8, #8
        bne     LAMY0
        ldr     r1, [sp]
LAMY1:
        cmp     r9, r8
        beq     LAMY3
        mov     r2, r4
        mov     r3, r5
        mov     r0, r6
        bl      __adddf3
        ldr     r2, [r11]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9]
        ldr     r0, [r11, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #4]
        ldr     r0, [r10]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
        ldr     r0, [r10, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAMY2:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LAMY3:
        ldr     r0, [r11]
        str     r0, [r9]
        ldr     r11, [r11, #4]
        str     r11, [r9, #4]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAMY4:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LAMY5:
        ldr     r2, [r8, #8]
        mov     r0, #0
        str     r2, [r4, #8]
        ldr     r8, [r8, #0xC]
        str     r8, [r4, #0xC]
        str     r12, [lr, #-4]
        str     r12, [lr, #-8]
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   LAMY__2il0floatpacket.1


        .data
        .align  4


LAMY__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


