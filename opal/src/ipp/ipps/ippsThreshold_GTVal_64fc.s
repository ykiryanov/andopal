        .text
        .align  4
        .globl  _ippsThreshold_GTVal_64fc


_ippsThreshold_GTVal_64fc:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x10
        ldr     r8, [r11, #4]
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r4, r2
        mov     r7, r3
        beq     LAQP6
        cmp     r6, #0
        beq     LAQP6
        cmp     r4, #0
        ble     LAQP5
        mov     r0, r7
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LAQP4
        mov     r0, r7
        mov     r1, r8
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        cmp     r4, #0
        ble     LAQP3
        sub     r10, r6, #4
        str     r1, [r11, #-0x38]
        str     r0, [r11, #-0x34]
LAQP0:
        ldr     r2, [r5]
        str     r2, [r11, #-0x30]
        ldr     r3, [r5, #4]
        mov     r0, r2
        str     r3, [r11, #-0x2C]
        ldr     r8, [r5, #8]
        ldr     r9, [r5, #0xC]
        mov     r1, r3
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        mov     r0, r8
        mov     r2, r8
        mov     r1, r9
        mov     r3, r9
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x38]
        bl      __ledf2
        cmp     r0, #0
        bgt     LAQP1
        ldr     r1, [r11, #-0x30]
        str     r1, [r10, #4]
        ldr     r1, [r11, #-0x2C]
        str     r1, [r10, #8]
        ldr     r12, [r5, #8]
        ldr     lr, [r5, #0xC]
        b       LAQP2
LAQP1:
        ldr     r1, [r11, #8]
        ldr     r3, [r11, #0xC]
        ldr     r12, [r11, #0x10]
        ldr     lr, [r11, #0x14]
        str     r1, [r10, #4]
        str     r3, [r10, #8]
LAQP2:
        str     r12, [r10, #0xC]
        str     lr, [r10, #0x10]!
        subs    r4, r4, #1
        add     r5, r5, #0x10
        bne     LAQP0
LAQP3:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LAQP4:
        mvn     r0, #0x12
        ldmdb   r11, {r4 - r11, sp, pc}
LAQP5:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
LAQP6:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}


