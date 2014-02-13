        .text
        .align  4
        .globl  _ippsToneQ15_16s


_ippsToneQ15_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r4, r0
        cmp     r4, #0
        mov     r8, r1
        mov     r9, r2
        beq     LANZ6
        cmp     r9, #0
        beq     LANZ6
        cmp     r8, #0
        ble     LANZ5
        ldr     r3, [r9]
        ldr     r12, [pc, #0x17C]
        cmp     r12, r3
        beq     LANZ0
        mvn     r0, #0x10
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LANZ0:
        ldr     r12, [r9, #0x28]
        ldr     r11, [r9, #8]
        ldr     r10, [r9, #0xC]
        ldr     r0, [r9, #0x10]
        ldr     r1, [r9, #0x14]
        ldr     r7, [r9, #0x18]
        ldr     r6, [r9, #0x1C]
        cmp     r12, #0
        ldrne   r5, [r9, #0x20]
        addne   r8, r8, r5
        moveq   r5, #0
        cmp     r5, r8
        bge     LANZ4
        ldr     r2, [pc, #0x134]
        ldr     r3, [pc, #0x134]
        bl      __muldf3
        str     r8, [sp, #4]
        ldr     r8, [pc, #0x128]
        str     r9, [sp]
        mov     r9, r4
        str     r1, [sp, #8]
        str     r10, [sp, #0xC]
        str     r11, [sp, #0x10]
        mov     r4, r0
LANZ1:
        mov     r0, r5
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r4
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [pc, #0xE8]
        mov     r10, r0
        mov     r11, r1
        mov     r3, r8
        bl      __divdf3
        bl      floor
        ldr     r2, [pc, #0xD0]
        mov     r3, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        bl      cos
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LANZ2
        mov     r2, r11
        mov     r3, r10
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
        b       LANZ3
LANZ2:
        mov     r0, r11
        mov     r1, r10
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
LANZ3:
        strh    r0, [r9], #2
        ldr     r1, [sp, #4]
        add     r5, r5, #1
        cmp     r5, r1
        blt     LANZ1
        ldr     r8, [sp, #4]
        ldr     r9, [sp]
LANZ4:
        mov     r0, #1
        str     r0, [r9, #0x28]
        mov     r0, #0
        str     r8, [r9, #0x20]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LANZ5:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LANZ6:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d4148
        .long   0x54442d18
        .long   0x401921fb


