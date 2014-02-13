        .text
        .align  4
        .globl  _ippsFIRMR32s_Direct_16s_ISfs


_ippsFIRMR32s_Direct_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r12, [sp, #0x58]
        ldr     r11, [sp, #0x5C]
        ldr     r10, [sp, #0x60]
        str     r12, [sp, #0x2C]
        ldr     r12, [sp, #0x70]
        ldr     r9, [sp, #0x64]
        ldr     r8, [sp, #0x68]
        ldr     r7, [sp, #0x6C]
        cmp     r0, #0
        str     r0, [sp, #0x30]
        str     r12, [sp, #0x28]
        mov     r5, r1
        mov     r4, r2
        mov     r6, r3
        beq     LCRF4
        cmp     r5, #0
        ble     LCRF3
        cmp     r4, #0
        beq     LCRF4
        cmp     r6, #0
        ble     LCRF2
        cmp     r11, #0
        ble     LCRF1
        cmp     r9, #0
        ble     LCRF1
        cmp     r10, #0
        blt     LCRF0
        cmp     r11, r10
        ble     LCRF0
        cmp     r8, #0
        blt     LCRF0
        cmp     r9, r8
        ble     LCRF0
        cmp     r7, #0
        beq     LCRF4
        mul     r0, r5, r9
        str     r0, [sp, #0x20]
        bl      _ippsMalloc_16s
        cmp     r0, #0
        str     r0, [sp, #0x24]
        beq     LCRF5
        ldr     r2, [sp, #0x20]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x24]
        bl      _ippsCopy_16s
        ldr     r0, [sp, #0x28]
        str     r7, [sp, #0x18]
        str     r8, [sp, #0x14]
        str     r0, [sp, #0x1C]
        str     r9, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r11, [sp, #8]
        ldr     r0, [sp, #0x2C]
        str     r6, [sp]
        mov     r3, r4
        str     r0, [sp, #4]
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x24]
        mov     r2, r5
        bl      _ippsFIRMR32s_Direct_16s_Sfs
        mov     r4, r0
        ldr     r0, [sp, #0x24]
        bl      _ippsFree
        mov     r0, r4
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRF0:
        mvn     r0, #0x1B
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRF1:
        mvn     r0, #0x1C
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRF2:
        mvn     r0, #0x19
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRF3:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRF4:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LCRF5:
        mvn     r0, #8
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}


