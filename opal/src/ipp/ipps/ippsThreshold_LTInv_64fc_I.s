        .text
        .align  4
        .globl  _ippsThreshold_LTInv_64fc_I


_ippsThreshold_LTInv_64fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r9, r2
        mov     r8, r3
        beq     LBMH11
        cmp     r6, #0
        ble     LBMH12
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBMH3
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        mov     r7, #0
        beq     LBMH6
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r9
        mov     r3, r8
        bl      __divdf3
        cmp     r6, #0
        ble     LBMH5
        mov     r5, #0
        str     r1, [sp]
        str     r0, [sp, #4]
        str     r10, [sp, #0x14]
        str     r11, [sp, #0x10]
        str     r8, [sp, #8]
        str     r9, [sp, #0xC]
        str     r6, [sp, #0x18]
LBMH0:
        ldr     r8, [r4]
        ldr     r6, [r4, #4]
        ldr     r7, [r4, #8]
        ldr     r9, [r4, #0xC]
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
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        mov     r11, r0
        mov     r10, r1
        bl      __ltdf2
        cmp     r0, #0
        bge     LBMH1
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LBMH4
        mov     r0, r11
        mov     r1, r10
        bl      sqrt
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
LBMH1:
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
        mov     r2, r1
        eor     r1, r9, #2, 2
        str     r0, [r4]
        str     r2, [r4, #4]
        mov     r0, r7
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r0, [r4, #8]
        str     r1, [r4, #0xC]
LBMH2:
        ldr     r1, [sp, #0x18]
        add     r5, r5, #1
        add     r4, r4, #0x10
        cmp     r5, r1
        blt     LBMH0
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBMH3:
        mvn     r0, #0x12
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBMH4:
        ldr     r1, [sp, #4]
        str     r1, [r4]
        ldr     r1, [sp]
        str     r1, [r4, #4]
        mov     r1, #0
        str     r1, [r4, #8]
        str     r1, [r4, #0xC]
        b       LBMH2
LBMH5:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBMH6:
        cmp     r6, #0
        ble     LBMH10
        ldr     r2, [pc, #0x138]
        mov     r0, #0
        mov     r5, r0
        str     r0, [sp, #0x14]
        str     r6, [sp, #0x18]
LBMH7:
        ldr     r8, [r4]
        ldr     r7, [r4, #4]
        ldr     r6, [r4, #8]
        ldr     r9, [r4, #0xC]
        mov     r0, r8
        mov     r1, r7
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r6
        mov     r1, r9
        mov     r2, r6
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
        beq     LBMH9
        mov     r2, r11
        mov     r3, r10
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        eor     r11, r9, #2, 2
        mov     r10, r0
        mov     r9, r1
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, r6
        mov     r1, r11
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        str     r0, [r4, #8]
        str     r1, [r4, #0xC]
LBMH8:
        ldr     r1, [sp, #0x18]
        add     r5, r5, #1
        add     r4, r4, #0x10
        cmp     r5, r1
        blt     LBMH7
        ldr     r0, [sp, #0x14]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBMH9:
        ldr     r2, [pc, #0x48]
        mov     r3, #0
        str     r3, [r4, #8]
        ldr     r1, [r2]
        ldr     r2, [r2, #4]
        str     r3, [r4, #0xC]
        str     r1, [r4]
        mov     r1, #4
        str     r2, [r4, #4]
        str     r1, [sp, #0x14]
        b       LBMH8
LBMH10:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBMH11:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBMH12:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   ippConstantOfINF_64f


