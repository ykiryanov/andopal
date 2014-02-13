        .text
        .align  4
        .globl  _ippsToneQ15_Direct_16s


_ippsToneQ15_Direct_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r7, [sp, #0x30]
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r9, r2
        mov     r0, r3
        beq     LANY8
        cmp     r6, #0
        ble     LANY7
        cmp     r9, #0
        ble     LANY6
        cmp     r0, #0
        blt     LANY5
        mov     r12, #0xFF
        orr     r12, r12, #0x3F, 24
        cmp     r12, r0
        blt     LANY5
        cmp     r7, #0
        blt     LANY4
        mov     r12, #0x3E
        orr     r12, r12, #0xC9, 22
        cmp     r12, r7
        blt     LANY4
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        mov     r5, r0
        mov     r0, r7
        mov     r10, r1
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        cmp     r6, #0
        mov     r7, r0
        mov     r8, r1
        ble     LANY3
        ldr     r2, [pc, #0x11C]
        ldr     r3, [pc, #0x11C]
        mov     r0, r5
        mov     r1, r10
        bl      __muldf3
        mov     r5, r0
        mov     r0, r9
        mov     r11, r1
        bl      __floatsidf
        mov     r10, r0
        mov     r0, #0
        str     r8, [sp]
        str     r7, [sp, #4]
        mov     r9, r1
        str     r6, [sp, #8]
        mov     r7, r0
        mov     r8, r4
LANY0:
        mov     r0, r7
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __adddf3
        bl      cos
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r6, r0
        mov     r4, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LANY1
        mov     r2, r6
        mov     r3, r4
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        b       LANY2
LANY1:
        mov     r0, r6
        mov     r1, r4
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
LANY2:
        bl      __fixdfsi
        strh    r0, [r8], #2
        ldr     r12, [sp, #8]
        add     r7, r7, #1
        cmp     r7, r12
        blt     LANY0
LANY3:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LANY4:
        mvn     r0, #0x2B
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LANY5:
        mvn     r0, #0x2C
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LANY6:
        mvn     r0, #0x2D
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LANY7:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LANY8:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


