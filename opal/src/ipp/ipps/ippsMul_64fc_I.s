        .text
        .align  4
        .globl  _ippsMul_64fc_I


_ippsMul_64fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        cmp     r0, #0
        mov     r8, r1
        beq     LBEB3
        cmp     r8, #0
        beq     LBEB3
        cmp     r2, #0
        ble     LBEB2
        cmp     r2, #0
        sub     r11, r2, #1
        beq     LBEB1
        str     r0, [sp]
LBEB0:
        ldr     r0, [r8]
        ldr     r12, [sp]
        sub     r11, r11, #1
        str     r0, [sp, #4]
        ldr     r0, [r8, #4]
        str     r0, [sp, #8]
        ldr     r0, [r12]
        ldr     r1, [sp, #8]
        str     r0, [sp, #0xC]
        ldr     r0, [r12, #4]
        ldr     r2, [sp, #0xC]
        str     r0, [sp, #0x10]
        ldr     r4, [r12, #8]
        ldr     r5, [r12, #0xC]
        ldr     r7, [r8, #8]
        ldr     r6, [r8, #0xC]
        ldr     r0, [sp, #4]
        ldr     r3, [sp, #0x10]
        add     r12, r12, #0x10
        str     r12, [sp]
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r2, r4
        mov     r3, r5
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r10
        bl      __subdf3
        mov     r9, r0
        mov     r10, r1
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #8]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        str     r9, [r8]
        str     r10, [r8, #4]
        cmn     r11, #1
        add     r8, r8, #0x10
        bne     LBEB0
LBEB1:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBEB2:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBEB3:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


