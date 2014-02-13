        .text
        .align  4
        .globl  _ippsThreshold_64fc_I


_ippsThreshold_64fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r7, [sp, #0x3C]
        mov     r6, r0
        cmp     r6, #0
        mov     r9, r1
        mov     r10, r2
        mov     r8, r3
        beq     LARI7
        cmp     r9, #0
        ble     LARI8
        mov     r0, r10
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LARI2
        mov     r0, r10
        mov     r1, r8
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        cmp     r7, #4
        mov     r5, r0
        mov     r4, r1
        mov     r7, #0
        beq     LARI4
        str     r8, [sp, #0x10]
        str     r10, [sp, #0xC]
LARI0:
        ldr     r2, [r6, #8]
        str     r2, [sp, #8]
        ldr     r3, [r6, #0xC]
        mov     r0, r2
        str     r3, [sp]
        mov     r1, r3
        bl      __muldf3
        ldr     r3, [r6, #4]
        ldr     r8, [r6]
        mov     r10, r1
        str     r3, [sp, #4]
        mov     r1, r3
        mov     r11, r0
        mov     r0, r8
        mov     r2, r8
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, r5
        mov     r3, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LARI1
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LARI3
        mov     r2, r11
        mov     r3, r10
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        bl      sqrt
        ldr     r3, [sp, #4]
        mov     r11, r0
        mov     r10, r1
        mov     r2, r8
        bl      __muldf3
        str     r0, [r6]
        str     r1, [r6, #4]
        ldr     r0, [sp, #8]
        ldr     r1, [sp]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r0, [r6, #8]
        str     r1, [r6, #0xC]
LARI1:
        add     r7, r7, #1
        cmp     r7, r9
        add     r6, r6, #0x10
        blt     LARI0
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LARI2:
        mvn     r0, #0x12
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LARI3:
        ldr     r12, [sp, #0xC]
        str     r12, [r6]
        ldr     r12, [sp, #0x10]
        str     r12, [r6, #4]
        b       LARI1
LARI4:
        str     r9, [sp, #0x14]
LARI5:
        ldr     r2, [r6, #8]
        str     r2, [sp, #0x10]
        ldr     r3, [r6, #0xC]
        mov     r0, r2
        str     r3, [sp, #0xC]
        mov     r1, r3
        bl      __muldf3
        ldr     r9, [r6]
        ldr     r8, [r6, #4]
        mov     r11, r0
        mov     r10, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LARI6
        mov     r2, r11
        mov     r3, r10
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        bl      sqrt
        mov     r10, r0
        mov     r11, r1
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [r6]
        str     r1, [r6, #4]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        str     r0, [r6, #8]
        str     r1, [r6, #0xC]
LARI6:
        ldr     r12, [sp, #0x14]
        add     r7, r7, #1
        add     r6, r6, #0x10
        cmp     r7, r12
        blt     LARI5
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LARI7:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LARI8:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


