        .text
        .align  4
        .globl  _ippsThreshold_64fc


_ippsThreshold_64fc:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x14
        ldr     r10, [r11, #4]
        ldr     r6, [r11, #8]
        mov     r5, r0
        cmp     r5, #0
        mov     r7, r1
        mov     r8, r2
        mov     r9, r3
        beq     LARJ9
        cmp     r7, #0
        beq     LARJ9
        cmp     r8, #0
        ble     LARJ10
        mov     r0, r9
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LARJ3
        mov     r0, r9
        mov     r1, r10
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        cmp     r6, #4
        mov     r6, #0
        mov     r4, r1
        mov     r12, r6
        beq     LARJ5
        str     r4, [r11, #-0x38]
        str     r0, [r11, #-0x3C]
        str     r10, [r11, #-0x30]
        str     r9, [r11, #-0x2C]
        str     r8, [r11, #-0x34]
LARJ0:
        ldr     r2, [r5, #8]
        ldr     r3, [r5, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r8, [r5]
        ldr     r4, [r5, #4]
        mov     r10, r0
        mov     r9, r1
        mov     r0, r8
        mov     r1, r4
        mov     r2, r8
        mov     r3, r4
        bl      __muldf3
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [r11, #-0x3C]
        ldr     r3, [r11, #-0x38]
        mov     r10, r0
        mov     r9, r1
        bl      __gedf2
        cmp     r0, #0
        blt     LARJ1
        str     r8, [r7]
        str     r4, [r7, #4]
        ldr     r3, [r5, #8]
        ldr     r2, [r5, #0xC]
        str     r3, [r7, #8]
        str     r2, [r7, #0xC]
        b       LARJ2
LARJ1:
        mov     r0, r10
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LARJ4
        mov     r2, r10
        mov     r3, r9
        ldr     r0, [r11, #-0x3C]
        ldr     r1, [r11, #-0x38]
        bl      __divdf3
        bl      sqrt
        mov     r9, r0
        mov     r10, r1
        mov     r2, r8
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r0, [r5, #8]
        ldr     r1, [r5, #0xC]
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
LARJ2:
        ldr     r2, [r11, #-0x34]
        add     r6, r6, #1
        add     r5, r5, #0x10
        cmp     r6, r2
        add     r7, r7, #0x10
        blt     LARJ0
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LARJ3:
        mvn     r0, #0x12
        ldmdb   r11, {r4 - r11, sp, pc}
LARJ4:
        ldr     r2, [r11, #-0x2C]
        str     r2, [r7]
        ldr     r2, [r11, #-0x30]
        str     r2, [r7, #4]
        mov     r2, #0
        str     r2, [r7, #8]
        str     r2, [r7, #0xC]
        b       LARJ2
LARJ5:
        sub     r7, r7, #4
        str     r0, [r11, #-0x3C]
        str     r8, [r11, #-0x34]
LARJ6:
        ldr     r2, [r5, #8]
        ldr     r3, [r5, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        ldr     r9, [r5]
        ldr     r8, [r5, #4]
        str     r0, [r11, #-0x2C]
        mov     r10, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [r11, #-0x2C]
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r11, #-0x3C]
        mov     r10, r0
        str     r1, [r11, #-0x2C]
        mov     r3, r4
        bl      __ledf2
        cmp     r0, #0
        bgt     LARJ7
        str     r9, [r7, #4]
        str     r8, [r7, #8]
        ldr     r0, [r5, #8]
        ldr     r1, [r5, #0xC]
        b       LARJ8
LARJ7:
        ldr     r3, [r11, #-0x2C]
        ldr     r0, [r11, #-0x3C]
        mov     r2, r10
        mov     r1, r4
        bl      __divdf3
        bl      sqrt
        str     r1, [r11, #-0x2C]
        ldr     r1, [r11, #-0x2C]
        mov     r10, r0
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [r7, #4]
        str     r1, [r7, #8]
        ldr     r0, [r5, #8]
        ldr     r1, [r5, #0xC]
        ldr     r3, [r11, #-0x2C]
        mov     r2, r10
        bl      __muldf3
LARJ8:
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]!
        ldr     r2, [r11, #-0x34]
        add     r6, r6, #1
        add     r5, r5, #0x10
        cmp     r6, r2
        blt     LARJ6
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LARJ9:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}
LARJ10:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}


