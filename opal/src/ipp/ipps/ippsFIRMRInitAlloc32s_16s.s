        .text
        .align  4
        .globl  _ippsFIRMRInitAlloc32s_16s


_ippsFIRMRInitAlloc32s_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r7, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        ldr     r8, [sp, #0x4C]
        ldr     r10, [sp, #0x50]
        ldr     r9, [sp, #0x54]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        str     r3, [sp, #0x18]
        beq     LBTV6
        cmp     r5, #0
        beq     LBTV6
        cmp     r4, #0
        ble     LBTV5
        cmp     r7, #1
        blt     LBTV3
        cmp     r11, #0
        blt     LBTV2
        cmp     r7, r11
        ble     LBTV2
        cmp     r8, #1
        blt     LBTV3
        cmp     r10, #0
        blt     LBTV2
        cmp     r8, r10
        ble     LBTV2
        cmp     r7, #1
        bne     LBTV0
        cmp     r8, #1
        beq     LBTV4
LBTV0:
        add     r3, sp, #0x1C
        mov     r0, r4
        mov     r2, r8
        mov     r1, r7
        bl      _ippsFIRMRGetStateSize32s_16s
        cmp     r0, #0
        addne   sp, sp, #0x20
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [sp, #0x1C]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        bne     LBTV1
        mvn     r0, #8
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBTV1:
        str     r0, [sp, #0x14]
        str     r9, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r8, [sp, #8]
        str     r11, [sp, #4]
        str     r7, [sp]
        ldr     r3, [sp, #0x18]
        mov     r0, r6
        mov     r2, r4
        mov     r1, r5
        bl      _ippsFIRMRInit32s_16s
        ldr     r6, [r6]
        mov     r1, #1
        str     r1, [r6, #0x50]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBTV2:
        mvn     r0, #0x1B
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBTV3:
        mvn     r0, #0x1C
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBTV4:
        str     r9, [sp]
        ldr     r3, [sp, #0x18]
        mov     r0, r6
        mov     r2, r4
        mov     r1, r5
        bl      _ippsFIRInitAlloc32s_16s
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBTV5:
        mvn     r0, #0x19
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBTV6:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


