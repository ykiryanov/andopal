        .text
        .align  4
        .globl  _ippsToneDetect_EC_32f


_ippsToneDetect_EC_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        mov     r11, r0
        cmp     r11, #0
        mov     r5, r1
        mov     r4, r2
        beq     LDKW6
        cmp     r4, #0
        beq     LDKW6
        cmp     r3, #0
        beq     LDKW6
        cmp     r5, #0
        ble     LDKW5
        and     r12, r3, #0xF
        rsb     r12, r12, #0
        and     lr, r12, #0xF
        ldr     r12, [lr, +r3]
        add     r7, r3, lr
        ldr     r3, [r7, #0xC]
        cmp     r5, #0
        str     r3, [sp, #0x30]
        ldr     r3, [r12]
        str     r3, [sp, #0x14]
        ldr     r3, [r12, #4]
        str     r3, [sp, #0x18]
        ldr     r3, [r12, #8]
        str     r3, [sp, #0x10]
        ldr     r12, [r12, #0xC]
        str     r12, [sp, #0xC]
        ldr     r3, [r7, #0x10]
        str     r3, [sp, #0x48]
        ldr     r3, [r7, #0x18]
        ldr     r10, [r7, #0x14]
        str     r3, [sp, #0x40]
        ldr     r3, [r7, #4]
        ldr     r6, [r7, #0x1C]
        str     r3, [sp, #0x3C]
        ldr     r3, [r7, #0x20]
        ldr     r9, [r7, #8]
        str     r3, [sp, #0x44]
        ldr     r3, [r7, #0x24]
        str     r3, [sp]
        ldr     r3, [r7, #0x28]
        str     r3, [sp, #4]
        ldr     r3, [r7, #0x2C]
        str     r3, [sp, #0x38]
        ldr     r3, [r7, #0x30]
        str     r3, [sp, #8]
        ldr     r3, [r7, #0x34]
        str     r3, [sp, #0x28]
        movle   r8, #0
        ble     LDKW4
        ldr     r3, [pc, #0x260]
        mov     r8, #0
        mov     r1, r6
        ldr     r0, [r3]
        bl      __subsf3
        str     r5, [sp, #0x34]
        str     r8, [sp, #0x24]
        str     r7, [sp, #0x20]
        str     r4, [sp, #0x1C]
        mov     r5, r0
LDKW0:
        ldr     r4, [r11], #4
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x18]
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x10]
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        mov     r7, r0
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0xC]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        mov     r7, r0
        ldr     r0, [sp, #0x14]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r8, r0
        mov     r1, r6
        mov     r0, r9
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r4
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x3C]
        mov     r1, r6
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r8
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x3C]
        bl      __extendsfdf2
        str     r1, [sp, #0x4C]
        mov     r7, r0
        mov     r0, r9
        bl      __extendsfdf2
        ldr     r2, [pc, #0x164]
        ldr     r3, [pc, #0x164]
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x2C]
        bl      __muldf3
        ldr     r3, [sp, #0x4C]
        mov     r2, r7
        bl      __ltdf2
        ldr     r3, [sp, #0x30]
        str     r10, [sp, #0x40]
        cmp     r0, #0
        str     r3, [sp, #0x48]
        str     r4, [sp, #0x30]
        mov     r10, r8
        bge     LDKW1
        ldr     r2, [sp, #0x44]
        add     r2, r2, #1
        str     r2, [sp, #0x44]
        mov     r2, #0
        str     r2, [sp, #0x38]
        b       LDKW3
LDKW1:
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x2C]
        ldr     r2, [pc, #0x110]
        ldr     r3, [pc, #0x110]
        bl      __muldf3
        ldr     r3, [sp, #0x4C]
        mov     r2, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LDKW2
        ldr     r3, [sp]
        ldr     r2, [sp, #0x44]
        cmp     r2, r3
        ble     LDKW2
        ldr     r3, [sp, #4]
        ldr     r2, [sp, #0x44]
        cmp     r2, r3
        bge     LDKW2
        ldr     r2, [sp, #0x28]
        add     r2, r2, #1
        cmp     r2, #1
        str     r2, [sp, #0x28]
        movgt   r2, #1
        strgt   r2, [sp, #0x24]
        mov     r2, #0
        str     r2, [sp, #0x44]
LDKW2:
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #8]
        add     r2, r2, #1
        str     r2, [sp, #0x38]
        cmp     r2, r3
        ble     LDKW3
        mov     r2, #0
        str     r2, [sp, #0x28]
        str     r2, [sp, #0x44]
        str     r2, [sp, #0x38]
LDKW3:
        ldr     r2, [sp, #0x34]
        subs    r2, r2, #1
        str     r2, [sp, #0x34]
        bne     LDKW0
        ldr     r8, [sp, #0x24]
        ldr     r7, [sp, #0x20]
        ldr     r4, [sp, #0x1C]
LDKW4:
        ldr     r3, [sp, #0x28]
        str     r3, [r7, #0x34]
        ldr     r3, [sp, #0x44]
        str     r3, [r7, #0x20]
        ldr     r3, [sp, #0x38]
        str     r3, [r7, #0x2C]
        ldr     r3, [sp, #0x3C]
        str     r9, [r7, #8]
        str     r3, [r7, #4]
        ldr     r0, [sp, #0x30]
        str     r0, [r7, #0xC]
        ldr     r0, [sp, #0x48]
        str     r10, [r7, #0x14]
        str     r0, [r7, #0x10]
        ldr     r0, [sp, #0x40]
        str     r0, [r7, #0x18]
        mov     r0, #0
        str     r8, [r4]
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LDKW5:
        mvn     r0, #4
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LDKW6:
        mvn     r0, #7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
        .long   LDKW__2il0floatpacket.1
        .long   0x9999999a
        .long   0x3fe99999
        .long   0xeb851eb8
        .long   0x3fdeb851


        .data
        .align  4


LDKW__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


