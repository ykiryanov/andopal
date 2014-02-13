        .text
        .align  4
        .globl  _ippsTriangle_Direct_64fc


_ippsTriangle_Direct_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        ldr     r6, [sp, #0x9C]
        ldr     r10, [sp, #0x8C]
        ldr     r9, [sp, #0x90]
        ldr     r7, [sp, #0x94]
        ldr     r8, [sp, #0x98]
        cmp     r6, #0
        str     r0, [sp]
        mov     r11, r1
        mov     r4, r2
        mov     r5, r3
        beq     LANS22
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        ble     LANS20
        mov     r0, r10
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LANS19
        mov     r0, r10
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r1, r9
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LANS19
        ldr     r12, [pc, #0x854]
        ldr     r2, [pc, #0x854]
        mov     r0, r7
        sub     r3, r12, #2, 2
        mov     r1, r8
        bl      __ltdf2
        cmp     r0, #0
        blt     LANS18
        ldr     r12, [pc, #0x83C]
        ldr     r2, [pc, #0x834]
        mov     r0, r7
        sub     r3, r12, #1, 12
        mov     r1, r8
        bl      __gedf2
        cmp     r0, #0
        bge     LANS18
        ldr     r0, [r6]
        mov     r2, #0
        mov     r3, #0
        str     r0, [sp, #0xC]
        ldr     r1, [r6, #4]
        str     r1, [sp, #8]
        bl      __ltdf2
        cmp     r0, #0
        blt     LANS17
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r2, [pc, #0x7EC]
        ldr     r3, [pc, #0x7EC]
        bl      __gedf2
        cmp     r0, #0
        bge     LANS17
        ldr     r12, [sp]
        cmp     r12, #0
        beq     LANS22
        cmp     r11, #0
        ble     LANS21
        ldr     r2, [pc, #0x7C4]
        ldr     r3, [pc, #0x7C4]
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r0, r11
        bl      __floatsidf
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        bl      __adddf3
        ldr     r2, [pc, #0x790]
        ldr     r3, [pc, #0x790]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x5C]
        bl      __muldf3
        bl      floor
        ldr     r2, [pc, #0x768]
        ldr     r3, [pc, #0x768]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x5C]
        bl      __subdf3
        str     r0, [sp, #0x10]
        str     r1, [sp, #4]
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LANS0
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #4]
        ldr     r2, [pc, #0x724]
        ldr     r3, [pc, #0x724]
        bl      __gedf2
        cmp     r0, #0
        blt     LANS1
LANS0:
        mov     r12, #0
        str     r12, [sp, #4]
        str     r12, [sp, #0x10]
LANS1:
        ldr     r12, [sp, #0x10]
        ldr     r0, [pc, #0x700]
        mov     r2, r7
        str     r12, [r6]
        ldr     r12, [sp, #4]
        mov     r3, r8
        str     r12, [r6, #4]
        ldr     r12, [pc, #0x6EC]
        sub     r1, r12, #1, 12
        str     r1, [sp, #0x60]
        bl      __adddf3
        str     r0, [sp, #4]
        ldr     r0, [pc, #0x6D4]
        mov     r6, r1
        ldr     r1, [sp, #0x60]
        mov     r3, r8
        mov     r2, r7
        bl      __subdf3
        ldr     r12, [pc, #0x6C0]
        mov     r7, r0
        ldr     r0, [pc, #0x6B4]
        mov     r8, r1
        str     r8, [sp, #0x10]
        add     r1, r12, #1, 12
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x54]
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #4]
        mov     r10, r1
        eor     r1, r10, #2, 2
        mov     r9, r0
        mov     r3, r6
        bl      __divdf3
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x38]
        mov     r2, r7
        mov     r3, r8
        mov     r0, r9
        mov     r1, r10
        bl      __divdf3
        ldr     r2, [sp, #4]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x2C]
        eor     r1, r8, #2, 2
        mov     r3, r6
        mov     r0, r7
        bl      __divdf3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #4]
        str     r1, [sp, #0x28]
        eor     r1, r6, #2, 2
        mov     r2, r7
        mov     r3, r8
        bl      __divdf3
        mov     r10, r0
        str     r10, [sp, #0x20]
        ldr     r0, [sp, #0x60]
        mov     r9, r1
        ldr     r1, [sp, #0x54]
        str     r9, [sp, #0x1C]
        mov     r2, r7
        mov     r3, r8
        bl      __divdf3
        ldr     r2, [sp, #4]
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x54]
        mov     r3, r6
        bl      __divdf3
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x28]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x4C]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x40]
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #4]
        mov     r3, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LANS2
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        ldr     r2, [sp, #4]
        mov     r3, r6
        bl      __divdf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __subdf3
        ldr     r12, [sp, #0x34]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x38]
        str     r12, [sp, #0x18]
        b       LANS3
LANS2:
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #4]
        mov     r3, r6
        bl      __subdf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r3, [sp, #0x10]
        mov     r2, r7
        bl      __divdf3
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #2, 2
        mov     r2, #0
        bl      __adddf3
        ldr     r12, [sp, #0x2C]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x30]
        str     r12, [sp, #0x18]
LANS3:
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x60]
        ldr     r2, [sp, #4]
        ldr     r0, [pc, #0x4A4]
        ldr     r1, [pc, #0x4A4]
        mov     r3, r6
        bl      __adddf3
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        bl      __adddf3
        ldr     r2, [pc, #0x474]
        ldr     r3, [pc, #0x474]
        mov     r8, r0
        mov     r9, r1
        bl      __gedf2
        cmp     r0, #0
        blt     LANS4
        ldr     r2, [pc, #0x458]
        ldr     r3, [pc, #0x458]
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        mov     r8, r0
        mov     r9, r1
LANS4:
        mov     r0, r8
        mov     r1, r9
        ldr     r2, [sp, #4]
        mov     r3, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LANS5
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #4]
        mov     r3, r6
        bl      __divdf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __subdf3
        ldr     r9, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        b       LANS6
LANS5:
        mov     r0, r8
        mov     r1, r9
        ldr     r2, [sp, #4]
        mov     r3, r6
        bl      __subdf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r3, [sp, #0x10]
        mov     r2, r7
        bl      __divdf3
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #2, 2
        mov     r2, #0
        bl      __adddf3
        ldr     r9, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
LANS6:
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r10, #0
        movgt   r10, #1
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r12, #0
        movgt   r12, #1
        cmp     r11, #0
        ble     LANS16
        str     r8, [sp, #0xC]
        str     r9, [sp, #0x10]
        ldr     r8, [sp, #0x3C]
        ldr     r9, [sp]
        str     r12, [sp, #4]
        str     r10, [sp, #8]
        str     r11, [sp, #0x64]
LANS7:
        str     r8, [r9]
        ldr     r3, [sp, #0x60]
        str     r7, [r9, #8]
        str     r6, [r9, #0xC]
        str     r3, [r9, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     r2, r8
        bl      __adddf3
        ldr     r12, [sp, #8]
        mov     r10, r1
        mov     r11, r0
        cmp     r12, #0
        mov     r8, r11
        str     r10, [sp, #0x60]
        beq     LANS9
        mov     r0, r11
        mov     r1, r10
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANS11
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        bl      __adddf3
        str     r1, [sp, #0x60]
        mov     r8, r0
        eor     r3, r5, #2, 2
        mov     r2, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LANS8
        mov     r0, r11
        mov     r1, r10
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        bl      __subdf3
        mov     r8, r0
        str     r1, [sp, #0x60]
        b       LANS11
LANS8:
        ldr     r12, [sp, #0x34]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x38]
        str     r12, [sp, #0x18]
        mov     r12, #0
        str     r12, [sp, #8]
        b       LANS11
LANS9:
        eor     r3, r5, #2, 2
        mov     r0, r11
        mov     r1, r10
        mov     r2, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LANS11
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        str     r1, [sp, #0x60]
        mov     r8, r0
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANS10
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x50]
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        mov     r8, r0
        str     r1, [sp, #0x60]
        b       LANS11
LANS10:
        ldr     r12, [sp, #0x2C]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x30]
        str     r12, [sp, #0x18]
        mov     r12, #1
        str     r12, [sp, #8]
LANS11:
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r7, r10
        cmp     r12, #0
        mov     r6, r11
        beq     LANS13
        mov     r0, r10
        mov     r1, r11
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANS15
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        eor     r3, r5, #2, 2
        mov     r2, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LANS12
        mov     r0, r10
        mov     r1, r11
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        bl      __subdf3
        mov     r7, r0
        mov     r6, r1
        b       LANS15
LANS12:
        ldr     r12, [sp, #0x34]
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x38]
        str     r12, [sp, #0xC]
        mov     r12, #0
        str     r12, [sp, #4]
        b       LANS15
LANS13:
        eor     r3, r5, #2, 2
        mov     r0, r10
        mov     r1, r11
        mov     r2, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LANS15
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANS14
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x50]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        b       LANS15
LANS14:
        ldr     r12, [sp, #0x2C]
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x30]
        str     r12, [sp, #0xC]
        mov     r12, #1
        str     r12, [sp, #4]
LANS15:
        ldr     r12, [sp, #0x64]
        add     r9, r9, #0x10
        subs    r12, r12, #1
        str     r12, [sp, #0x64]
        bne     LANS7
LANS16:
        mov     r0, #0
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LANS17:
        mvn     r0, #0x28
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LANS18:
        mvn     r0, #0x27
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LANS19:
        mvn     r0, #0x29
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LANS20:
        mvn     r0, #0x2A
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LANS21:
        mvn     r0, #5
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LANS22:
        mvn     r0, #7
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
        .long   0x400921fb
        .long   0x54442d18
        .long   0x401921fb
        .long   0x6dc9c883
        .long   0x3fc45f30


