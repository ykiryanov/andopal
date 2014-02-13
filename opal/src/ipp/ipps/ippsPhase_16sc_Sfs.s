        .text
        .align  4
        .globl  _ippsPhase_16sc_Sfs


_ippsPhase_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r7, r2
        beq     LBAY10
        cmp     r5, #0
        beq     LBAY10
        cmp     r7, #1
        blt     LBAY9
        cmp     r3, #0
        mov     r8, #0
        bne     LBAY3
        cmp     r7, #0
        ble     LBAY8
        ldr     r12, [pc, #0x218]
        mov     r3, #0xFE, 12
        orr     r11, r3, #3, 4
LBAY0:
        ldrsh   r0, [r6]
        bl      __floatsisf
        ldrsh   r1, [r6, #2]
        mov     r4, r0
        mov     r0, r1
        bl      __floatsisf
        mov     r1, r4
        bl      Arctan2
        mov     r4, r0
        bl      __extendsfdf2
        ldr     r12, [pc, #0x1E4]
        mov     r9, r0
        mov     r10, r1
        ldr     r2, [r12]
        mov     r0, r4
        mov     r1, r2
        bl      __ltsf2
        cmp     r0, #0
        bge     LBAY1
        mov     r0, r9
        mov     r1, r10
        mov     r3, r11
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
        b       LBAY2
LBAY1:
        mov     r1, r11
        mov     r2, r9
        mov     r3, r10
        mov     r0, #0
        bl      __adddf3
        bl      __truncdfsf2
LBAY2:
        bl      __fixsfsi
        add     r8, r8, #1
        strh    r0, [r5], #2
        cmp     r8, r7
        add     r6, r6, #4
        blt     LBAY0
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBAY3:
        rsb     r0, r3, #0
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r1, #1, 2
        mov     r0, #0
        bl      pow
        bl      __truncdfsf2
        cmp     r7, #0
        ble     LBAY8
        ldr     lr, [pc, #0x144]
        ldr     r12, [pc, #0x13C]
        ldr     r3, [pc, #0x140]
        ldr     r4, [lr]
        mvn     r9, #0xFF
        ldr     r12, [r12]
        bic     lr, r9, #0x7F, 24
        mvn     r9, lr
        str     r9, [sp, #8]
        str     lr, [sp, #0xC]
        str     r12, [sp, #4]
        str     r0, [sp]
LBAY4:
        ldrsh   r0, [r6]
        bl      __floatsidf
        mov     r10, r0
        ldrsh   r0, [r6, #2]
        mov     r9, r1
        bl      __floatsidf
        mov     r3, r9
        mov     r2, r10
        bl      atan2
        bl      __truncdfsf2
        ldr     r1, [sp]
        bl      __mulsf3
        mov     r11, r0
        bl      __extendsfdf2
        mov     r9, r1
        ldr     r1, [sp, #4]
        mov     r10, r0
        mov     r0, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LBAY5
        mov     r0, r10
        mov     r1, r9
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
        mov     r9, r0
        b       LBAY6
LBAY5:
        mov     r2, r10
        mov     r3, r9
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        bl      __truncdfsf2
        mov     r9, r0
LBAY6:
        mov     r1, r4
        mov     r0, r9
        bl      __gtsf2
        cmp     r0, #0
        ldrgt   r3, [sp, #8]
        strgth  r3, [r5]
        bgt     LBAY7
        ldr     r3, [pc, #0x64]
        mov     r0, r9
        ldr     r1, [r3]
        bl      __ltsf2
        cmp     r0, #0
        ldrlt   r3, [sp, #0xC]
        strlth  r3, [r5]
        blt     LBAY7
        mov     r0, r9
        bl      __fixsfsi
        strh    r0, [r5]
LBAY7:
        add     r8, r8, #1
        cmp     r8, r7
        add     r6, r6, #4
        add     r5, r5, #2
        blt     LBAY4
LBAY8:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBAY9:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBAY10:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LBAY__2il0floatpacket.1
        .long   LBAY__2il0floatpacket.2
        .long   LBAY__2il0floatpacket.3


        .data
        .align  4


LBAY__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBAY__2il0floatpacket.2:
        .byte   0x00,0xFE,0xFF,0x46
LBAY__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0xC7


