        .text
        .align  4
        .globl  _ippsPhase_16s_Sfs


_ippsPhase_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r12, [sp, #0x38]
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        mov     r5, r2
        mov     r8, r3
        beq     LBBA10
        cmp     r7, #0
        beq     LBBA10
        cmp     r5, #0
        beq     LBBA10
        cmp     r8, #1
        blt     LBBA9
        cmp     r12, #0
        mov     r9, #0
        bne     LBBA3
        cmp     r8, #0
        ble     LBBA8
        ldr     r12, [pc, #0x220]
        mov     lr, #0xFE, 12
        orr     lr, lr, #3, 4
        str     lr, [sp, #0x10]
LBBA0:
        ldrsh   r0, [r6], #2
        bl      __floatsisf
        ldrsh   r1, [r7], #2
        mov     r4, r0
        mov     r0, r1
        bl      __floatsisf
        mov     r1, r4
        bl      Arctan2
        mov     r4, r0
        bl      __extendsfdf2
        ldr     r12, [pc, #0x1E8]
        mov     r10, r0
        mov     r11, r1
        ldr     r2, [r12]
        mov     r0, r4
        mov     r1, r2
        bl      __ltsf2
        cmp     r0, #0
        bge     LBBA1
        mov     r0, r10
        mov     r1, r11
        ldr     r3, [sp, #0x10]
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
        b       LBBA2
LBBA1:
        mov     r2, r10
        mov     r3, r11
        ldr     r1, [sp, #0x10]
        mov     r0, #0
        bl      __adddf3
        bl      __truncdfsf2
LBBA2:
        bl      __fixsfsi
        add     r9, r9, #1
        strh    r0, [r5], #2
        cmp     r9, r8
        blt     LBBA0
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBBA3:
        rsb     r0, r12, #0
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r1, #1, 2
        mov     r0, #0
        bl      pow
        bl      __truncdfsf2
        cmp     r8, #0
        mov     r4, r0
        ble     LBBA8
        ldr     lr, [pc, #0x144]
        ldr     r10, [pc, #0x144]
        ldr     r12, [pc, #0x144]
        ldr     lr, [lr]
        mvn     r11, #0xFF
        ldr     r10, [r10]
        bic     r11, r11, #0x7F, 24
        mvn     r0, r11
        str     r0, [sp, #0xC]
        str     r11, [sp, #0x10]
        str     r10, [sp, #8]
        str     lr, [sp, #4]
        str     r8, [sp]
LBBA4:
        ldrsh   r0, [r6], #2
        bl      __floatsidf
        mov     r10, r0
        ldrsh   r0, [r7], #2
        mov     r8, r1
        bl      __floatsidf
        mov     r3, r8
        mov     r2, r10
        bl      atan2
        bl      __truncdfsf2
        mov     r1, r4
        bl      __mulsf3
        mov     r11, r0
        bl      __extendsfdf2
        mov     r8, r1
        ldr     r1, [sp, #4]
        mov     r10, r0
        mov     r0, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LBBA5
        mov     r0, r10
        mov     r1, r8
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
        mov     r8, r0
        b       LBBA6
LBBA5:
        mov     r2, r10
        mov     r3, r8
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        bl      __truncdfsf2
        mov     r8, r0
LBBA6:
        ldr     r1, [sp, #8]
        mov     r0, r8
        bl      __gtsf2
        cmp     r0, #0
        ldrgt   r3, [sp, #0xC]
        strgth  r3, [r5]
        bgt     LBBA7
        ldr     r3, [pc, #0x64]
        mov     r0, r8
        ldr     r1, [r3]
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r3, [sp, #0x10]
        strlth  r3, [r5]
        blt     LBBA7
        mov     r0, r8
        bl      __fixsfsi
        strh    r0, [r5]
LBBA7:
        ldr     r3, [sp]
        add     r9, r9, #1
        add     r5, r5, #2
        cmp     r9, r3
        blt     LBBA4
LBBA8:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBBA9:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBBA10:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LBBA__2il0floatpacket.1
        .long   LBBA__2il0floatpacket.2
        .long   LBBA__2il0floatpacket.3


        .data
        .align  4


LBBA__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBBA__2il0floatpacket.2:
        .byte   0x00,0xFE,0xFF,0x46
LBBA__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0xC7


