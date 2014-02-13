        .text
        .align  4
        .globl  _ippsThreshold_LTInv_32fc_I


_ippsThreshold_LTInv_32fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r0
        cmp     r4, #0
        mov     r11, r1
        mov     r6, r2
        beq     LBML11
        cmp     r11, #0
        ble     LBML12
        ldr     r3, [pc, #0x324]
        mov     r0, r6
        ldr     r10, [r3]
        mov     r1, r10
        bl      __ltsf2
        cmp     r0, #0
        blt     LBML3
        mov     r0, r6
        bl      __extendsfdf2
        mov     r8, r0
        mov     r7, r1
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        str     r1, [sp]
        mov     r9, r0
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        mov     r5, #0
        beq     LBML6
        ldr     r12, [pc, #0x2D0]
        mov     r1, r6
        ldr     r0, [r12]
        bl      __divsf3
        cmp     r11, #0
        ble     LBML5
        str     r0, [sp, #8]
        str     r9, [sp, #0x14]
        str     r7, [sp, #0xC]
        str     r8, [sp, #0x10]
        str     r10, [sp, #4]
        str     r11, [sp, #0x18]
LBML0:
        ldr     r0, [r4]
        bl      __extendsfdf2
        ldr     r2, [r4, #4]
        mov     r8, r0
        mov     r6, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r7, r0
        mov     r9, r1
        mov     r0, r8
        mov     r1, r6
        mov     r2, r8
        mov     r3, r6
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r7
        mov     r1, r9
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp]
        mov     r11, r0
        mov     r10, r1
        bl      __ltdf2
        cmp     r0, #0
        bge     LBML1
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBML4
        mov     r0, r11
        mov     r1, r10
        bl      sqrt
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
LBML1:
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r2, r11
        mov     r3, r10
        mov     r0, #0
        bl      __divdf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, r8
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r4]
        eor     r1, r9, #2, 2
        mov     r0, r7
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r4, #4]
LBML2:
        ldr     r1, [sp, #0x18]
        add     r5, r5, #1
        add     r4, r4, #8
        cmp     r5, r1
        blt     LBML0
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBML3:
        mvn     r0, #0x12
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBML4:
        ldr     r1, [sp, #8]
        str     r1, [r4]
        ldr     r1, [sp, #4]
        str     r1, [r4, #4]
        b       LBML2
LBML5:
        mov     r0, r5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBML6:
        cmp     r11, #0
        ble     LBML10
        ldr     r2, [pc, #0x148]
        mov     r0, r5
        str     r0, [sp, #0x14]
        str     r10, [sp, #4]
        str     r11, [sp, #0x18]
LBML7:
        ldr     r0, [r4]
        bl      __extendsfdf2
        ldr     r2, [r4, #4]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r8, r0
        mov     r9, r1
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBML9
        mov     r2, r11
        mov     r3, r10
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        eor     r11, r9, #2, 2
        mov     r10, r0
        mov     r9, r1
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r4]
        mov     r0, r8
        mov     r1, r11
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r4, #4]
LBML8:
        ldr     r1, [sp, #0x18]
        add     r5, r5, #1
        add     r4, r4, #8
        cmp     r5, r1
        blt     LBML7
        ldr     r0, [sp, #0x14]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBML9:
        ldr     r1, [pc, #0x44]
        ldr     r2, [sp, #4]
        ldr     r1, [r1]
        str     r2, [r4, #4]
        mov     r2, #4
        str     r2, [sp, #0x14]
        str     r1, [r4]
        b       LBML8
LBML10:
        mov     r0, r5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBML11:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBML12:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   LBML__2il0floatpacket.1
        .long   LBML__2il0floatpacket.2
        .long   ippConstantOfINF_32f


        .data
        .align  4


LBML__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LBML__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


