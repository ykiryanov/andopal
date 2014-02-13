        .text
        .align  4
        .globl  _ippsFIRMRInitAlloc32f_16s


_ippsFIRMRInitAlloc32f_16s:
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
        beq     LBXI6
        cmp     r6, #0
        beq     LBXI6
        cmp     r4, #0
        ble     LBXI5
        cmp     r5, #1
        blt     LBXI3
        cmp     r11, #0
        blt     LBXI2
        cmp     r5, r11
        ble     LBXI2
        cmp     r9, #1
        blt     LBXI3
        cmp     r10, #0
        blt     LBXI2
        cmp     r9, r10
        ble     LBXI2
        cmp     r5, #1
        bne     LBXI0
        cmp     r9, #1
        beq     LBXI4
LBXI0:
        add     r3, sp, #0x18
        mov     r0, r4
        mov     r2, r9
        mov     r1, r5
        bl      _ippsFIRMRGetStateSize32f_16s
        cmp     r0, #0
        addne   sp, sp, #0x1C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [sp, #0x18]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        bne     LBXI1
        mvn     r0, #8
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXI1:
        str     r0, [sp, #0x10]
        str     r8, [sp, #0xC]
        str     r10, [sp, #8]
        str     r9, [sp, #4]
        str     r11, [sp]
        mov     r0, r7
        mov     r3, r5
        mov     r2, r4
        mov     r1, r6
        bl      _ippsFIRMRInit32f_16s
        ldr     r7, [r7]
        mov     r1, #1
        str     r1, [r7, #0x50]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXI2:
        mvn     r0, #0x1B
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXI3:
        mvn     r0, #0x1C
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXI4:
        mov     r0, r7
        mov     r3, r8
        mov     r2, r4
        mov     r1, r6
        bl      _ippsFIRInitAlloc32f_16s
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXI5:
        mvn     r0, #0x19
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBXI6:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


