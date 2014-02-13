        .text
        .align  4
        .globl  _ippsWinBartlett_32fc_I


_ippsWinBartlett_32fc_I:
        stmdb   sp!, {r4 - r10, lr}
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r7, #3
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r10, pc}
        sub     r4, r7, #1
        mov     r0, r4
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        ldr     r2, [pc, #0x1C0]
        mov     r6, r0
        mov     r5, r1
        ldr     r12, [r2]
        add     lr, r8, r7, lsl #3
        cmp     r7, #3
        sub     r2, lr, #8
        str     r12, [r8, #4]
        str     r12, [r8]
        beq     LAMX3
        cmp     r4, #0
        mov     r4, #0
        mov     r9, r4
        mov     r10, #1
        movlt   r9, r10
        add     r9, r7, r9
        sub     r7, r9, #1
        str     r12, [lr, #-4]
        str     r12, [lr, #-8]
        mov     r12, r7, asr #1
        cmp     r12, #1
        add     r8, r8, #8
        sub     r7, r2, #8
        movle   r9, r4
        ble     LAMX1
        sub     r10, r12, #1
        mov     r9, r4
LAMX0:
        mov     r2, r9
        mov     r0, r6
        mov     r1, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r8]
        mov     r9, r0
        mov     r4, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [r8, #4]
        str     r0, [r8]
        mov     r0, r1
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        ldr     r0, [r7]
        add     r8, r8, #8
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7]
        ldr     r0, [r7, #4]
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #4]
        subs    r10, r10, #1
        sub     r7, r7, #8
        bne     LAMX0
LAMX1:
        cmp     r8, r7
        beq     LAMX2
        mov     r0, r6
        mov     r1, r5
        mov     r2, r9
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r8]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [r8, #4]
        str     r0, [r8]
        mov     r0, r1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        ldr     r0, [r7]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r1, [r7, #4]
        str     r0, [r7]
        mov     r0, r1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #4]
LAMX2:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAMX3:
        mov     r0, #0
        str     r12, [lr, #-4]
        str     r12, [lr, #-8]
        ldmia   sp!, {r4 - r10, pc}
        .long   LAMX__2il0floatpacket.1


        .data
        .align  4


LAMX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


