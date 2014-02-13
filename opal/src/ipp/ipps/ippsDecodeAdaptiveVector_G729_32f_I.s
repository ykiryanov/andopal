        .text
        .align  4
        .globl  _ippsDecodeAdaptiveVector_G729_32f_I


_ippsDecodeAdaptiveVector_G729_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r4, r1
        beq     LDHT2
        cmp     r4, #0
        beq     LDHT2
        ldr     r2, [r0]
        cmp     r2, #0x12
        blt     LDHT1
        cmp     r2, #0x91
        bgt     LDHT1
        ldr     r0, [r0, #4]
        cmn     r0, #1
        blt     LDHT1
        cmp     r0, #1
        bgt     LDHT1
        rsbs    r3, r0, #0
        sub     r6, r4, r2, lsl #2
        addmi   r3, r3, #3
        submi   r6, r6, #4
        ldr     r2, [pc, #0x288]
        ldr     r9, [pc, #0x288]
        mov     r0, r3, lsl #2
        ldr     r2, [r2]
        rsb     r3, r3, #0
        add     r8, r9, r0
        add     r5, r9, r3, lsl #2
        mov     r7, #0x28
        str     r2, [sp, #4]
        str     r0, [sp]
LDHT0:
        ldr     r0, [sp]
        mov     r10, r6
        add     r6, r6, #4
        ldr     r1, [r9, +r0]
        ldr     r0, [r10]
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r1, [r5, #0xC]
        ldr     r2, [r6]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r10, #-4]
        ldr     r1, [r8, #0xC]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r5, #0x18]
        ldr     r2, [r6, #4]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r10, #-8]
        ldr     r1, [r8, #0x18]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r6, #8]
        ldr     r1, [r5, #0x24]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r10, #-0xC]
        ldr     r1, [r8, #0x24]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r6, #0xC]
        ldr     r1, [r5, #0x30]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r10, #-0x10]
        ldr     r1, [r8, #0x30]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r6, #0x10]
        ldr     r1, [r5, #0x3C]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r10, #-0x14]
        ldr     r1, [r8, #0x3C]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r5, #0x48]
        ldr     r2, [r6, #0x14]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r10, #-0x18]
        ldr     r1, [r8, #0x48]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r5, #0x54]
        ldr     r2, [r6, #0x18]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r10, #-0x1C]
        ldr     r1, [r8, #0x54]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r5, #0x60]
        ldr     r2, [r6, #0x1C]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r8, #0x60]
        ldr     r2, [r10, #-0x20]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r5, #0x6C]
        ldr     r2, [r6, #0x20]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r10, #-0x24]
        ldr     r2, [r8, #0x6C]
        mov     r10, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [r5, #0x78]
        ldr     r2, [r6, #0x24]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4], #4
        subs    r7, r7, #1
        bne     LDHT0
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDHT1:
        mvn     r0, #0xA
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDHT2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LDHT__2il0floatpacket.1
        .long   LDHT_inter_3l_32f


        .data
        .align  4


LDHT__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


        .data
        .align  4


LDHT_inter_3l_32f:
        .byte   0x36,0x05,0x66,0x3F,0xF2,0xEE,0x44,0x3F,0x7D,0xB3,0xE5,0x3E,0x15,0x6F,0xC4,0x3D
        .byte   0x97,0x8E,0x09,0xBE,0x0B,0xD0,0x36,0xBE,0x03,0xEA,0xAD,0xBD,0xFB,0x5A,0x17,0x3D
        .byte   0xCE,0xA6,0xC3,0x3D,0x51,0x2E,0x8D,0x3D,0x00,0x00,0x00,0x80,0x6D,0x74,0x4E,0xBD
        .byte   0x5C,0x38,0x50,0xBD,0x18,0x25,0x68,0xBC,0x8F,0x18,0xBD,0x3C,0x63,0x64,0x09,0x3D
        .byte   0xA1,0x69,0x89,0x3C,0x59,0xA5,0xF4,0xBB,0xEB,0x6E,0x9E,0xBC,0xA7,0x5C,0x61,0xBC
        .byte   0x00,0x00,0x00,0x00,0x75,0x02,0x1A,0x3C,0x5F,0xEE,0x13,0x3C,0x8D,0x0A,0x1C,0x3B
        .byte   0x0E,0xBB,0x6F,0xBB,0x88,0xB9,0xA4,0xBB,0x34,0x9D,0x1D,0xBB,0x27,0xA0,0x89,0x3A
        .byte   0xA9,0x30,0x36,0x3B,0x21,0x93,0x0C,0x3B,0x00,0x00,0x00,0x00


