        .text
        .align  4
        .globl  _ippsTriangle_Direct_64f


_ippsTriangle_Direct_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     r6, [sp, #0x88]
        ldr     r10, [sp, #0x78]
        ldr     r9, [sp, #0x7C]
        ldr     r7, [sp, #0x80]
        ldr     r8, [sp, #0x84]
        cmp     r6, #0
        str     r0, [sp, #0x50]
        mov     r11, r1
        mov     r4, r2
        mov     r5, r3
        beq     LANT20
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        ble     LANT16
        mov     r0, r10
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LANT15
        mov     r0, r10
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r1, r9
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LANT15
        ldr     r12, [pc, #0x5EC]
        ldr     r2, [pc, #0x5EC]
        mov     r0, r7
        sub     r3, r12, #2, 2
        mov     r1, r8
        bl      __ltdf2
        cmp     r0, #0
        blt     LANT14
        ldr     r2, [pc, #0x5D0]
        ldr     r3, [pc, #0x5C8]
        mov     r0, r7
        mov     r1, r8
        bl      __gedf2
        cmp     r0, #0
        bge     LANT14
        ldr     r0, [r6]
        mov     r2, #0
        mov     r3, #0
        str     r0, [sp, #8]
        ldr     r1, [r6, #4]
        str     r1, [sp, #4]
        bl      __ltdf2
        cmp     r0, #0
        blt     LANT13
        ldr     r12, [pc, #0x58C]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r2, [pc, #0x584]
        add     r3, r12, #1, 12
        bl      __gedf2
        cmp     r0, #0
        bge     LANT13
        ldr     r12, [sp, #0x50]
        cmp     r12, #0
        beq     LANT20
        cmp     r11, #0
        ble     LANT21
        ldr     r12, [pc, #0x558]
        ldr     r2, [pc, #0x558]
        mov     r0, r10
        add     r12, r12, #1, 12
        str     r12, [sp, #0x4C]
        ldr     r3, [sp, #0x4C]
        mov     r1, r9
        bl      __muldf3
        str     r0, [sp, #0x48]
        mov     r0, r11
        str     r1, [sp, #0x44]
        bl      __floatsidf
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        bl      __adddf3
        ldr     r2, [pc, #0x518]
        ldr     r3, [pc, #0x518]
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x44]
        bl      __muldf3
        bl      floor
        ldr     r3, [sp, #0x4C]
        ldr     r2, [pc, #0x4F0]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x44]
        bl      __subdf3
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x48]
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LANT0
        ldr     r12, [pc, #0x4B4]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r2, [pc, #0x4AC]
        add     r3, r12, #1, 12
        bl      __gedf2
        cmp     r0, #0
        blt     LANT1
LANT0:
        mov     r12, #0
        str     r12, [sp, #0x48]
        str     r12, [sp, #0x44]
LANT1:
        ldr     r12, [sp, #0x44]
        ldr     r0, [pc, #0x488]
        ldr     r1, [pc, #0x480]
        str     r12, [r6]
        ldr     r12, [sp, #0x48]
        mov     r2, r7
        mov     r3, r8
        str     r12, [r6, #4]
        bl      __adddf3
        str     r0, [sp, #0x4C]
        mov     r6, r1
        ldr     r0, [pc, #0x460]
        ldr     r1, [pc, #0x458]
        mov     r2, r7
        mov     r3, r8
        bl      __subdf3
        ldr     r12, [pc, #0x448]
        mov     r7, r0
        ldr     r0, [pc, #0x444]
        mov     r8, r1
        add     r1, r12, #2, 12
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r3, r9
        mov     r2, r10
        bl      __muldf3
        ldr     r2, [sp, #0x4C]
        str     r0, [sp, #0x40]
        mov     r9, r1
        eor     r1, r9, #2, 2
        mov     r3, r6
        bl      __divdf3
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x40]
        str     r1, [sp, #0x44]
        mov     r1, r9
        mov     r2, r7
        mov     r3, r8
        bl      __divdf3
        ldr     r2, [sp, #0x4C]
        str     r1, [sp, #0x2C]
        str     r0, [sp, #0x30]
        eor     r1, r8, #2, 2
        mov     r3, r6
        mov     r0, r7
        bl      __divdf3
        mov     r10, r0
        ldr     r0, [sp, #0x4C]
        str     r10, [sp, #0x3C]
        mov     r9, r1
        str     r9, [sp, #0x40]
        eor     r1, r6, #2, 2
        mov     r2, r7
        mov     r3, r8
        bl      __divdf3
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x20]
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x1C]
        mov     r2, r7
        mov     r3, r8
        bl      __divdf3
        ldr     r2, [sp, #0x4C]
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x20]
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x1C]
        mov     r3, r6
        bl      __divdf3
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r2, r4
        mov     r3, r5
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x34]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #0x4C]
        mov     r3, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LANT2
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        mov     r3, r6
        bl      __divdf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __subdf3
        ldr     r12, [sp, #0x48]
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x44]
        str     r12, [sp, #4]
        b       LANT3
LANT2:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #0x4C]
        mov     r3, r6
        bl      __subdf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __divdf3
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #2, 2
        mov     r2, #0
        bl      __adddf3
        ldr     r12, [sp, #0x30]
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x2C]
        str     r12, [sp, #4]
LANT3:
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LANT4
        cmp     r11, #0
        movgt   r9, #1
        bgt     LANT5
        b       LANT17
LANT4:
        cmp     r11, #0
        movgt   r9, #0
        ble     LANT17
LANT5:
        mov     r8, #0
        str     r11, [sp]
LANT6:
        ldr     r12, [sp, #0x50]
        mov     r2, r7
        mov     r3, r6
        str     r7, [r12, +r8, lsl #3]
        add     r12, r12, r8, lsl #3
        str     r6, [r12, #4]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        cmp     r9, #0
        mov     r7, r11
        mov     r6, r10
        beq     LANT9
        mov     r0, r11
        mov     r1, r10
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANT8
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x40]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        eor     r3, r5, #2, 2
        mov     r2, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LANT7
        mov     r0, r11
        mov     r1, r10
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        bl      __subdf3
        mov     r7, r0
        mov     r6, r1
        b       LANT11
LANT7:
        ldr     r12, [sp, #0x48]
        mov     r9, #0
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x44]
        str     r12, [sp, #4]
        b       LANT11
LANT8:
        ldr     r12, [sp]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LANT6
        b       LANT17
LANT9:
        eor     r3, r5, #2, 2
        mov     r0, r11
        mov     r1, r10
        mov     r2, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LANT12
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x34]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANT10
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        b       LANT11
LANT10:
        ldr     r12, [sp, #0x30]
        mov     r9, #1
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x2C]
        str     r12, [sp, #4]
LANT11:
        ldr     r12, [sp]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LANT6
        b       LANT18
LANT12:
        ldr     r12, [sp]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LANT6
        b       LANT19
LANT13:
        mvn     r0, #0x28
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANT14:
        mvn     r0, #0x27
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANT15:
        mvn     r0, #0x29
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANT16:
        mvn     r0, #0x2A
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANT17:
        mov     r0, #0
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANT18:
        mov     r0, #0
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANT19:
        mov     r0, #0
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANT20:
        mvn     r0, #7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANT21:
        mvn     r0, #5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
        .long   0x400921fb
        .long   0x54442d18
        .long   0x6dc9c883
        .long   0x3fc45f30


