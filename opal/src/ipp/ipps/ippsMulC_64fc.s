        .text
        .align  4
        .globl  _ippsMulC_64fc


_ippsMulC_64fc:
        mov     r12, sp
        stmdb   sp!, {r1 - r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #0xC
        sub     sp, sp, #0x18
        ldr     r1, [r11, #0x10]
        ldr     r2, [r11, #0x14]
        cmp     r0, #0
        beq     LBEM3
        cmp     r1, #0
        beq     LBEM3
        cmp     r2, #0
        ble     LBEM2
        cmp     r2, #0
        sub     r10, r2, #1
        beq     LBEM1
        ldr     r7, [r11]
        ldr     r6, [r11, #4]
        ldr     r5, [r11, #8]
        ldr     r4, [r11, #0xC]
        str     r1, [r11, #-0x40]
        str     r0, [r11, #-0x3C]
LBEM0:
        ldr     r12, [r11, #-0x3C]
        mov     r2, r7
        mov     r3, r6
        ldr     r0, [r12]
        sub     r10, r10, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r12, #4]
        str     r0, [r11, #-0x34]
        ldr     r8, [r12, #8]
        ldr     r9, [r12, #0xC]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        add     r12, r12, #0x10
        str     r12, [r11, #-0x3C]
        bl      __muldf3
        str     r1, [r11, #-0x2C]
        str     r0, [r11, #-0x30]
        mov     r2, r5
        mov     r3, r4
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        ldr     r1, [r11, #-0x2C]
        ldr     r0, [r11, #-0x30]
        bl      __subdf3
        str     r0, [r11, #-0x2C]
        str     r1, [r11, #-0x30]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r11, #-0x34]
        str     r1, [r11, #-0x38]
        mov     r0, r8
        mov     r1, r9
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x38]
        bl      __adddf3
        ldr     r12, [r11, #-0x40]
        cmn     r10, #1
        str     r0, [r12, #8]
        str     r1, [r12, #0xC]
        ldr     r0, [r11, #-0x2C]
        str     r0, [r12]
        ldr     r0, [r11, #-0x30]
        str     r0, [r12, #4]
        add     r12, r12, #0x10
        str     r12, [r11, #-0x40]
        bne     LBEM0
LBEM1:
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LBEM2:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
LBEM3:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}


