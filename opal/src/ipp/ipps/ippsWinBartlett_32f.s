        .text
        .align  4
        .globl  _ippsWinBartlett_32f


_ippsWinBartlett_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r4, r2
        beq     LANA6
        cmp     r7, #0
        beq     LANA6
        cmp     r4, #3
        blt     LANA4
        sub     r5, r4, #1
        mov     r0, r5
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        ldr     r3, [pc, #0x30C]
        add     r12, r8, r4, lsl #2
        cmp     r4, #3
        ldr     r3, [r3]
        add     lr, r7, r4, lsl #2
        sub     r9, r12, #8
        mov     r6, r0
        sub     r12, lr, #4
        add     r11, r8, #4
        beq     LANA7
        cmp     r5, #0
        str     r3, [lr, #-4]
        mov     r5, #0
        mov     lr, r5
        mov     r10, #1
        movlt   lr, r10
        add     lr, r4, lr
        sub     r2, lr, #1
        str     r3, [r7], #4
        mov     lr, r2, asr #1
        cmp     lr, #1
        sub     r8, r12, #4
        movle   r4, r5
        ble     LANA3
        sub     r2, lr, #1
        cmp     r2, #4
        movlt   r4, r5
        blt     LANA1
        mov     r4, r5
        sub     r12, lr, #4
        str     r10, [sp, #0xC]
        str     r12, [sp, #8]
        str     lr, [sp]
        mov     r10, r1
LANA0:
        ldr     r12, [sp, #0xC]
        mov     r3, r5
        mov     r2, r4
        add     r12, r12, #3
        str     r12, [sp, #0xC]
        mov     r0, r6
        mov     r1, r10
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [r11]
        sub     r12, r9, #4
        str     r12, [sp, #0x10]
        sub     r12, r8, #4
        str     r12, [sp, #0x14]
        mov     r4, r1
        bl      __extendsfdf2
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7]
        ldr     r12, [sp, #0x10]
        ldr     r0, [r9]
        sub     r12, r12, #4
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        sub     r12, r12, #4
        str     r12, [sp, #0x14]
        bl      __extendsfdf2
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
        mov     r2, r5
        mov     r0, r6
        mov     r1, r10
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r11, #4]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #4]
        ldr     r0, [r9, #-4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #-4]
        mov     r0, r6
        mov     r1, r10
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [r11, #8]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7, #8]
        ldr     r0, [r9, #-8]
        ldr     r12, [sp, #0x10]
        add     r11, r11, #0xC
        add     r7, r7, #0xC
        sub     r9, r12, #4
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #-8]
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #8]
        cmp     r12, lr
        ldr     r12, [sp, #0x14]
        sub     r8, r12, #4
        ble     LANA0
        mov     r1, r10
        ldr     lr, [sp]
        ldr     r10, [sp, #0xC]
LANA1:
        str     lr, [sp]
        str     r1, [sp, #4]
LANA2:
        mov     r0, r6
        ldr     r1, [sp, #4]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [r11], #4
        mov     r5, r1
        add     r10, r10, #1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7], #4
        ldr     r0, [r9], #-4
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8], #-4
        ldr     r12, [sp]
        cmp     r10, r12
        blt     LANA2
        ldr     r1, [sp, #4]
LANA3:
        cmp     r7, r8
        beq     LANA5
        mov     r2, r4
        mov     r3, r5
        mov     r0, r6
        bl      __adddf3
        ldr     r11, [r11]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r11
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7]
        ldr     r0, [r9]
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LANA4:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LANA5:
        ldr     r11, [r11]
        str     r11, [r7]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LANA6:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LANA7:
        str     r3, [r7]
        ldr     r8, [r8, #4]
        mov     r0, #0
        str     r8, [r7, #4]
        str     r3, [lr, #-4]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LANA__2il0floatpacket.1


        .data
        .align  4


LANA__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


