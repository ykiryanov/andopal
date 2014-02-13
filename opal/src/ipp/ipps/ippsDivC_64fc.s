        .text
        .align  4
        .globl  _ippsDivC_64fc


_ippsDivC_64fc:
        mov     r12, sp
        stmdb   sp!, {r1 - r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #0xC
        sub     sp, sp, #0x28
        ldr     r7, [r11, #0x10]
        ldr     r8, [r11, #0x14]
        mov     r6, r0
        cmp     r6, #0
        beq     LCHV1
        cmp     r7, #0
        beq     LCHV1
        cmp     r8, #0
        ble     LCHV2
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        ldr     r4, [r11, #8]
        ldr     r5, [r11, #0xC]
        str     r2, [r11, #-0x30]
        str     r3, [r11, #-0x2C]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        mov     r10, r0
        mov     r9, r1
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        mvneq   r0, #9
        beq     LCHV0
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r2, r10
        mov     r3, r9
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r10, r0
        mov     r9, r1
        bl      __muldf3
        str     r0, [r11, #-0x40]
        str     r1, [r11, #-0x3C]
        eor     r1, r5, #2, 2
        mov     r0, r4
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        str     r0, [r11, #-0x38]
        str     r1, [r11, #-0x34]
        mov     r0, sp
        sub     r3, r11, #0x34
        str     r8, [sp, #8]
        str     r7, [sp, #4]
        mov     r1, r3
        mov     r2, #4
        bl      __intel_memcpy
        ldr     r3, [r11, #-0x38]
        ldr     r2, [r11, #-0x3C]
        ldr     r1, [r11, #-0x40]
        mov     r0, r6
        bl      _ippsMulC_64fc
        ldmdb   r11, {r4 - r11, sp, pc}
LCHV0:
        ldmdb   r11, {r4 - r11, sp, pc}
LCHV1:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}
LCHV2:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}


