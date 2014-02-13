        .text
        .align  4
        .globl  _ippsSynthPQMF_MP3_32s16s


_ippsSynthPQMF_MP3_32s16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4B, 30
        ldr     r6, [sp, #0x150]
        cmp     r0, #0
        mov     r5, r1
        mov     r7, r2
        beq     LGDO5
        cmp     r5, #0
        beq     LGDO5
        cmp     r7, #0
        beq     LGDO5
        cmp     r3, #0
        beq     LGDO5
        cmp     r6, #1
        blt     LGDO0
        cmp     r6, #2
        bgt     LGDO0
        ldr     r12, [r3]
        cmp     r12, #0
        blt     LGDO0
        cmp     r12, #0xF
        ble     LGDO1
LGDO0:
        mvn     r0, #4
        add     sp, sp, #0x4B, 30
        ldmia   sp!, {r4 - r11, pc}
LGDO1:
        sub     r12, r12, #1
        and     r4, r12, #0xF
        str     r4, [r3]
        mov     r2, r4
        mov     r1, r7
        bl      LGDO__sDCTFwd32_MP3_32s
        ldr     r2, [pc, #0x668]
        add     r3, r4, #1
        add     r10, r4, #0xD
        add     lr, r4, #0xE
        mov     r12, r3, asr #1
        and     r3, r3, #0xF
        str     r3, [sp, #0x38]
        ldr     r8, [r7, +r3, lsl #2]
        and     r0, r4, #1
        rsb     r0, r0, #0
        add     r9, r4, #0xF
        rsb     r0, r0, r0, lsl #5
        and     r9, r9, #0xF
        str     r9, [sp, #0x34]
        add     r0, r7, r0, lsl #5
        str     r0, [sp, #0x48]
        ldr     r9, [r7, +r9, lsl #2]
        add     r0, r0, #0x42, 28
        and     lr, lr, #0xF
        str     lr, [sp, #0x30]
        ldr     lr, [r7, +lr, lsl #2]
        add     r3, r4, #2
        add     r11, r12, #7
        and     r3, r3, #0xF
        str     r3, [sp, #0x2C]
        ldr     r3, [r7, +r3, lsl #2]
        and     r11, r11, #7
        and     r10, r10, #0xF
        str     r3, [sp, #0x10]
        ldr     r1, [r0, +r11, lsl #2]
        str     r10, [sp, #0x28]
        ldr     r10, [r7, +r10, lsl #2]
        smull   r1, r2, r2, r1
        add     r3, r4, #3
        str     r2, [sp, #0x4C]
        and     r3, r3, #0xF
        str     r3, [sp, #0x24]
        ldr     r3, [r7, +r3, lsl #2]
        add     r11, r12, #6
        add     r1, r4, #0xC
        str     r3, [sp, #8]
        and     r11, r11, #7
        ldr     r3, [r0, +r11, lsl #2]
        and     r1, r1, #0xF
        str     r1, [sp, #0x20]
        str     r3, [sp, #4]
        ldr     r11, [r7, +r1, lsl #2]
        add     r2, r4, #4
        and     r2, r2, #0xF
        str     r2, [sp, #0x1C]
        str     r11, [sp]
        ldr     r11, [r7, +r2, lsl #2]
        add     r3, r12, #5
        and     r3, r3, #7
        str     r11, [sp, #0x50]
        ldr     r3, [r0, +r3, lsl #2]
        add     r11, r4, #0xB
        and     r11, r11, #0xF
        str     r3, [sp, #0x54]
        str     r11, [sp, #0x18]
        ldr     r11, [r7, +r11, lsl #2]
        add     r1, r4, #5
        and     r1, r1, #0xF
        str     r11, [sp, #0x58]
        str     r1, [sp, #0x14]
        ldr     r11, [r7, +r1, lsl #2]
        add     r1, r4, #6
        add     r2, r12, #3
        str     r11, [sp, #0x5C]
        sub     r9, r9, r8
        mov     r8, #0xD5, 18
        add     r3, r12, #4
        sub     r8, r8, #0xF2, 18
        smull   r9, r8, r8, r9
        ldr     r9, [sp, #4]
        and     r3, r3, #7
        ldr     r3, [r0, +r3, lsl #2]
        str     r8, [sp, #0x60]
        ldr     r8, [sp, #0x10]
        and     r1, r1, #0xF
        add     r11, r4, #0xA
        add     lr, lr, r8
        mov     r8, #0xD5, 18
        smull   lr, r8, r8, lr
        str     r8, [sp, #0x64]
        and     r11, r11, #0xF
        str     r11, [sp, #0x10]
        ldr     lr, [r7, +r11, lsl #2]
        str     r1, [sp, #0xC]
        add     r8, r4, #7
        str     lr, [sp, #0x68]
        ldr     lr, [r7, +r1, lsl #2]
        ldr     r1, [sp, #8]
        mov     r11, #0x92, 18
        smull   r9, r11, r11, r9
        str     lr, [sp, #0x6C]
        str     r11, [sp, #0x70]
        and     r2, r2, #7
        ldr     r11, [r0, +r2, lsl #2]
        ldr     r2, [sp, #0x64]
        sub     r10, r10, r1
        ldr     r1, [pc, #0x4D8]
        add     lr, r4, #9
        and     lr, lr, #0xF
        str     lr, [sp, #8]
        smull   r11, r1, r1, r11
        str     r1, [sp, #0x74]
        mov     r11, #0xD5, 18
        ldr     r1, [sp, #0x5C]
        sub     r11, r11, #0x2A, 14
        smull   r10, r11, r11, r10
        str     r11, [sp, #0x78]
        ldr     lr, [r7, +lr, lsl #2]
        ldr     r11, [sp]
        and     r8, r8, #0xF
        str     lr, [sp, #0x7C]
        str     r8, [sp, #4]
        ldr     lr, [r7, +r8, lsl #2]
        ldr     r8, [sp, #0x54]
        mvn     r10, #0x2D, 18
        add     r9, r12, #2
        and     r9, r9, #7
        smull   r8, r10, r10, r8
        str     r10, [sp, #0x54]
        ldr     r8, [r0, +r9, lsl #2]
        ldr     r10, [sp, #0x50]
        add     r9, r12, #1
        and     r9, r9, #7
        and     r12, r12, #7
        add     r10, r11, r10
        ldr     r11, [pc, #0x468]
        smull   r11, r8, r11, r8
        mov     r11, #0xD5, 18
        add     r11, r11, #0x72, 14
        smull   r10, r11, r11, r10
        ldr     r10, [pc, #0x454]
        str     r11, [sp, #0x50]
        add     r11, r4, #8
        sub     r10, r10, #0x3E, 16
        smull   r10, r3, r10, r3
        ldr     r10, [r0, +r9, lsl #2]
        ldr     r9, [sp, #0x58]
        and     r11, r11, #0xF
        str     r11, [sp]
        ldr     r7, [r7, +r11, lsl #2]
        ldr     r0, [r0, +r12, lsl #2]
        ldr     r12, [sp, #0x6C]
        ldr     r11, [sp, #0x68]
        sub     r9, r9, r1
        ldr     r1, [pc, #0x420]
        add     r12, r11, r12
        ldr     r11, [pc, #0x41C]
        smull   r1, r9, r1, r9
        ldr     r1, [pc, #0x418]
        smull   r11, r7, r11, r7
        mov     r11, #0xAE, 18
        orr     r11, r11, #0x19, 10
        smull   r11, r12, r11, r12
        smull   r1, r10, r1, r10
        ldr     r11, [sp, #0x4C]
        rsb     r1, r11, #0
        ldr     r11, [sp, #0x60]
        add     r11, r2, r11
        ldr     r2, [sp, #0x7C]
        sub     lr, r2, lr
        ldr     r2, [pc, #0x3EC]
        smull   r2, lr, r2, lr
        ldr     r2, [sp, #0x70]
        sub     r1, r1, r2
        ldr     r2, [sp, #0x78]
        add     r11, r2, r11
        ldr     r2, [sp, #0x54]
        sub     r1, r1, r2
        ldr     r2, [pc, #0x3B4]
        sub     r1, r1, r3
        ldr     r3, [sp, #0x74]
        sub     r2, r2, #0x63, 18
        smull   r2, r0, r2, r0
        ldr     r2, [sp, #0x50]
        add     r1, r3, r1
        ldr     r3, [sp, #0x48]
        add     r11, r2, r11
        add     r11, r9, r11
        add     r11, r12, r11
        add     r1, r8, r1
        add     r11, lr, r11
        add     r1, r10, r1
        add     r11, r7, r11
        add     r1, r0, r1
        add     r12, r11, #0x40
        add     r0, r1, #0x40
        mov     r12, r12, asr #7
        add     lr, sp, #0xAC
        str     r12, [lr]
        mov     r0, r0, asr #7
        add     r12, sp, #0xAC
        str     r0, [r12, #0x40]
        ldr     r0, [pc, #0x370]
        add     r3, r3, #0x11, 26
        mov     r12, #0xF
        add     r0, r0, #0xF, 26
        str     r4, [sp, #0x44]
        str     r6, [sp, #0x40]
        str     r5, [sp, #0x3C]
LGDO2:
        ldr     r9, [r0, #-0x384]
        ldr     r1, [sp, #0x44]
        ldr     lr, [r3, +r1, lsl #2]
        rsb     r1, r12, #0
        str     r1, [sp, #0x7C]
        ldr     r1, [sp, #0x34]
        ldr     r2, [sp, #0x7C]
        ldr     r6, [r0, #-0x304]
        ldr     r4, [r3, +r1, lsl #2]
        ldr     r1, [pc, #0x330]
        add     r5, r1, r2, lsl #2
        ldr     r1, [sp, #0x38]
        smull   r2, r7, lr, r9
        ldr     r8, [r5, #0x80]
        ldr     r11, [r5, #0x100]
        ldr     r10, [r3, +r1, lsl #2]
        ldr     r1, [sp, #0x30]
        ldr     r1, [r3, +r1, lsl #2]
        str     r7, [sp, #0x78]
        smull   r2, r7, r8, r4
        smull   r4, r9, r9, r4
        ldr     r2, [sp, #0x2C]
        smull   r8, lr, lr, r8
        str     r7, [sp, #0x74]
        ldr     r2, [r3, +r2, lsl #2]
        ldr     r7, [r0, #-0x284]
        str     lr, [sp, #0x70]
        smull   lr, r8, r6, r10
        ldr     lr, [sp, #0x28]
        str     r8, [sp, #0x6C]
        ldr     r8, [r5, #0x180]
        ldr     lr, [r3, +lr, lsl #2]
        str     r9, [sp, #0x68]
        smull   r4, r9, r11, r1
        smull   r1, r6, r6, r1
        ldr     r4, [sp, #0x24]
        smull   r11, r10, r10, r11
        str     r9, [sp, #0x64]
        ldr     r9, [r0, #-0x204]
        ldr     r4, [r3, +r4, lsl #2]
        str     r10, [sp, #0x60]
        smull   r10, r11, r7, r2
        ldr     r10, [sp, #0x20]
        str     r11, [sp, #0x5C]
        ldr     r11, [r5, #0x200]
        ldr     r10, [r3, +r10, lsl #2]
        str     r6, [sp, #0x58]
        smull   r1, r6, r8, lr
        ldr     r1, [sp, #0x1C]
        smull   r8, r2, r2, r8
        str     r6, [sp, #0x54]
        ldr     r6, [r0, #-0x184]
        ldr     r1, [r3, +r1, lsl #2]
        str     r2, [sp, #0x50]
        smull   lr, r2, r7, lr
        str     r2, [sp, #0x4C]
        smull   r2, lr, r9, r4
        smull   r4, r2, r4, r11
        str     lr, [sp, #0x48]
        str     r2, [sp, #0x80]
        smull   r11, r2, r11, r10
        str     r2, [sp, #0x84]
        smull   r10, r2, r9, r10
        str     r2, [sp, #0x88]
        ldr     r2, [sp, #0x18]
        ldr     r4, [r5, #0x280]
        ldr     lr, [r3, +r2, lsl #2]
        smull   r2, r7, r6, r1
        ldr     r2, [sp, #0x14]
        str     r7, [sp, #0x8C]
        smull   r1, r7, r1, r4
        smull   r4, r1, r4, lr
        ldr     r2, [r3, +r2, lsl #2]
        str     r7, [sp, #0x90]
        str     r1, [sp, #0x94]
        smull   lr, r1, r6, lr
        str     r1, [sp, #0x98]
        ldr     r6, [r0, #-0x104]
        ldr     r1, [sp, #0x10]
        ldr     r4, [r5, #0x300]
        smull   r7, r8, r6, r2
        ldr     lr, [r3, +r1, lsl #2]
        ldr     r1, [sp, #0xC]
        smull   r2, r7, r2, r4
        smull   r4, r2, r4, lr
        ldr     r1, [r3, +r1, lsl #2]
        str     r7, [sp, #0xA0]
        str     r8, [sp, #0x9C]
        str     r2, [sp, #0xA4]
        smull   lr, r2, r6, lr
        ldr     r9, [r5, #0x380]
        ldr     lr, [sp, #8]
        ldr     r8, [r0, #-0x84]
        ldr     r4, [r3, +lr, lsl #2]
        ldr     lr, [sp, #4]
        ldr     r7, [r3, +lr, lsl #2]
        smull   lr, r6, r8, r1
        smull   r1, lr, r1, r9
        smull   r9, r1, r9, r4
        smull   r4, r8, r8, r4
        str     r8, [sp, #0xA8]
        ldr     r8, [sp, #0x74]
        ldr     r9, [sp, #0x78]
        ldr     r4, [r0, #-4]!
        ldr     r10, [r5, #0x400]
        ldr     r5, [sp]
        sub     r8, r9, r8
        smull   r11, r9, r4, r7
        ldr     r11, [sp, #0x6C]
        ldr     r5, [r3, +r5, lsl #2]
        add     r3, r3, #0x40
        add     r8, r8, r11
        smull   r11, r7, r7, r10
        smull   r11, r10, r10, r5
        smull   r5, r4, r4, r5
        ldr     r5, [sp, #0x70]
        ldr     r11, [sp, #0x64]
        rsb     r5, r5, #0
        sub     r11, r8, r11
        ldr     r8, [sp, #0x68]
        sub     r8, r5, r8
        ldr     r5, [sp, #0x5C]
        add     r5, r11, r5
        ldr     r11, [sp, #0x60]
        add     r8, r11, r8
        ldr     r11, [sp, #0x54]
        sub     r5, r5, r11
        ldr     r11, [sp, #0x58]
        add     r8, r11, r8
        ldr     r11, [sp, #0x48]
        add     r5, r5, r11
        ldr     r11, [sp, #0x50]
        sub     r8, r8, r11
        ldr     r11, [sp, #0x84]
        sub     r5, r5, r11
        ldr     r11, [sp, #0x4C]
        sub     r8, r8, r11
        ldr     r11, [sp, #0x8C]
        add     r5, r5, r11
        ldr     r11, [sp, #0x80]
        add     r8, r11, r8
        ldr     r11, [sp, #0x94]
        sub     r5, r5, r11
        ldr     r11, [sp, #0x88]
        add     r8, r11, r8
        ldr     r11, [sp, #0x9C]
        add     r5, r5, r11
        ldr     r11, [sp, #0x90]
        sub     r8, r8, r11
        ldr     r11, [sp, #0xA4]
        sub     r5, r5, r11
        ldr     r11, [sp, #0x98]
        add     r6, r5, r6
        ldr     r5, [sp, #0xA0]
        sub     r8, r8, r11
        sub     r6, r6, r1
        ldr     r1, [sp, #0xA8]
        add     r8, r5, r8
        add     r8, r2, r8
        sub     r8, r8, lr
        add     r9, r6, r9
        sub     r8, r8, r1
        sub     r9, r9, r10
        add     r1, r9, #0x40
        add     r2, sp, #0xAC
        mov     r1, r1, asr #7
        str     r1, [r2, +r12, lsl #2]
        ldr     lr, [sp, #0x7C]
        add     r8, r7, r8
        add     r4, r4, r8
        add     r4, r4, #0x40
        add     r2, sp, #0xAC
        sub     r12, r12, #1
        mov     r1, r4, asr #7
        add     lr, r2, lr, lsl #2
        cmp     r12, #0
        str     r1, [lr, #0x80]
        bgt     LGDO2
        ldr     r6, [sp, #0x40]
        ldr     r5, [sp, #0x3C]
        mov     r0, #0xD5, 18
        mvn     r2, #0xFF
        sub     r3, r0, #0xDA, 18
        bic     r2, r2, #0x7F, 24
        mov     r0, #0
        mvn     r2, r2
        eor     r3, r3, #5, 18
        mov     r12, r0
LGDO3:
        add     lr, sp, #0xAC
        ldr     lr, [lr, +r12, lsl #2]
        cmp     r2, lr
        movlt   lr, r0, lsl #1
        strlth  r2, [r5, +lr]
        blt     LGDO4
        cmn     lr, #2, 18
        mov     r4, r0, lsl #1
        strgeh  lr, [r5, +r4]
        strlth  r3, [r5, +r4]
LGDO4:
        add     r12, r12, #1
        cmp     r12, #0x20
        add     r0, r0, r6
        blt     LGDO3
        mov     r0, #0
        add     sp, sp, #0x4B, 30
        ldmia   sp!, {r4 - r11, pc}
LGDO5:
        mvn     r0, #7
        add     sp, sp, #0x4B, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   0xfffec000
        .long   0xc17b4000
        .long   0xf6804000
        .long   0xfaf7c000
        .long   0x49478000
        .long   0xfe784000
        .long   0xdb63c000
        .long   LGDO__pDiQ30
        .long   0x4013c251
        .long   0x518522fb
        .long   0x56601ea7
        .long   0x5f4cf6eb
        .long   0x40b345bd
        .long   0x6d0b20cf
        .long   0x4fae3711
        .long   0x6b6fcf26
        .long   0x41fa2d6d
        .long   0x41d95790
        .long   0x4a9d9cf0
        .long   0x7c7d1db3
        .long   0x43f93421
        .long   0x2f7e46cb
        .long   0x46cc1bc4
        .long   0x256c0d4c
        .long   0x404f4672
        .long   0x519e4e04
        .long   0x42e13c10
        .long   0x52cb0e63
        .long   0x1b8f24b0
        .long   0x48919f44
        .long   0x10f8892a
        .long   0x64e2402e
        .long   0x4cf8de88
        .long   0x73326bbf
        .long   0x4140fb46
        .long   0x52036742
        .long   0x7641af3d
        .long   0x539eba45
        .long   0x5a82799a
        .long   0xbaba1611
LGDO__sDCTFwd32_MP3_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x69, 30
        ldr     r3, [r0]
        str     r3, [sp, #0x10]
        ldr     r3, [r0, #0x7C]
        str     r3, [sp, #4]
        ldr     r3, [r0, #0x3C]
        str     r3, [sp]
        ldr     r3, [r0, #0x40]
        str     r3, [sp, #0x14]
        ldr     r3, [r0, #0x1C]
        str     r3, [sp, #0x18]
        ldr     r3, [r0, #0x60]
        str     r3, [sp, #0x1C]
        ldr     lr, [r0, #0x20]
        ldr     r12, [r0, #4]
        ldr     r3, [r0, #0x5C]
        str     r1, [sp, #8]
        str     r2, [sp, #0xC]
        ldr     r2, [r0, #0x78]
        ldr     r7, [r0, #0x38]
        ldr     r11, [r0, #0x34]
        ldr     r4, [r0, #8]
        ldr     r6, [r0, #0x24]
        ldr     r10, [r0, #0x64]
        ldr     r1, [r0, #0x58]
        ldr     r8, [r0, #0x44]
        ldr     r5, [r0, #0x74]
        ldr     r9, [r0, #0x18]
        str     r11, [sp, #0x20]
        ldr     r11, [r0, #0x48]
        str     r11, [sp, #0x24]
        ldr     r11, [r0, #0x14]
        str     r11, [sp, #0x28]
        ldr     r11, [r0, #0x68]
        str     r11, [sp, #0x2C]
        ldr     r11, [r0, #0x28]
        str     r11, [sp, #0x30]
        ldr     r11, [r0, #0x54]
        str     r11, [sp, #0x34]
        ldr     r11, [r0, #0xC]
        str     r11, [sp, #0x38]
        ldr     r11, [r0, #0x70]
        str     r11, [sp, #0x3C]
        ldr     r11, [r0, #0x30]
        str     r11, [sp, #0x40]
        ldr     r11, [r0, #0x4C]
        str     r11, [sp, #0x44]
        ldr     r11, [r0, #0x10]
        str     r11, [sp, #0x48]
        ldr     r11, [r0, #0x6C]
        str     r11, [sp, #0x4C]
        ldr     r11, [r0, #0x2C]
        str     r11, [sp, #0x50]
        ldr     r0, [r0, #0x50]
        ldr     r11, [sp, #0x10]
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #4]
        sub     r11, r11, r0
        ldr     r0, [sp, #0x14]
        str     r11, [sp, #0x58]
        ldr     r11, [sp]
        sub     r11, r11, r0
        ldr     r0, [sp, #0x1C]
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #0x18]
        sub     r11, r11, r0
        sub     r0, lr, r3
        str     r0, [sp, #0x64]
        sub     r0, r12, r2
        str     r0, [sp, #0x68]
        sub     r0, r7, r8
        str     r0, [sp, #0x6C]
        str     r11, [sp, #0x60]
        ldr     r11, [sp, #0x20]
        sub     r0, r9, r10
        str     r0, [sp, #0x70]
        sub     r0, r6, r1
        str     r0, [sp, #0x74]
        sub     r0, r4, r5
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x24]
        add     r8, r7, r8
        add     r3, lr, r3
        sub     r11, r11, r0
        ldr     lr, [sp, #0x4C]
        str     r11, [sp, #0x7C]
        ldr     r11, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        add     r2, r12, r2
        add     r1, r6, r1
        sub     r11, r11, r0
        ldr     r0, [sp, #0x34]
        str     r11, [sp, #0x80]
        ldr     r11, [sp, #0x30]
        add     r6, r4, r5
        sub     r11, r11, r0
        ldr     r0, [sp, #0x3C]
        str     r11, [sp, #0x84]
        ldr     r11, [sp, #0x38]
        sub     r11, r11, r0
        ldr     r0, [sp, #0x44]
        str     r11, [sp, #0x88]
        ldr     r11, [sp, #0x40]
        sub     r11, r11, r0
        str     r11, [sp, #0x8C]
        ldr     r11, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        sub     r11, r11, r0
        str     r11, [sp, #0x90]
        ldr     r11, [sp, #0x50]
        ldr     r0, [sp, #0x54]
        sub     r11, r11, r0
        ldr     r0, [sp, #0x58]
        str     r11, [sp, #0x94]
        ldr     r11, [pc, #-0x254]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x5C]
        str     r11, [sp, #0x58]
        ldr     r11, [pc, #-0x264]
        mov     r0, r0, lsl #5
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x60]
        str     r11, [sp, #0x5C]
        ldr     r11, [pc, #-0x274]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x64]
        str     r11, [sp, #0x60]
        ldr     r11, [pc, #-0x284]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        str     r11, [sp, #0x64]
        ldr     r0, [sp, #0x68]
        ldr     r11, [pc, #-0x294]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x6C]
        str     r11, [sp, #0x68]
        ldr     r11, [pc, #-0x2A4]
        mov     r0, r0, lsl #3
        smull   r0, r11, r11, r0
        str     r11, [sp, #0x6C]
        ldr     r0, [sp, #0x70]
        ldr     r11, [pc, #-0x2B4]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x74]
        str     r11, [sp, #0x70]
        ldr     r11, [pc, #-0x2C4]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        str     r11, [sp, #0x74]
        ldr     r0, [sp, #0x78]
        ldr     r11, [pc, #-0x2D4]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x7C]
        str     r11, [sp, #0x78]
        ldr     r11, [pc, #-0x2E4]
        mov     r0, r0, lsl #3
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x80]
        str     r11, [sp, #0x7C]
        ldr     r11, [pc, #-0x2F4]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x84]
        str     r11, [sp, #0x80]
        ldr     r11, [pc, #-0x304]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        str     r11, [sp, #0x84]
        ldr     r0, [sp, #0x88]
        ldr     r11, [pc, #-0x314]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x8C]
        str     r11, [sp, #0x88]
        ldr     r11, [pc, #-0x324]
        mov     r0, r0, lsl #3
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x90]
        str     r11, [sp, #0x8C]
        ldr     r11, [pc, #-0x334]
        mov     r0, r0, lsl #1
        smull   r0, r11, r11, r0
        str     r11, [sp, #0x90]
        ldr     r0, [sp, #0x94]
        ldr     r11, [pc, #-0x344]
        mov     r0, r0, lsl #3
        smull   r0, r11, r11, r0
        ldr     r0, [sp, #0x10]
        str     r11, [sp, #0x94]
        ldr     r11, [sp, #4]
        str     r2, [sp, #4]
        add     r2, r9, r10
        ldr     r10, [sp, #0x58]
        add     r11, r0, r11
        str     r11, [sp, #0x10]
        ldr     r0, [sp]
        ldr     r11, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        str     r8, [sp]
        ldr     r8, [sp, #0x54]
        add     r11, r0, r11
        ldr     r0, [sp, #0x18]
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #0x1C]
        str     r3, [sp, #0x18]
        ldr     r3, [sp, #0x24]
        add     r11, r0, r11
        ldr     r0, [sp, #0x20]
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #4]
        add     r7, r0, r3
        ldr     r0, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        add     r4, r0, r3
        ldr     r0, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        add     r5, r0, r3
        ldr     r0, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        add     r12, r0, r3
        ldr     r3, [sp, #0x44]
        ldr     r0, [sp, #0x40]
        add     r0, r0, r3
        ldr     r3, [sp, #0x48]
        add     lr, r3, lr
        ldr     r3, [sp, #0x50]
        add     r3, r3, r8
        ldr     r8, [sp, #0x14]
        str     r3, [sp, #0x54]
        sub     r3, lr, r3
        sub     r8, r9, r8
        ldr     r9, [sp, #0x5C]
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #0x94]
        sub     r10, r10, r9
        str     r10, [sp, #0x50]
        ldr     r10, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        mov     r8, r8, lsl #1
        sub     r10, r10, r9
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x60]
        ldr     r9, [sp, #0x64]
        sub     r9, r10, r9
        ldr     r10, [sp]
        mov     r9, r9, lsl #4
        sub     r11, r11, r10
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x68]
        ldr     r10, [sp, #0x6C]
        sub     r11, r11, r10
        sub     r10, r2, r1
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x74]
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x70]
        add     r2, r2, r1
        ldr     r1, [sp, #0x70]
        sub     r11, r11, r10
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x78]
        sub     r10, r6, r7
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x7C]
        add     r7, r6, r7
        ldr     r6, [sp, #0x78]
        sub     r11, r11, r10
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x80]
        sub     r10, r4, r5
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x84]
        add     r5, r4, r5
        ldr     r4, [sp, #0x80]
        sub     r11, r11, r10
        str     r11, [sp, #0x2C]
        sub     r10, r12, r0
        str     r10, [sp, #0x28]
        ldr     r11, [sp, #0x88]
        ldr     r10, [sp, #0x8C]
        add     r12, r12, r0
        ldr     r0, [sp, #0x88]
        sub     r11, r11, r10
        ldr     r10, [sp, #0x90]
        str     r11, [sp, #0x24]
        add     r11, sp, #0x49, 30
        sub     r10, r10, r3
        ldr     r3, [pc, #-0x4DC]
        str     r10, [sp, #0x98]
        smull   r8, r3, r3, r8
        ldr     r8, [pc, #-0x4E8]
        str     r3, [sp, #0x9C]
        ldr     r3, [sp, #0x50]
        mov     r3, r3, lsl #1
        smull   r3, r8, r8, r3
        str     r8, [sp, #0x50]
        ldr     r3, [sp, #0x4C]
        ldr     r8, [pc, #-0x500]
        mov     r3, r3, lsl #4
        smull   r3, r8, r8, r3
        ldr     r3, [pc, #-0x50C]
        str     r8, [sp, #0x4C]
        ldr     r8, [pc, #-0x510]
        smull   r9, r3, r3, r9
        ldr     r9, [pc, #-0x514]
        str     r3, [sp, #0xA0]
        ldr     r3, [sp, #0x48]
        mov     r3, r3, lsl #1
        smull   r3, r8, r8, r3
        str     r8, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        ldr     r8, [pc, #-0x534]
        mov     r3, r3, lsl #1
        smull   r3, r8, r8, r3
        ldr     r3, [sp, #0x40]
        str     r8, [sp, #0x44]
        ldr     r8, [pc, #-0x540]
        mov     r3, r3, lsl #4
        smull   r3, r8, r8, r3
        str     r8, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        ldr     r8, [pc, #-0x554]
        mov     r3, r3, lsl #4
        smull   r3, r8, r8, r3
        ldr     r3, [sp, #0x38]
        str     r8, [sp, #0x3C]
        ldr     r8, [pc, #-0x564]
        mov     r3, r3, lsl #1
        smull   r3, r8, r8, r3
        ldr     r3, [sp, #0x34]
        str     r8, [sp, #0x38]
        ldr     r8, [pc, #-0x578]
        mov     r3, r3, lsl #1
        smull   r3, r8, r8, r3
        ldr     r3, [sp, #0x30]
        str     r8, [sp, #0x34]
        ldr     r8, [pc, #-0x588]
        mov     r3, r3, lsl #4
        smull   r3, r8, r8, r3
        ldr     r3, [sp, #0x2C]
        str     r8, [sp, #0x30]
        ldr     r8, [pc, #-0x59C]
        mov     r3, r3, lsl #4
        smull   r8, r3, r8, r3
        ldr     r8, [sp, #0x28]
        mov     r8, r8, lsl #1
        smull   r8, r9, r9, r8
        ldr     r8, [sp, #0x24]
        str     r9, [sp, #0x2C]
        ldr     r9, [pc, #-0x5C8]
        mov     r8, r8, lsl #1
        smull   r8, r9, r9, r8
        ldr     r8, [sp, #0x20]
        str     r9, [sp, #0x28]
        ldr     r9, [pc, #-0x5CC]
        mov     r8, r8, lsl #1
        smull   r8, r9, r9, r8
        ldr     r8, [sp, #0x98]
        str     r9, [sp, #0x24]
        ldr     r9, [pc, #-0x5E0]
        mov     r8, r8, lsl #1
        smull   r8, r9, r9, r8
        ldr     r8, [sp, #0x10]
        str     r9, [sp, #0x98]
        ldr     r9, [sp, #0x14]
        add     r9, r8, r9
        str     r9, [sp, #0x20]
        ldr     r8, [sp, #0x58]
        ldr     r9, [sp, #0x5C]
        ldr     r10, [sp, #0x20]
        add     r9, r8, r9
        ldr     r8, [sp, #0x1C]
        str     r9, [sp, #0x5C]
        ldr     r9, [sp, #0x18]
        add     r9, r8, r9
        str     r9, [sp, #0x58]
        ldr     r9, [sp, #0x64]
        ldr     r8, [sp, #0x60]
        add     r9, r8, r9
        str     r9, [sp, #0x64]
        ldr     r9, [sp]
        ldr     r8, [sp, #4]
        add     r9, r8, r9
        ldr     r8, [sp, #0x68]
        str     r9, [sp, #0x60]
        ldr     r9, [sp, #0x6C]
        add     r9, r8, r9
        ldr     r8, [sp, #0x74]
        str     r9, [sp, #0x6C]
        ldr     r9, [sp, #0x94]
        add     r1, r1, r8
        ldr     r8, [sp, #0x7C]
        add     r6, r6, r8
        ldr     r8, [sp, #0x84]
        add     r4, r4, r8
        ldr     r8, [sp, #0x8C]
        add     r8, r0, r8
        ldr     r0, [sp, #0x54]
        add     lr, lr, r0
        ldr     r0, [sp, #0x90]
        str     r10, [r11]
        ldr     r10, [sp, #0x9C]
        add     r11, sp, #0x49, 30
        add     r9, r0, r9
        mov     r0, #0
        str     r10, [r11, #0x20]
        ldr     r10, [sp, #0x5C]
        add     r11, sp, #0x49, 30
        str     r10, [r11, #0x40]
        ldr     r10, [sp, #0x50]
        add     r11, sp, #0x49, 30
        str     r10, [r11, #0x60]
        ldr     r10, [sp, #0x58]
        add     r11, sp, #0x49, 30
        str     r10, [r11, #0x1C]
        ldr     r10, [sp, #0x4C]
        add     r11, sp, #0x49, 30
        str     r10, [r11, #0x3C]
        ldr     r10, [sp, #0x64]
        add     r11, sp, #0x49, 30
        str     r10, [r11, #0x5C]
        ldr     r10, [sp, #0xA0]
        add     r11, sp, #0x49, 30
        str     r10, [r11, #0x7C]
        ldr     r10, [sp, #0x60]
        add     r11, sp, #0x49, 30
        str     r10, [r11, #4]
        ldr     r10, [sp, #0x48]
        add     r11, sp, #0x49, 30
        str     r10, [r11, #0x24]
        ldr     r10, [sp, #0x6C]
        add     r11, sp, #0x49, 30
        str     r10, [r11, #0x44]
        ldr     r10, [sp, #0x44]
        add     r11, sp, #0x49, 30
        str     r10, [r11, #0x64]
        add     r10, sp, #0x49, 30
        str     r2, [r10, #0x18]
        ldr     r2, [sp, #0x40]
        add     r10, sp, #0x49, 30
        str     r2, [r10, #0x38]
        add     r2, sp, #0x49, 30
        str     r1, [r2, #0x58]
        ldr     r1, [sp, #0x3C]
        add     r2, sp, #0x49, 30
        str     r1, [r2, #0x78]
        add     r1, sp, #0x49, 30
        str     r7, [r1, #8]
        ldr     r1, [sp, #0x38]
        add     r2, sp, #0x49, 30
        str     r1, [r2, #0x28]
        add     r1, sp, #0x49, 30
        str     r6, [r1, #0x48]
        ldr     r1, [sp, #0x34]
        add     r2, sp, #0x49, 30
        str     r1, [r2, #0x68]
        add     r1, sp, #0x49, 30
        str     r5, [r1, #0x14]
        ldr     r1, [sp, #0x30]
        add     r2, sp, #0x49, 30
        str     r1, [r2, #0x34]
        add     r1, sp, #0x49, 30
        str     r4, [r1, #0x54]
        add     r1, sp, #0x49, 30
        str     r3, [r1, #0x74]
        add     r1, sp, #0x49, 30
        str     r12, [r1, #0xC]
        ldr     r1, [sp, #0x2C]
        add     r2, sp, #0x49, 30
        str     r1, [r2, #0x2C]
        add     r1, sp, #0x49, 30
        str     r8, [r1, #0x4C]
        ldr     r1, [sp, #0x28]
        add     r2, sp, #0x49, 30
        str     r1, [r2, #0x6C]
        add     r1, sp, #0x49, 30
        str     lr, [r1, #0x10]
        ldr     r1, [sp, #0x24]
        add     r2, sp, #0x49, 30
        str     r1, [r2, #0x30]
        add     r1, sp, #0x49, 30
        str     r9, [r1, #0x50]
        ldr     r1, [sp, #0x98]
        add     r2, sp, #0x49, 30
        str     r1, [r2, #0x70]
        mov     r2, r0
LGDO6:
        ldr     r11, [pc, #-0x7D8]
        add     r1, sp, #0x49, 30
        add     r7, r1, r0
        ldr     r4, [r7, #0x18]
        ldr     r5, [r7, #4]
        ldr     r9, [r7, #0xC]
        ldr     lr, [r7, #8]
        ldr     r12, [r7, #0x14]
        ldr     r1, [r1, +r2, lsl #2]
        ldr     r6, [r7, #0x10]
        ldr     r3, [r7, #0x1C]
        str     r9, [sp, #0xA0]
        sub     r8, r5, r4
        sub     r7, lr, r12
        sub     r10, r1, r3
        mov     r8, r8, lsl #1
        smull   r11, r8, r11, r8
        ldr     r11, [pc, #-0x818]
        mov     r7, r7, lsl #1
        mov     r10, r10, lsl #1
        smull   r11, r7, r11, r7
        ldr     r11, [pc, #-0x824]
        sub     r9, r9, r6
        smull   r10, r11, r11, r10
        ldr     r10, [pc, #-0x82C]
        str     r11, [sp, #0x9C]
        mov     r9, r9, lsl #3
        smull   r9, r10, r10, r9
        str     r10, [sp, #0x98]
        ldr     r11, [sp, #0x98]
        add     r10, r5, r4
        str     r10, [sp, #0x8C]
        add     r10, lr, r12
        str     r10, [sp, #0x88]
        sub     r10, r8, r7
        str     r10, [sp, #0x84]
        ldr     r10, [sp, #0x9C]
        add     r9, r3, r1
        str     r9, [sp, #0x94]
        ldr     r9, [sp, #0xA0]
        sub     r10, r10, r11
        ldr     r11, [sp, #0x84]
        str     r10, [sp, #0x80]
        ldr     r10, [sp, #0x94]
        add     r9, r6, r9
        str     r9, [sp, #0x90]
        add     r7, r8, r7
        sub     r10, r10, r9
        str     r10, [sp, #0x7C]
        ldr     r9, [sp, #0x8C]
        ldr     r10, [sp, #0x88]
        add     r1, r5, r1
        ldr     r5, [sp, #0xA0]
        add     r6, r12, r6
        sub     r9, r9, r10
        ldr     r10, [sp, #0x80]
        add     lr, lr, r5
        add     r3, r4, r3
        add     lr, r1, lr
        sub     r10, r10, r11
        str     r10, [sp, #0x78]
        ldr     r10, [sp, #0x98]
        ldr     r11, [sp, #0x9C]
        ldr     r8, [sp, #0x78]
        add     r6, r6, r3
        add     r12, lr, r6
        add     r10, r11, r10
        str     r10, [sp, #0x9C]
        ldr     r10, [pc, #-0x8D8]
        ldr     r11, [pc, #-0x8D8]
        mov     r8, r8, lsl #1
        smull   r8, r10, r10, r8
        ldr     r8, [sp, #0x7C]
        ldr     lr, [pc, #-0x8E4]
        sub     r8, r8, r9
        str     r8, [sp, #0x98]
        ldr     r8, [sp, #0x84]
        mov     r9, r9, lsl #2
        mov     r8, r8, lsl #2
        smull   r8, r11, r11, r8
        ldr     r8, [sp, #0x9C]
        str     r11, [sp, #0x84]
        ldr     r11, [sp, #0x94]
        sub     r8, r8, r7
        str     r8, [sp, #0x78]
        ldr     r8, [sp, #0x90]
        add     r8, r11, r8
        str     r8, [sp, #0x94]
        ldr     r8, [sp, #0x88]
        ldr     r11, [sp, #0x8C]
        ldr     r1, [sp, #0x94]
        add     r8, r11, r8
        str     r8, [sp, #0x90]
        ldr     r8, [sp, #0x80]
        ldr     r11, [pc, #-0x934]
        ldr     r3, [sp, #0x90]
        mov     r8, r8, lsl #1
        smull   r8, r11, r11, r8
        ldr     r8, [sp, #0x98]
        str     r11, [sp, #0x8C]
        ldr     r11, [pc, #-0x958]
        mov     r8, r8, lsl #1
        sub     r3, r1, r3
        smull   r8, r11, r11, r8
        ldr     r8, [sp, #0x7C]
        str     r11, [sp, #0x98]
        ldr     r11, [pc, #-0x964]
        mov     r8, r8, lsl #1
        ldr     r1, [sp, #0x84]
        smull   r8, r11, r11, r8
        ldr     r8, [pc, #-0x97C]
        str     r11, [sp, #0x88]
        ldr     r11, [pc, #-0x980]
        add     r1, r10, r1
        smull   r8, r9, r8, r9
        add     r8, sp, #0xA4
        add     r8, r8, r0
        str     r8, [sp, #0x80]
        ldr     r8, [sp, #0x78]
        mov     r3, r3, lsl #1
        smull   lr, r3, lr, r3
        add     lr, sp, #0xA4
        str     r12, [lr, +r2, lsl #2]
        ldr     r12, [sp, #0x8C]
        ldr     lr, [sp, #0x88]
        ldr     r5, [sp, #0x80]
        add     r10, r10, r12
        ldr     r12, [sp, #0x9C]
        mov     r8, r8, lsl #1
        smull   r11, r8, r11, r8
        add     r2, r2, #8
        add     r7, r12, r7
        ldr     r12, [sp, #0x98]
        add     r4, r8, r10
        cmp     r2, #0x20
        str     r3, [r5, #0x10]
        add     r9, r12, r9
        add     r12, r12, lr
        add     lr, r7, r1
        add     r1, r8, r1
        str     r9, [r5, #8]
        str     r12, [r5, #0x18]
        str     lr, [r5, #4]
        str     r4, [r5, #0x14]
        str     r1, [r5, #0xC]
        str     r10, [r5, #0x1C]
        add     r0, r0, #0x20
        blt     LGDO6
        ldr     r12, [sp, #0xC]
        add     r0, sp, #0xA4
        and     r1, r12, #1
        str     r1, [sp, #0xA0]
        eor     r3, r1, #1
        ldr     lr, [r0, #0x7C]
        ldr     r1, [r0, #0x78]
        rsb     r9, r3, r3, lsl #5
        add     r3, sp, #0xA4
        str     r1, [sp, #0x9C]
        ldr     r1, [r0, #0x70]
        ldr     r2, [r0, #0x74]
        str     r1, [sp, #0x10]
        ldr     r1, [r0, #0x3C]
        str     r1, [sp, #0x98]
        ldr     r4, [r0, #0x5C]
        ldr     r5, [r0, #0x38]
        ldr     r6, [r0, #0x58]
        ldr     r7, [r0, #0x34]
        ldr     r8, [r0, #0x54]
        ldr     r1, [r0, #0x30]
        ldr     r0, [r0, #0x50]
        ldr     r10, [r3, #0x1C]
        str     r10, [sp, #0x94]
        ldr     r10, [r3, #0x18]
        str     r10, [sp, #0x90]
        ldr     r3, [r3, #0x14]
        add     r10, sp, #0xA4
        str     r3, [sp, #0x8C]
        ldr     r10, [r10, #0x10]
        ldr     r3, [sp, #8]
        str     r10, [sp, #0x88]
        mov     r10, r12, lsl #2
        str     r10, [sp, #0x84]
        add     r9, r3, r9, lsl #5
        add     r9, r9, #0x60
        str     lr, [r9, +r12, lsl #2]
        ldr     r11, [sp, #0x9C]
        add     r9, r9, r10
        add     r10, lr, r11
        add     r11, r11, r2
        str     r11, [sp, #0x9C]
        ldr     r11, [sp, #0x10]
        add     lr, lr, r4
        add     r4, r10, r4
        add     r2, r2, r11
        ldr     r11, [sp, #0xA0]
        add     r10, r10, r6
        rsb     r11, r11, r11, lsl #5
        str     r11, [sp, #0xA0]
        ldr     r11, [sp, #0x98]
        str     r11, [r9, #0x40]
        ldr     r11, [sp, #0xA0]
        add     r11, r3, r11, lsl #5
        str     r11, [sp, #0xA0]
        str     lr, [r9, #0x80]
        ldr     lr, [sp, #0x94]
        str     lr, [r9, #0xC0]
        ldr     lr, [sp, #0x98]
        str     r4, [r9, #0x100]
        str     r10, [r9, #0x180]
        add     lr, lr, r5
        str     lr, [r9, #0x140]
        ldr     lr, [sp, #0x90]
        add     r5, r5, r7
        add     r7, r7, r1
        str     lr, [r9, #0x1C0]
        ldr     lr, [sp, #0x9C]
        str     r5, [r9, #0x240]
        mov     r10, #3
        add     r6, lr, r6
        str     r6, [r9, #0x200]
        ldr     lr, [sp, #0x9C]
        mov     r6, #0xC
        add     lr, lr, r8
        str     lr, [r9, #0x280]
        ldr     lr, [sp, #0x8C]
        add     r8, r2, r8
        add     r2, r2, r0
        str     r2, [r9, #0x380]
        str     lr, [r9, #0x2C0]
        str     r8, [r9, #0x300]
        str     r7, [r9, #0x340]
        ldr     r2, [sp, #0x88]
        mov     r9, #0x10
        str     r2, [r3, +r12, lsl #2]
        ldr     r2, [sp, #0xA0]
        add     r12, r2, #0x3E, 28
        ldr     r2, [sp, #0x84]
        sub     lr, r2, #0x40
        add     r8, r12, lr
        str     lr, [sp, #8]
        ldr     lr, [sp, #0x10]
        sub     r3, r2, #0xC0
        sub     r2, r2, #0x80
        add     r3, r12, r3
        add     r7, r12, r2
        str     r3, [sp]
        str     r2, [sp, #4]
LGDO7:
        add     r2, sp, #0xA4
        add     r2, r2, r6
        ldr     r5, [r2, #0x60]
        ldr     r4, [r2, #0x20]
        ldr     r11, [sp, #0xC]
        ldr     r3, [r2, #0x40]
        add     lr, lr, r5
        add     r0, lr, r0
        rsb     r0, r0, #0
        str     r0, [r12, +r11, lsl #2]
        add     r1, r1, r4
        rsb     r0, r1, #0
        str     r0, [r8], #-0x100
        add     lr, lr, r3
        rsb     r0, lr, #0
        str     r0, [r7], #-0x100
        add     r2, sp, #0xA4
        ldr     r2, [r2, +r10, lsl #2]
        ldr     r0, [sp]
        add     r9, r9, #4
        rsb     r2, r2, #0
        cmp     r9, #0x1C
        str     r2, [r0], #-0x100
        str     r0, [sp]
        sub     r6, r6, #4
        sub     r12, r12, #1, 24
        sub     r10, r10, #1
        mov     lr, r5
        mov     r1, r4
        mov     r0, r3
        blt     LGDO7
        ldr     r2, [sp, #4]
        ldr     lr, [sp, #8]
        add     r7, sp, #0xA4
        ldr     r0, [sp, #0xC]
        add     r6, r7, r10, lsl #2
        ldr     r10, [r7, +r10, lsl #2]
        ldr     r8, [r6, #0x60]
        ldr     r7, [r6, #0x20]
        ldr     r6, [r6, #0x40]
        add     r5, r5, r8
        add     r3, r5, r3
        mov     r1, r0, asr #1
        rsb     r3, r3, #0
        add     r7, r4, r7
        str     r3, [r12, +r0, lsl #2]
        rsb     r7, r7, #0
        str     r7, [lr, +r12]
        add     r6, r5, r6
        mov     r1, r1, lsl #2
        rsb     r0, r6, #0
        str     r0, [r2, +r12]
        rsb     r10, r10, #0
        sub     r1, r1, #0xA0
        str     r10, [r12, +r1]
        add     sp, sp, #0x69, 30
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LGDO__pDiQ30:
        .byte   0x00,0x00,0x00,0x00,0x00,0xC0,0xFF,0xFF,0x00,0xC0,0xFF,0xFF,0x00,0xC0,0xFF,0xFF
        .byte   0x00,0xC0,0xFF,0xFF,0x00,0xC0,0xFF,0xFF,0x00,0xC0,0xFF,0xFF,0x00,0x80,0xFF,0xFF
        .byte   0x00,0x80,0xFF,0xFF,0x00,0x80,0xFF,0xFF,0x00,0x80,0xFF,0xFF,0x00,0x40,0xFF,0xFF
        .byte   0x00,0x40,0xFF,0xFF,0x00,0x00,0xFF,0xFF,0x00,0x00,0xFF,0xFF,0x00,0xC0,0xFE,0xFF
        .byte   0x00,0xC0,0xFE,0xFF,0x00,0x80,0xFE,0xFF,0xFF,0x3F,0xFE,0xFF,0xFF,0x3F,0xFE,0xFF
        .byte   0x00,0x00,0xFE,0xFF,0x00,0xC0,0xFD,0xFF,0x00,0x80,0xFD,0xFF,0x00,0x40,0xFD,0xFF
        .byte   0x00,0xC0,0xFC,0xFF,0x00,0x80,0xFC,0xFF,0x00,0x00,0xFC,0xFF,0x00,0xC0,0xFB,0xFF
        .byte   0x00,0x40,0xFB,0xFF,0x00,0xC0,0xFA,0xFF,0x00,0x00,0xFA,0xFF,0xFF,0x7F,0xF9,0xFF
        .byte   0x00,0xC0,0xF8,0xFF,0x00,0x40,0xF8,0xFF,0x00,0x40,0xF7,0xFF,0x00,0x80,0xF6,0xFF
        .byte   0x00,0xC0,0xF5,0xFF,0xFF,0xBF,0xF4,0xFF,0x00,0xC0,0xF3,0xFF,0x00,0xC0,0xF2,0xFF
        .byte   0x00,0x80,0xF1,0xFF,0x00,0x40,0xF0,0xFF,0x00,0x00,0xEF,0xFF,0x00,0xC0,0xED,0xFF
        .byte   0x00,0x40,0xEC,0xFF,0x00,0xC0,0xEA,0xFF,0x00,0x40,0xE9,0xFF,0x00,0xC0,0xE7,0xFF
        .byte   0x00,0x00,0xE6,0xFF,0x00,0x40,0xE4,0xFF,0x00,0xC0,0xE2,0xFF,0x00,0xC0,0xE0,0xFF
        .byte   0x00,0x00,0xDF,0xFF,0x00,0x40,0xDD,0xFF,0x00,0x40,0xDB,0xFF,0xFF,0x7F,0xD9,0xFF
        .byte   0x00,0xC0,0xD7,0xFF,0x00,0xC0,0xD5,0xFF,0x00,0x00,0xD4,0xFF,0x00,0x40,0xD2,0xFF
        .byte   0x00,0x80,0xD0,0xFF,0x00,0x00,0xCF,0xFF,0x00,0x80,0xCD,0xFF,0x00,0x00,0xCC,0xFF
        .byte   0x00,0x40,0x35,0x00,0x00,0x80,0x36,0x00,0x00,0x80,0x37,0x00,0x00,0x40,0x38,0x00
        .byte   0x00,0xC0,0x38,0x00,0x00,0x00,0x39,0x00,0x00,0x00,0x39,0x00,0x00,0xC0,0x38,0x00
        .byte   0x00,0x00,0x38,0x00,0x00,0x40,0x37,0x00,0x00,0xC0,0x35,0x00,0x00,0x00,0x34,0x00
        .byte   0x00,0x00,0x32,0x00,0x00,0x40,0x2F,0x00,0x00,0x40,0x2C,0x00,0x00,0xC0,0x28,0x00
        .byte   0x00,0x80,0x24,0x00,0x00,0xC0,0x1F,0x00,0x00,0x80,0x1A,0x00,0xFF,0xBF,0x14,0x00
        .byte   0x00,0x40,0x0E,0x00,0x00,0x40,0x07,0x00,0x00,0x80,0xFF,0xFF,0x00,0x00,0xF7,0xFF
        .byte   0x00,0x00,0xEE,0xFF,0x00,0x40,0xE4,0xFF,0x00,0xC0,0xD9,0xFF,0x00,0xC0,0xCE,0xFF
        .byte   0xFF,0xFF,0xC2,0xFF,0x00,0x80,0xB6,0xFF,0x00,0x40,0xA9,0xFF,0x00,0xC0,0x9B,0xFF
        .byte   0x00,0x40,0x8D,0xFF,0xFF,0x3F,0x7E,0xFF,0x00,0xC0,0x6E,0xFF,0x00,0xC0,0x5E,0xFF
        .byte   0x00,0x40,0x4E,0xFF,0x00,0x40,0x3D,0xFF,0x00,0x00,0x2C,0xFF,0x00,0x40,0x1A,0xFF
        .byte   0x00,0x40,0x08,0xFF,0x00,0x00,0xF6,0xFE,0x00,0xC0,0xE3,0xFE,0x00,0x80,0xD1,0xFE
        .byte   0x00,0x40,0xBF,0xFE,0x00,0x00,0xAD,0xFE,0x00,0x00,0x9B,0xFE,0x00,0x80,0x89,0xFE
        .byte   0x00,0x40,0x78,0xFE,0x00,0x80,0x67,0xFE,0x00,0x80,0x57,0xFE,0x00,0x40,0x48,0xFE
        .byte   0x00,0xC0,0x39,0xFE,0x00,0x80,0x2C,0xFE,0x00,0x40,0x20,0xFE,0x00,0x80,0x15,0xFE
        .byte   0x00,0xC0,0x0B,0xFE,0x00,0x00,0x04,0xFE,0x00,0xC0,0xFD,0xFD,0x00,0x40,0xF9,0xFD
        .byte   0x00,0xC0,0xF6,0xFD,0x00,0x40,0xF6,0xFD,0x00,0x00,0xF8,0xFD,0x00,0x40,0xFC,0xFD
        .byte   0x00,0x40,0xFD,0x01,0x00,0x00,0xF4,0x01,0x00,0x00,0xE8,0x01,0x00,0x40,0xD9,0x01
        .byte   0x00,0x80,0xC7,0x01,0x00,0xC0,0xB2,0x01,0x00,0x00,0x9B,0x01,0x00,0xC0,0x7F,0x01
        .byte   0x00,0x80,0x61,0x01,0x00,0x00,0x40,0x01,0x00,0xC0,0x1A,0x01,0x00,0x80,0xF2,0x00
        .byte   0x01,0x80,0xC6,0x00,0x00,0x40,0x97,0x00,0x00,0x80,0x64,0x00,0x00,0x40,0x2E,0x00
        .byte   0xFF,0xBF,0xF4,0xFF,0x00,0x00,0xB8,0xFF,0x00,0xC0,0x77,0xFF,0x00,0x80,0x34,0xFF
        .byte   0x00,0x40,0xEE,0xFE,0x00,0x00,0xA5,0xFE,0x00,0x00,0x59,0xFE,0x00,0x80,0x0A,0xFE
        .byte   0xFF,0x7F,0xB9,0xFD,0x00,0x40,0x66,0xFD,0x00,0x00,0x11,0xFD,0x00,0x40,0xBA,0xFC
        .byte   0x01,0xC0,0x61,0xFC,0x00,0x40,0x08,0xFC,0x00,0xC0,0xAD,0xFB,0x00,0x00,0x53,0xFB
        .byte   0x00,0xC0,0xF7,0xFA,0x00,0xC0,0x9C,0xFA,0x00,0x40,0x42,0xFA,0x00,0xC0,0xE8,0xF9
        .byte   0x00,0xC0,0x90,0xF9,0x00,0x40,0x3A,0xF9,0x00,0x40,0xE6,0xF8,0xFF,0xBF,0x94,0xF8
        .byte   0x01,0x80,0x46,0xF8,0x00,0xC0,0xFB,0xF7,0x00,0x40,0xB5,0xF7,0x00,0x40,0x73,0xF7
        .byte   0x00,0x80,0x36,0xF7,0x00,0x40,0xFF,0xF6,0x00,0x00,0xCE,0xF6,0x00,0xC0,0xA3,0xF6
        .byte   0x00,0x40,0x80,0xF6,0x00,0x80,0x64,0xF6,0x00,0x00,0x51,0xF6,0x00,0x40,0x46,0xF6
        .byte   0x00,0x80,0x44,0xF6,0x00,0x40,0x4C,0xF6,0xFF,0x3F,0x5E,0xF6,0x00,0x80,0x7A,0xF6
        .byte   0x00,0x00,0xA2,0xF6,0xFF,0xBF,0xD4,0xF6,0x00,0x40,0x13,0xF7,0x00,0x00,0x5E,0xF7
        .byte   0x00,0x00,0xB5,0xF7,0x00,0x00,0x19,0xF8,0x00,0x00,0x8A,0xF8,0x00,0x80,0x08,0xF9
        .byte   0x00,0x80,0x6B,0x06,0x00,0xC0,0xD1,0x05,0x00,0x00,0x2A,0x05,0x00,0x40,0x74,0x04
        .byte   0xFF,0xFF,0xAF,0x03,0x00,0xC0,0xDD,0x02,0x00,0x40,0xFD,0x01,0x00,0x80,0x0E,0x01
        .byte   0x00,0x80,0x11,0x00,0x01,0x80,0x06,0xFF,0x00,0x80,0xED,0xFD,0x00,0x00,0xC7,0xFC
        .byte   0x00,0xC0,0x92,0xFB,0x00,0x80,0x51,0xFA,0x00,0x80,0x03,0xF9,0x00,0x00,0xA9,0xF7
        .byte   0x00,0x40,0x42,0xF6,0x00,0x40,0xD0,0xF4,0x00,0x00,0x53,0xF3,0x00,0x00,0xCB,0xF1
        .byte   0x00,0x40,0x39,0xF0,0xFF,0x3F,0x9E,0xEE,0x00,0x80,0xFA,0xEC,0x00,0xC0,0x4E,0xEB
        .byte   0x00,0xC0,0x9B,0xE9,0x00,0x80,0xE2,0xE7,0x00,0x80,0x23,0xE6,0x00,0xC0,0x5F,0xE4
        .byte   0x00,0x00,0x98,0xE2,0x00,0x40,0xCD,0xE0,0x00,0x40,0x00,0xDF,0x00,0x00,0x32,0xDD
        .byte   0x00,0xC0,0x63,0xDB,0x00,0x00,0x96,0xD9,0x00,0x00,0xCA,0xD7,0x00,0x80,0x00,0xD6
        .byte   0x00,0xC0,0x3A,0xD4,0x00,0xC0,0x79,0xD2,0x00,0x80,0xBE,0xD0,0x00,0xC0,0x09,0xCF
        .byte   0x00,0xC0,0x5C,0xCD,0x00,0x80,0xB8,0xCB,0x00,0x80,0x1D,0xCA,0x00,0x80,0x8D,0xC8
        .byte   0x00,0xC0,0x08,0xC7,0x00,0x80,0x90,0xC5,0x00,0xC0,0x25,0xC4,0x00,0x00,0xC9,0xC2
        .byte   0x00,0x40,0x7B,0xC1,0x00,0x80,0x3D,0xC0,0x00,0x80,0x10,0xBF,0xFF,0xBF,0xF4,0xBD
        .byte   0x00,0x00,0xEB,0xBC,0x00,0x40,0xF4,0xBB,0x00,0x80,0x10,0xBB,0x00,0x00,0x41,0xBA
        .byte   0x00,0xC0,0x85,0xB9,0x00,0x40,0xDF,0xB8,0x00,0x40,0x4E,0xB8,0x00,0x00,0xD3,0xB7
        .byte   0x00,0xC0,0x6D,0xB7,0x00,0x80,0x1E,0xB7,0x00,0x00,0xE6,0xB6,0x00,0x00,0xC4,0xB6
        .byte   0x00,0x80,0x47,0x49


