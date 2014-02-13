        .text
        .align  4
        .globl  _ippsFIRMRInitAlloc32fc_16sc


_ippsFIRMRInitAlloc32fc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r11, [sp, #0x40]
        ldr     r9, [sp, #0x44]
        ldr     r10, [sp, #0x48]
        ldr     r8, [sp, #0x4C]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r4, r2
        mov     r5, r3
        beq     LBXH6
        cmp     r6, #0
        beq     LBXH6
        cmp     r4, #0
        ble     LBXH5
        cmp     r5, #1
        blt     LBXH3
        cmp     r11, #0
        blt     LBXH2
        cmp     r5, r11
        ble     LBXH2
        cmp     r9, #1
        blt     LBXH3
        cmp     r10, #0
        blt     LBXH2
        cmp     r9, r10
        ble     LBXH2
        cmp     r5, #1
        bne     LBXH0
        cmp     r9, #1
        beq     LBXH4
LBXH0:
        add     r3, sp, #0x18
        mov     r0, r4
        mov     r2, r9
        mov     r1, r5
        bl      _ippsFIRMRGetStateSize32fc_16sc
        cmp     r0, #0
        addne   sp, sp, #0x1C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [sp, #0x18]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        bne     LBXH1
        mvn     r0, #8
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXH1:
        str     r0, [sp, #0x10]
        str     r8, [sp, #0xC]
        str     r10, [sp, #8]
        str     r9, [sp, #4]
        str     r11, [sp]
        mov     r0, r7
        mov     r3, r5
        mov     r2, r4
        mov     r1, r6
        bl      _ippsFIRMRInit32fc_16sc
        ldr     r7, [r7]
        mov     r1, #1
        str     r1, [r7, #0x50]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXH2:
        mvn     r0, #0x1B
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXH3:
        mvn     r0, #0x1C
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXH4:
        mov     r0, r7
        mov     r3, r8
        mov     r2, r4
        mov     r1, r6
        bl      _ippsFIRInitAlloc32fc_16sc
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXH5:
        mvn     r0, #0x19
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXH6:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


