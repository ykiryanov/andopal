        .text
        .align  4
        .globl  _ippsTriangle_Direct_32fc


_ippsTriangle_Direct_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     r5, [sp, #0x98]
        ldr     r6, [sp, #0x94]
        cmp     r5, #0
        str     r0, [sp]
        mov     r11, r1
        mov     r10, r2
        mov     r7, r3
        beq     LANU22
        ldr     r12, [pc, #0x8F4]
        mov     r0, r10
        ldr     r4, [r12]
        mov     r1, r4
        bl      __lesf2
        cmp     r0, #0
        ble     LANU20
        mov     r0, r7
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        blt     LANU19
        mov     r0, r7
        bl      __extendsfdf2
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r9, r0
        mov     r8, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LANU19
        mov     r0, r6
        bl      __extendsfdf2
        ldr     r12, [pc, #0x894]
        ldr     r2, [pc, #0x894]
        mov     r6, r0
        sub     r3, r12, #2, 2
        mov     r7, r1
        bl      __ltdf2
        cmp     r0, #0
        blt     LANU18
        ldr     r12, [pc, #0x87C]
        ldr     r2, [pc, #0x874]
        mov     r0, r6
        sub     r3, r12, #1, 12
        mov     r1, r7
        bl      __gedf2
        cmp     r0, #0
        bge     LANU18
        ldr     r0, [r5]
        mov     r1, r4
        str     r0, [sp, #4]
        bl      __ltsf2
        cmp     r0, #0
        blt     LANU17
        ldr     r0, [sp, #4]
        bl      __extendsfdf2
        ldr     r3, [pc, #0x83C]
        ldr     r2, [pc, #0x834]
        str     r0, [sp, #4]
        str     r1, [sp, #8]
        bl      __gedf2
        cmp     r0, #0
        bge     LANU17
        ldr     r12, [sp]
        cmp     r12, #0
        beq     LANU22
        cmp     r11, #0
        ble     LANU21
        ldr     r3, [pc, #0x80C]
        ldr     r2, [pc, #0x804]
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r0, r11
        bl      __floatsidf
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        bl      __adddf3
        ldr     r2, [pc, #0x7D4]
        ldr     r3, [pc, #0x7D4]
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x68]
        mov     r4, r1
        bl      __muldf3
        bl      floor
        ldr     r2, [pc, #0x7B0]
        ldr     r3, [pc, #0x7B0]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x68]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        str     r1, [sp, #0x10]
        mov     r4, r0
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LANU0
        ldr     r1, [sp, #0x10]
        ldr     r2, [pc, #0x770]
        ldr     r3, [pc, #0x770]
        mov     r0, r4
        bl      __gedf2
        cmp     r0, #0
        blt     LANU1
LANU0:
        mov     r4, #0
        str     r4, [sp, #0x10]
LANU1:
        ldr     r1, [sp, #0x10]
        mov     r0, r4
        bl      __truncdfsf2
        ldr     r12, [pc, #0x748]
        str     r0, [r5]
        ldr     r0, [pc, #0x73C]
        sub     lr, r12, #1, 12
        str     lr, [sp, #0x68]
        ldr     r1, [sp, #0x68]
        add     r12, r12, #1, 12
        str     r12, [sp, #0x60]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [pc, #0x710]
        ldr     r1, [sp, #0x68]
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        mov     r0, r10
        bl      __extendsfdf2
        ldr     r2, [pc, #0x6EC]
        ldr     r3, [sp, #0x60]
        mov     r7, r0
        mov     r6, r1
        bl      __muldf3
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        mov     r8, r1
        str     r0, [sp, #0x58]
        eor     r1, r8, #2, 2
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x58]
        str     r1, [sp, #0x38]
        mov     r1, r8
        bl      __divdf3
        ldr     r12, [sp, #0xC]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x10]
        str     r1, [sp, #0x30]
        eor     r1, r12, #2, 2
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x28]
        eor     r1, r5, #2, 2
        mov     r0, r4
        bl      __divdf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        mov     r9, r0
        ldr     r0, [sp, #0x60]
        str     r9, [sp, #0x1C]
        mov     r8, r1
        ldr     r1, [sp, #0x5C]
        str     r8, [sp, #0x20]
        bl      __divdf3
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x5C]
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0x28]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r6
        bl      __subdf3
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x40]
        mov     r0, r7
        mov     r1, r6
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x60]
        mov     r0, r4
        mov     r1, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANU2
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
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
        b       LANU3
LANU2:
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #8]
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
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
LANU3:
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x58]
        ldr     r0, [pc, #0x4E4]
        ldr     r1, [pc, #0x4E4]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        bl      __adddf3
        ldr     r2, [pc, #0x4B0]
        ldr     r3, [pc, #0x4B0]
        mov     r8, r0
        mov     r9, r1
        bl      __gedf2
        cmp     r0, #0
        blt     LANU4
        ldr     r2, [pc, #0x494]
        ldr     r3, [pc, #0x494]
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        mov     r8, r0
        mov     r9, r1
LANU4:
        mov     r0, r8
        mov     r1, r9
        mov     r2, r4
        mov     r3, r5
        bl      __ltdf2
        cmp     r0, #0
        bge     LANU5
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __subdf3
        ldr     r9, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        b       LANU6
LANU5:
        mov     r0, r8
        mov     r1, r9
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        bl      __divdf3
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #2, 2
        mov     r2, #0
        bl      __adddf3
        ldr     r9, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
LANU6:
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r12, #0
        strle   r12, [sp, #0x10]
        movgt   r12, #1
        strgt   r12, [sp, #0x10]
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r12, #0
        movgt   r12, #1
        cmp     r11, #0
        ble     LANU16
        str     r8, [sp, #8]
        str     r6, [sp, #0x64]
        str     r7, [sp, #0x68]
        ldr     r7, [sp, #0x58]
        ldr     r6, [sp, #0x5C]
        ldr     r8, [sp]
        str     r12, [sp, #4]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x6C]
LANU7:
        mov     r0, r6
        mov     r1, r7
        bl      __truncdfsf2
        str     r0, [r8]
        mov     r0, r5
        mov     r1, r4
        bl      __truncdfsf2
        str     r0, [r8, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x10]
        mov     r9, r0
        mov     r10, r1
        mov     r6, r9
        cmp     r12, #0
        mov     r7, r10
        beq     LANU9
        mov     r0, r9
        mov     r1, r10
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __gtdf2
        cmp     r0, #0
        ble     LANU11
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r12, [sp, #0x6C]
        mov     r6, r0
        mov     r7, r1
        eor     r0, r12, #2, 2
        bl      __extendsfdf2
        mov     r2, r6
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LANU8
        mov     r0, r9
        mov     r1, r10
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        bl      __subdf3
        mov     r6, r0
        mov     r7, r1
        b       LANU11
LANU8:
        ldr     r12, [sp, #0x34]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x38]
        str     r12, [sp, #0x18]
        mov     r12, #0
        str     r12, [sp, #0x10]
        b       LANU11
LANU9:
        ldr     r12, [sp, #0x6C]
        eor     r0, r12, #2, 2
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r10
        bl      __gtdf2
        cmp     r0, #0
        ble     LANU11
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x60]
        bl      __adddf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        mov     r6, r0
        mov     r7, r1
        bl      __gtdf2
        cmp     r0, #0
        ble     LANU10
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        mov     r6, r0
        mov     r7, r1
        b       LANU11
LANU10:
        ldr     r12, [sp, #0x2C]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x30]
        str     r12, [sp, #0x18]
        mov     r12, #1
        str     r12, [sp, #0x10]
LANU11:
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #4]
        mov     r9, r0
        mov     r10, r1
        mov     r5, r9
        cmp     r12, #0
        mov     r4, r10
        beq     LANU13
        mov     r0, r9
        mov     r1, r10
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __gtdf2
        cmp     r0, #0
        ble     LANU15
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r12, [sp, #0x6C]
        mov     r5, r0
        mov     r4, r1
        eor     r0, r12, #2, 2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LANU12
        mov     r0, r9
        mov     r1, r10
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        bl      __subdf3
        mov     r5, r0
        mov     r4, r1
        b       LANU15
LANU12:
        ldr     r12, [sp, #0x34]
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x38]
        str     r12, [sp, #8]
        mov     r12, #0
        str     r12, [sp, #4]
        b       LANU15
LANU13:
        ldr     r12, [sp, #0x6C]
        eor     r0, r12, #2, 2
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r10
        bl      __gtdf2
        cmp     r0, #0
        ble     LANU15
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x60]
        bl      __adddf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        mov     r5, r0
        mov     r4, r1
        bl      __gtdf2
        cmp     r0, #0
        ble     LANU14
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
        b       LANU15
LANU14:
        ldr     r12, [sp, #0x2C]
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x30]
        str     r12, [sp, #8]
        mov     r12, #1
        str     r12, [sp, #4]
LANU15:
        subs    r11, r11, #1
        add     r8, r8, #8
        bne     LANU7
LANU16:
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANU17:
        mvn     r0, #0x28
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANU18:
        mvn     r0, #0x27
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANU19:
        mvn     r0, #0x29
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANU20:
        mvn     r0, #0x2A
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANU21:
        mvn     r0, #5
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LANU22:
        mvn     r0, #7
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
        .long   LANU__2il0floatpacket.1
        .long   0x400921fb
        .long   0x54442d18
        .long   0x401921fb
        .long   0x6dc9c883
        .long   0x3fc45f30


        .data
        .align  4


LANU__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


