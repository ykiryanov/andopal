        .text
        .align  4
        .globl  _ippsNorm_Inf_32fc32f


_ippsNorm_Inf_32fc32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        cmp     r0, #0
        mov     r10, r1
        mov     r9, r2
        beq     LBBJ3
        cmp     r9, #0
        beq     LBBJ3
        cmp     r10, #0
        ble     LBBJ4
        ldr     r12, [pc, #0x1E8]
        bic     r3, r10, #1
        cmp     r3, #0
        ldr     r5, [r12]
        mov     r4, r5
        ble     LBBJ1
        mov     r8, #0
        add     r7, r0, #0xC
        add     r6, r0, #4
        str     r3, [sp, #0xC]
        str     r9, [sp, #8]
        str     r10, [sp, #4]
        str     r0, [sp]
LBBJ0:
        ldr     r0, [r6]
        add     r8, r8, #2
        bl      __extendsfdf2
        ldr     r2, [r6, #-4]
        mov     r10, r0
        mov     r9, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        str     r0, [sp, #0x10]
        mov     r11, r1
        mov     r1, r9
        mov     r3, r9
        mov     r0, r10
        mov     r2, r10
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        ldr     r1, [r7]
        mov     r9, r0
        add     r6, r6, #0x10
        mov     r0, r1
        bl      __extendsfdf2
        mov     r10, r0
        ldr     r0, [r7, #-4]
        mov     r11, r1
        add     r7, r7, #0x10
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        mov     r0, r10
        mov     r2, r10
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        mov     r10, r0
        mov     r1, r4
        mov     r0, r9
        bl      __gtsf2
        cmp     r0, #0
        mov     r1, r5
        mov     r0, r10
        movgt   r4, r9
        bl      __gtsf2
        ldr     r2, [sp, #0xC]
        cmp     r0, #0
        movgt   r5, r10
        cmp     r8, r2
        blt     LBBJ0
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r0, [sp]
LBBJ1:
        tst     r10, #1
        beq     LBBJ2
        sub     r8, r0, #8
        add     r3, r8, r10, lsl #3
        ldr     r0, [r3, #4]
        bl      __extendsfdf2
        ldr     r10, [r8, +r10, lsl #3]
        mov     r7, r0
        mov     r6, r1
        mov     r0, r10
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r10, r1
        mov     r8, r0
        mov     r3, r6
        mov     r1, r6
        mov     r2, r7
        mov     r0, r7
        bl      __muldf3
        mov     r2, r8
        mov     r3, r10
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        mov     r6, r0
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        movgt   r4, r6
LBBJ2:
        mov     r0, r4
        mov     r1, r5
        bl      __gtsf2
        cmp     r0, #0
        movgt   r5, r4
        mov     r0, #0
        str     r5, [r9]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBBJ3:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBBJ4:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LBBJ__2il0floatpacket.1


        .data
        .align  4


LBBJ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


