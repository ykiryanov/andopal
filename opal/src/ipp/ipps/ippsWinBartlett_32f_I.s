        .text
        .align  4
        .globl  _ippsWinBartlett_32f_I


_ippsWinBartlett_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r1
        beq     LAMZ6
        cmp     r4, #3
        blt     LAMZ4
        sub     r5, r4, #1
        mov     r0, r5
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        ldr     r2, [pc, #0x2F0]
        cmp     r4, #3
        mov     r7, r0
        ldr     r3, [r2]
        add     r12, r8, r4, lsl #2
        mov     r6, r1
        sub     r2, r12, #4
        beq     LAMZ5
        cmp     r5, #0
        str     r3, [r12, #-4]
        mov     r5, #0
        mov     r12, r5
        mov     r10, #1
        movlt   r12, r10
        add     r12, r4, r12
        sub     r12, r12, #1
        str     r3, [r8]
        mov     r11, r12, asr #1
        add     r9, r8, #4
        cmp     r11, #1
        sub     r8, r2, #4
        movle   r4, r5
        ble     LAMZ2
        sub     r2, r11, #1
        cmp     r2, #5
        movlt   r4, r5
        blt     LAMZ1
        mov     r4, r5
        sub     r12, r11, #5
        str     r12, [sp, #4]
        str     r11, [sp]
LAMZ0:
        mov     r3, r5
        mov     r2, r4
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [r9]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9]
        ldr     r0, [r8]
        add     r10, r10, #4
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
        mov     r0, r7
        mov     r1, r6
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        mov     r5, r1
        ldr     r1, [r9, #4]
        mov     r4, r0
        mov     r0, r1
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #4]
        ldr     r0, [r8, #-4]
        sub     r12, r8, #4
        sub     r12, r12, #4
        sub     r11, r12, #4
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #-4]
        mov     r3, r5
        mov     r0, r7
        mov     r1, r6
        mov     r2, r4
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [r9, #8]
        mov     r5, r1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #8]
        ldr     r0, [r8, #-8]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #-8]
        mov     r2, r4
        mov     r3, r5
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [r9, #0xC]
        mov     r5, r1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #0xC]
        ldr     r0, [r8, #-0xC]
        add     r9, r9, #0x10
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp, #4]
        str     r0, [r8, #-0xC]
        cmp     r10, r12
        sub     r8, r11, #4
        ble     LAMZ0
        ldr     r11, [sp]
LAMZ1:
        mov     r0, r7
        mov     r1, r6
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [r9]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9], #4
        ldr     r0, [r8]
        add     r10, r10, #1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8], #-4
        cmp     r10, r11
        blt     LAMZ1
LAMZ2:
        cmp     r9, r8
        beq     LAMZ3
        mov     r2, r4
        mov     r3, r5
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r2, [r9]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9]
        ldr     r0, [r8]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
LAMZ3:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAMZ4:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAMZ5:
        str     r3, [r8]
        mov     r0, #0
        str     r3, [r12, #-4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAMZ6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LAMZ__2il0floatpacket.1


        .data
        .align  4


LAMZ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


