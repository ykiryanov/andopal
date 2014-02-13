        .text
        .align  4
        .globl  _ippsMulC_64fc_I


_ippsMulC_64fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        str     r0, [sp, #0x10]
        ldr     r11, [sp, #0x44]
        str     r1, [sp, #0x14]
        ldr     r0, [sp, #0x48]
        str     r2, [sp, #0x18]
        cmp     r11, #0
        str     r3, [sp, #0x1C]
        beq     LBEL3
        cmp     r0, #0
        ble     LBEL2
        cmp     r0, #0
        sub     r10, r0, #1
        beq     LBEL1
        ldr     r7, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
LBEL0:
        ldr     r0, [r11]
        mov     r2, r7
        mov     r3, r6
        str     r0, [sp]
        ldr     r1, [r11, #4]
        sub     r10, r10, #1
        str     r1, [sp, #4]
        ldr     r1, [sp, #4]
        ldr     r8, [r11, #8]
        ldr     r9, [r11, #0xC]
        bl      __muldf3
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mov     r2, r5
        mov     r3, r4
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0xC]
        mov     r2, r0
        ldr     r0, [sp, #8]
        bl      __subdf3
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #4]
        str     r1, [sp]
        mov     r0, r8
        mov     r1, r9
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __adddf3
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r0, [sp, #0xC]
        cmn     r10, #1
        str     r0, [r11]
        ldr     r0, [sp, #8]
        str     r0, [r11, #4]
        add     r11, r11, #0x10
        bne     LBEL0
LBEL1:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBEL2:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBEL3:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


